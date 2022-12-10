local _G = _G
local IRF3 = _G[...]
local ipairs = _G.ipairs
local UnitAura = _G.UnitAura
local usedIndex = {}
local indexSpellInfo = {}
local indexSpellName = {}
local isHaveDebuff = false
local delimiter = ","
local numberFont = IRF3:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
local numberFontWidth = {}
local SL = IRF3.GetSpellName
local blockSpellID = {	}	--[SL(65148)] = 65148,	}	--성스러운 보호막(6초 버프)

local ePos = { "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT", "LEFT", "RIGHT", "TOPLEFT", "TOP", "TOPRIGHT", "CENTER" }
local eFilter = { "HELPFUL PLAYER", "HARMFUL PLAYER", "HELPFUL", "HARMFUL" }

function IRF3:UpdateSpellTimerFont()
	for _, header in pairs(IRF3.headers) do
		for _, member in pairs(header.members) do
			for i = 1, 8 do
				local frame = member["spellTimer"..i]
				frame.count:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.spellTimerCountFont.file), IRF3.db.spellTimerCountFont.size, IRF3.db.spellTimerCountFont.attribute)
				frame.count:SetTextColor(IRF3.db.colors.spellTimerCount[1], IRF3.db.colors.spellTimerCount[2], IRF3.db.colors.spellTimerCount[3])
				frame.count:SetShadowColor(0, 0, 0)
				frame.count:SetShadowOffset(1, -1)
				frame.count:SetPoint("TOPLEFT", frame.icon, "TOPLEFT", 1, 1)
				frame.timer:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.spellTimerFont.file), IRF3.db.spellTimerFont.size, IRF3.db.spellTimerFont.attribute)
				frame.timer:SetTextColor(IRF3.db.colors.spellTimer[1], IRF3.db.colors.spellTimer[2], IRF3.db.colors.spellTimer[3])
				frame.timer:SetShadowColor(0, 0, 0)
				frame.timer:SetShadowOffset(1, -1)
				frame.timer:ClearAllPoints()
				if IRF3.db.enableSpellTimerType1 then
					frame.timer:SetPoint("BOTTOMRIGHT", frame.icon, "BOTTOMRIGHT", 1, -1)
				else
					frame.timer:SetPoint("LEFT", frame.icon, "RIGHT", 2, 0)
				end
				if not frame.initScale then
					frame:SetScale(InvenRaidFrames3CharDB.spellTimer[i].scale)				
					frame.initScale = InvenRaidFrames3CharDB.spellTimer[i].scale
				elseif frame.index then
					frame:SetScale(InvenRaidFrames3CharDB.spellTimer[frame.index].scale)
				end
				frame.STFadeStartTime = {}
			end
		end
	end
	for _, member in pairs(IRF3.petHeader.members) do
		for i = 1, 8 do
			local frame = member["spellTimer"..i]
			frame.count:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.spellTimerCountFont.file), IRF3.db.spellTimerCountFont.size, IRF3.db.spellTimerCountFont.attribute)
			frame.count:SetTextColor(IRF3.db.colors.spellTimerCount[1], IRF3.db.colors.spellTimerCount[2], IRF3.db.colors.spellTimerCount[3])
			frame.count:SetShadowColor(0, 0, 0)
			frame.count:SetShadowOffset(1, -1)
			frame.count:SetPoint("TOPLEFT", frame.icon, "TOPLEFT", 1, 1)
			frame.timer:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.spellTimerFont.file), IRF3.db.spellTimerFont.size, IRF3.db.spellTimerFont.attribute)
			frame.timer:SetTextColor(IRF3.db.colors.spellTimer[1], IRF3.db.colors.spellTimer[2], IRF3.db.colors.spellTimer[3])
			frame.timer:SetShadowColor(0, 0, 0)
			frame.timer:SetShadowOffset(1, -1)
			frame.timer:ClearAllPoints()
			if IRF3.db.enableSpellTimerType1 then
				frame.timer:SetPoint("BOTTOMRIGHT", frame.icon, "BOTTOMRIGHT", 1, -1)
			else
				frame.timer:SetPoint("LEFT", frame.icon, "RIGHT", 2, 0)
			end
			if not frame.initScale then
				frame:SetScale(InvenRaidFrames3CharDB.spellTimer[i].scale)
				frame.initScale = InvenRaidFrames3CharDB.spellTimer[i].scale
			elseif frame.index then
				frame:SetScale(InvenRaidFrames3CharDB.spellTimer[frame.index].scale)
			end
			frame.STFadeStartTime = {}
		end
	end
	for i = 1, 5 do
		numberFont:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.font.file), IRF3.db.font.size, IRF3.db.font.attribute)
		numberFont:SetText(strrep("0", i))
		numberFont:SetShadowColor(0, 0, 0)
		numberFont:SetShadowOffset(1, -1)
		numberFontWidth[i] = ceil(numberFont:GetWidth()) + 1
	end
end

function IRF3:UpdateSpellTimerWidth()
	for index, header in pairs(IRF3.headers) do
		for _, member in pairs(header.members) do
			if member:IsShown() then
				InvenRaidFrames3Member_UpdateSpellTimer(member)
			end
		end
	end
	for _, member in pairs(IRF3.petHeader.members) do
		for i = 1, 8 do
			if member:IsShown() then
				InvenRaidFrames3Member_UpdateSpellTimer(member)
			end
		end
	end
end

local function PrintFadeCount(button)
	if not button.debugPrintValue2 then
		button.debugPrintValue2 = 0
	end
	if not button.STFadeCount then
		button.STFadeCount = 0
	end
	if button.debugPrintValue2 ~= button.STFadeCount then
		button.debugPrintValue2 = button.STFadeCount
		--print("SpellTimer = " .. button:GetParent():GetID() .. "-"  .. button:GetID() .. "   " .. button.STFadeCount)
	end
end

local function onUpdateIconTimer(self, opt)
	if opt == 4 or opt == 5 then
		self.timeLeft = GetTime() - self.startTime
	else
		self.timeLeft = self.expirationTime - GetTime()
	end
	if self.timeLeft > 100 then
		if self.noIcon then
			self.timer:SetText("●")
		else
			self.timer:SetText("")
		end
	else
		self.timer:SetFormattedText("%d", self.timeLeft + 0.5)
	end
	if IRF3.db.enableSpellTimerType1 then
		self:SetWidth((self.noIcon and 0 or 13))
	else
		self:SetWidth((numberFontWidth[(self.timer:GetText() or ""):len()] or 0) + (self.noIcon and 0 or 13))
	end
end

local function DelFade(frame)
	if frame then
		frame:SetScale(frame.initScale)	-- 20220426 커진 상태로 노출되던 문제 수정
		if frame.STFadeticker then
			frame.STFadeticker:Cancel()
			frame.STFadeticker = nil
		end
	end
end

local function onFadeIn(frame)
	local tickLeft = GetTime() - (frame.tickStartTime or 0)
	
	if (tickLeft) < 0.30 then	-- 0.5초 연출		
		local nowScale = 1.0 + math.sin((tickLeft) * 10.0)
		if nowScale > 0.50 then
			frame:SetScale(frame.initScale * nowScale)
			return
		end
	end
	
	DelFade(frame)	
end

local function AddFade(self, frame, spellId, startTime)
	local spellCode = spellId .. startTime
	if frame.spellCode and frame.spellCode ~= spellCode then
		self.STFadeStartTime[frame.spellCode] = nil
		self.STFadeCount = (self.STFadeCount or 0) - 1
	end
	frame.spellCode = spellCode
	if not self.STFadeStartTime then
		self.STFadeStartTime = {}
	end
	if not self.STFadeStartTime[frame.spellCode] or (startTime ~= 0) then
		if not self.STFadeStartTime[frame.spellCode] then
			self.STFadeCount = (self.STFadeCount or 0) + 1
		end
		self.STFadeStartTime[frame.spellCode] = startTime
		if self.STFadeStartTime[frame.spellCode] == 0 then
			self.STFadeStartTime[frame.spellCode] = GetTime()
		end							
	end
	frame.tickStartTime = self.STFadeStartTime[frame.spellCode]	
	if not frame.STFadeticker then
		frame.STFadeticker = C_Timer.NewTicker(0.01, function() onFadeIn(frame) end)
		onFadeIn(frame)
	end
end

local function setIcon(self, index, duration, expirationTime, icon, count, spellId)
	if not self then
		return
	end
	self.spellId = spellId
	self.index = index
	if self and index then
		if InvenRaidFrames3CharDB.spellTimer[index].display == 1 then
			-- 아이콘 + 남은 시간
			self.noIcon = nil
			self.noLeft = nil
			self.icon:SetWidth(13)
			self.icon:SetTexture(icon)
			self.count:SetText(count and count > 1 and count or "")
		elseif InvenRaidFrames3CharDB.spellTimer[index].display == 2 then
			-- 아이콘
			self.noIcon = nil
			self:SetWidth(13)
			self.icon:SetWidth(13)
			self.icon:SetTexture(icon)
			self.count:SetText(count and count > 1 and count or "")
			duration = nil
		elseif InvenRaidFrames3CharDB.spellTimer[index].display == 3 then
			-- 남은 시간
			self.noIcon = true
			self.icon:SetWidth(0.001)
			self.icon:SetTexture(nil)
			self.count:SetText(nil)
		elseif InvenRaidFrames3CharDB.spellTimer[index].display == 4 then
			-- 아이콘 + 경과 시간
			self.noIcon = nil
			self.icon:SetWidth(13)
			self.icon:SetTexture(icon)
			self.count:SetText(count and count > 1 and count or "")
		else
			-- 경과 시간
			self.noIcon = true
			self.noLeft = true
			self.icon:SetWidth(0.001)
			self.icon:SetTexture(nil)
			self.count:SetText(nil)
		end
		if duration and duration > 0 and expirationTime then
			self.startTime = expirationTime - duration
			self.expirationTime = expirationTime
			if not self.spellticker then
				self.spellticker = C_Timer.NewTicker(0.5, function() onUpdateIconTimer(self, InvenRaidFrames3CharDB.spellTimer[index].display) end)
			end
			onUpdateIconTimer(self, InvenRaidFrames3CharDB.spellTimer[index].display)
			
			self.initScale = InvenRaidFrames3CharDB.spellTimer[index].scale
			if IRF3.db.enableFadeIn then
				AddFade(self:GetParent(), self, spellId, self.startTime)
			end
		else
			self:SetWidth(self.icon:GetWidth() + self.count:GetWidth()) -- add. 재사용된 frame이 width 값이 이전 값에 영향 받는다.
			
			DelFade(self)
			if self.spellCode then
				if self:GetParent().STFadeStartTime[self.spellCode] then
					self:GetParent().STFadeStartTime[self.spellCode] = nil
					self:GetParent().STFadeCount = self:GetParent().STFadeCount - 1
				end
			end
			
			if self.spellticker then --정상적으로 주문 타이머 만료 시 타이머 삭제
				self.spellticker:Cancel()
				self.spellticker = nil
				self.spellId, self.index = nil, nil
			end
			self.expirationTime, self.timeLeft = nil, nil
			if self.noIcon then
				self.timer:SetText("●")
			else
				self.timer:SetText("")
			end
		end
		self:Show()
	elseif self and self:IsShown() then
		DelFade(self)
		if self.spellCode then
			if self:GetParent().STFadeStartTime[self.spellCode] then
				self:GetParent().STFadeStartTime[self.spellCode] = nil
				self:GetParent().STFadeCount = self:GetParent().STFadeCount - 1
			end
		end
		
		if self.spellticker then
			self.spellticker:Cancel()
			self.spellticker = nil
		end
		self.expirationTime, self.timeLeft, self.noIcon, self.spellId, self.index = nil, nil, nil, nil, nil
		self:Hide()
	end
end

local function UnitAuraName(unit, spell, filter)
    --return AuraUtil.FindAuraByName(spell, unit, filter)
	return InvenRaidFrames3Member_UnitAura(spell, unit, filter)
end

local function initSortTable(self)
	if self.nowPos then
		table.wipe(self.nowPos)
	end
	self.nowPos = {}
	
	if self.nowWidth then
		table.wipe(self.nowWidth)
	end
	self.nowWidth = {}
	
	if self.centerIndex then
		table.wipe(self.centerIndex)
	end
	self.centerIndex = {}
end

local function nextIndex(self)
	local isFind = false
	for index = 1, 8 do
		local frame = self["spellTimer"..index]
		if frame and not frame.spellId then
			return index
		end
	end
	return nil
end

local function setSort(self, frame, index)	-- frame = spellTimer
	local posName = InvenRaidFrames3CharDB.spellTimer[index].pos
	frame:SetScale(InvenRaidFrames3CharDB.spellTimer[index].scale)
	frame.initScale = InvenRaidFrames3CharDB.spellTimer[index].scale
	frame:ClearAllPoints()
	if posName == "RIGHT" or posName == "TOPRIGHT" or posName == "BOTTOMRIGHT" then
		if self.nowPos[posName] then
			frame:SetPoint(posName, self.nowPos[posName], posName, -frame:GetWidth(), 0)
		else
			frame:SetPoint(posName, 0, 0)
		end
	elseif posName == "LEFT" or posName == "TOPLEFT" or posName == "BOTTOMLEFT" then
		if self.nowPos[posName] then
			frame:SetPoint(posName, self.nowPos[posName], posName, frame:GetWidth(), 0)
		else
			frame:SetPoint(posName, 0, 0)
		end
	elseif posName == "CENTER" or posName == "TOP" or posName == "BOTTOM" then
		if self.nowPos[posName] then
			frame:SetPoint(posName, self.nowPos[posName], posName, frame:GetWidth(), 0)
			self.nowPos[posName .. "Head"]:SetPoint(posName, self.nowWidth[posName] / 2, 0)			
		else
			frame:SetPoint(posName, 0, 0)
			self.nowPos[posName .. "Head"] = frame
		end
		self.nowWidth[posName] = (self.nowWidth[posName] or 0) - frame:GetWidth()
	end
	self.nowPos[posName] = frame
end

local function allFind(self, filter)
	IRF3:ForEachAura(self.displayedUnit, filter, nil, 
		function(name, icon, count, _, duration, expirationTime, caster, _, _, spellId)
			local nNextIndex = nextIndex(self)
			if not nNextIndex then
				return false
			end
			if name then
				if indexSpellName[name] then
					local index = indexSpellName[name]
					if indexSpellInfo[index] and indexSpellInfo[index][name] then
						local spell = indexSpellInfo[index][name]
						if spell[1] == name then
							local frame = self["spellTimer" .. nNextIndex]
							local filterNum = spell[3]
							if filterNum > 2 or (caster == "player") then	-- UnitBuff 호출 할 때 필터는 생략했다. 버프인지 디버프인지 비교 안했음.
								setIcon(frame, index, duration, expirationTime, icon, count, spellId)
								setSort(self, frame, index)
							end							
						end
					end
				end
				return true
			end
			return false
		end
	)
end

function InvenRaidFrames3Member_UpdateSpellTimer(self)
	if not IRF3.isClassic and UnitInRaid(self.unit) then
		InvenRaidFrames3Member_NewUpdateSpellTimer(self)
		return
	end
	
	if not self or not self.displayedUnit then
		return
	end
	initSortTable(self)
	
	for removeIndex = 1, 8 do	
		setIcon(self["spellTimer" .. removeIndex])
	end
	
	allFind(self, "HELPFUL")
	if isHaveDebuff then		-- 디버프까지 사용하는 경우가 적으므로 미리 체크해두자.
		allFind(self, "HARMFUL")
	end
--~ 	for removeIndex = nextIndex(self) or 8, 8 do	-- 초기화 된 상태로 순차적으로 셋팅해서 나머지 다시 초기화 할 필요없어졌다.
--~ 		setIcon(self["spellTimer" .. removeIndex])
--~ 	end
end

local function allNewFind(self, filter)
	for auraInstanceID, aura in pairs(self.PlayerAuras) do
		local name = aura.name
		local icon = aura.icon
		local count = aura.applications
		local duration = aura.duration
		local expirationTime = aura.expirationTime
		local caster = aura.sourceUnit
		local spellId = aura.spellId
		local isHelpful = aura.isHelpful
		local isHarmful = aura.isHarmful
		local nNextIndex = nextIndex(self)
		if not nNextIndex then
			return true
		end
		if name then
			if indexSpellName[name] then
				local index = indexSpellName[name]
				if indexSpellInfo[index] and indexSpellInfo[index][name] then
					local spell = indexSpellInfo[index][name]
					if spell[1] == name then
						local frame = self["spellTimer" .. nNextIndex]
						local filterNum = spell[3]
						if filterNum > 2 or (caster == "player") then	-- UnitBuff 호출 할 때 필터는 생략했다. 버프인지 디버프인지 비교 안했음.
							if ((filterNum == 1 or filterNum == 3) and isHelpful) or ((filterNum == 2 or filterNum == 4) and isHarmful) then
								setIcon(frame, index, duration, expirationTime, icon, count, spellId)
								setSort(self, frame, index)	
							end	
						end
					end
				end
			end
		end
	end
end

function InvenRaidFrames3Member_NewUpdateSpellTimer(self)
	if not self or not self.displayedUnit then
		return
	end
	
	if not self.PlayerAuras then
		self.PlayerAuras = {}
	end
	
	initSortTable(self)
	
	for removeIndex = 1, 8 do	
		setIcon(self["spellTimer" .. removeIndex])
	end
	
	allNewFind(self)
end

function IRF3:BuildSpellTimerList()
	table.wipe(usedIndex)
	table.wipe(indexSpellInfo)
	table.wipe(indexSpellName)
	indexSpellName = {}
	isHaveDebuff = false
	
	for i = 1, #InvenRaidFrames3CharDB.spellTimer do
		if eFilter[InvenRaidFrames3CharDB.spellTimer[i].use] and InvenRaidFrames3CharDB.spellTimer[i].name then
			table.insert(usedIndex, i)
			local spells = {}
			spells[1], spells[2], spells[3], spells[4], spells[5], spells[6], spells[7], spells[8], spells[9] = delimiter:split(InvenRaidFrames3CharDB.spellTimer[i].name)
			indexSpellInfo[i] = {}
			for _, spell in ipairs(spells) do
				local info = {spell:trim(), eFilter[InvenRaidFrames3CharDB.spellTimer[i].use], InvenRaidFrames3CharDB.spellTimer[i].use}
				--table.insert(indexSpellInfo[i], info)
				if tonumber(info[1]) then	-- type(name) == "number" 가 안먹혀서 변경
					info[1] = GetSpellInfo(tonumber(info[1]))
				end
				indexSpellInfo[i][info[1]] = info
				indexSpellName[info[1]] = i
				if InvenRaidFrames3CharDB.spellTimer[i].use == 2 or InvenRaidFrames3CharDB.spellTimer[i].use == 4 then
					isHaveDebuff = true
				end
			end
		end
	end
end

function IRF3:SetupSpellTimer(reset)
	if not reset and InvenRaidFrames3CharDB.spellTimer and #InvenRaidFrames3CharDB.spellTimer == 8 then return end
	if InvenRaidFrames3CharDB and InvenRaidFrames3CharDB.spellTimer and #InvenRaidFrames3CharDB.spellTimer > 8 then
		local size = #InvenRaidFrames3CharDB.spellTimer
		print("IRF3: 주문 타이머가 " .. size .. "개나 저장되어 있습니다. 8개로 수정하였습니다.")
		for i = 9, size do
			InvenRaidFrames3CharDB.spellTimer[i] = {}
		end	
		local count = size
		for i = 9, size do
			InvenRaidFrames3CharDB.spellTimer[count] = nil
			count = count - 1
		end
		return
	end
	InvenRaidFrames3CharDB.spellTimer = InvenRaidFrames3CharDB.spellTimer or {}
	for i = 1, 8 do
		InvenRaidFrames3CharDB.spellTimer[i] = InvenRaidFrames3CharDB.spellTimer[i] or {}
		InvenRaidFrames3CharDB.spellTimer[i].use = 0		-- 1:내가 시전한 버프 2:내가 시전한 디버프 3:모든 버프 4:모든 디버프 0:사용 안함
		InvenRaidFrames3CharDB.spellTimer[i].display = 1	-- 1:아이콘 + 남은 시간 2:아이콘 3:남은 시간 4:아이콘 + 경과 시간 5:경과 시간
		InvenRaidFrames3CharDB.spellTimer[i].scale = 1
		InvenRaidFrames3CharDB.spellTimer[i].pos = ePos[i]
	end

	if self.playerClass == "ROGUE" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(57934)	-- 속임수 거래
	elseif self.playerClass == "PRIEST" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(139)	-- 소생
		InvenRaidFrames3CharDB.spellTimer[2].use = 3
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(17)	-- 신의 권능: 보호막
		InvenRaidFrames3CharDB.spellTimer[3].use = 4
		InvenRaidFrames3CharDB.spellTimer[3].name = SL(6788)	-- 약화된 영혼
		InvenRaidFrames3CharDB.spellTimer[4].use = 1
		InvenRaidFrames3CharDB.spellTimer[4].name = SL(194384)	-- 속죄
	elseif self.playerClass == "HUNTER" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(34477)	-- 눈속임
	elseif self.playerClass == "DRUID" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(33763)	-- 피어나는 생명
		InvenRaidFrames3CharDB.spellTimer[2].use = 1
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(774)	-- 회복
		InvenRaidFrames3CharDB.spellTimer[3].use = 1
		InvenRaidFrames3CharDB.spellTimer[3].name = SL(8936)	-- 재생
		InvenRaidFrames3CharDB.spellTimer[4].use = 1
		InvenRaidFrames3CharDB.spellTimer[4].name = SL(48438)	-- 급속 성장
		InvenRaidFrames3CharDB.spellTimer[5].use = 1
		InvenRaidFrames3CharDB.spellTimer[5].name = SL(155777)	-- 회복 (싹틔우기)
	elseif self.playerClass == "SHAMAN" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(61295)	-- 성난 해일
		InvenRaidFrames3CharDB.spellTimer[1].pos = "BOTTOMRIGHT"
		InvenRaidFrames3CharDB.spellTimer[2].use = 1
if not IRF3.isClassic then
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(974)..","..SL(52127)..","..SL(192106)	-- 대지의 보호막, 물의 보호막 52127, 번개 보호막 192106
else		
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(974)..","..SL(24398)..","..SL(10432)	-- 대지의 보호막, 물의 보호막 52127, 번개 보호막 192106
end
		InvenRaidFrames3CharDB.spellTimer[2].pos = "BOTTOM"
		InvenRaidFrames3CharDB.spellTimer[3].use = 1
		InvenRaidFrames3CharDB.spellTimer[3].name = SL(157504)..","..SL(192082)..","..SL(325174)..","..SL(207498)..","..SL(320763) -- 폭우의 토템,바람 질주,정신의 고리 토템,선조의 보호,마나 해일 토템
		InvenRaidFrames3CharDB.spellTimer[3].pos = "TOPLEFT"
	elseif self.playerClass == "PALADIN" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 3
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(53563)..","..SL(156910)	-- 빛의 봉화, 신념의 봉화
		InvenRaidFrames3CharDB.spellTimer[2].use = 1
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(1022)..","..SL(1044)..","..SL(6940)..","..SL(1038)	-- 보호의 손길, 자유의 손길, 희생의 손길, 구원의 손길
	elseif self.playerClass == "MONK" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(124682)	-- 포용의 안개
		InvenRaidFrames3CharDB.spellTimer[2].use = 1
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(119611)	-- 소생의 안개 115151
		InvenRaidFrames3CharDB.spellTimer[3].use = 1
		InvenRaidFrames3CharDB.spellTimer[3].name = SL(191840)	-- 정수의 샘
	elseif self.playerClass == "EVOKER" then
		InvenRaidFrames3CharDB.spellTimer[1].use = 1
		InvenRaidFrames3CharDB.spellTimer[1].name = SL(366155)	-- 되감기
		InvenRaidFrames3CharDB.spellTimer[1].pos = "BOTTOMLEFT"
		InvenRaidFrames3CharDB.spellTimer[2].use = 1
		InvenRaidFrames3CharDB.spellTimer[2].name = SL(363502)	-- 꿈의 비행
		InvenRaidFrames3CharDB.spellTimer[2].pos = "BOTTOMRIGHT"
		InvenRaidFrames3CharDB.spellTimer[3].use = 1
		InvenRaidFrames3CharDB.spellTimer[3].name = SL(355941)	-- 꿈의 숨결
		InvenRaidFrames3CharDB.spellTimer[3].pos = "BOTTOM"
	end
end