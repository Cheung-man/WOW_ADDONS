
local _G = _G

local IRF3 = _G[...]
local GetTime = _G.GetTime
local PlaySoundFile = _G.PlaySoundFile
local SM = LibStub("LibSharedMedia-3.0")
local LRD = LibStub("LibRealDispel-1.0")

local ignoreAuraId = {}
local ignoreAuraName = {}
local bossAuraId = {}
local bossAuraName = {}

local dispelTypes = { Magic = "Magic", Curse = "Curse", Disease = "Disease", Poison = "Poison" }
local lastTime =  0
local ENUM_TIME = 0.5

local function DelFade(icon)
	if icon then
		icon:SetScale(1)
		if icon.debuffFadeticker then
			icon.debuffFadeticker:Cancel()
			icon.debuffFadeticker = nil
		end
	end
end

local function hideIcon(icon)
	if icon then		
		if icon.spellticker then
			icon.spellticker:Cancel()
			icon.spellticker = nil
		end
		icon.expirationTime, icon.timeLeft, icon.noIcon = nil, nil, nil
		if icon.timer then
			icon.timer:SetText("")
		end
		
		DelFade(icon)
		
		icon:SetSize(0.001, 0.001)
		icon:Hide()
		icon.startTime = nil
		if icon.spellCode then
			icon:GetParent().DebuffFadeStartTime[icon.spellCode] = nil
			icon.spellCode = nil
		end		
		
		--
		if GameTooltip:IsOwned(icon) then
			GameTooltip:Hide()
		end
		--
	end
end

local function bossAuraOnUpdate(self, opt)
	if opt == 1 then
		if (self.endTime - GetTime()) > 2.5 then
		self.timerParent.text:SetFormattedText("%d", self.endTime - GetTime() + 0.5)
		else
			self.timerParent.text:SetFormattedText("|cffff0000%.1f|r", self.endTime - GetTime() + 0.5)
		end
	elseif opt == 2 then
		self.timerParent.text:SetFormattedText("%d", GetTime() - self.startTime)
	else
		self.timerParent.text:SetText("")
	end
end

local function onFadeIn(icon)
	local tickLeft = GetTime() - (icon.tickStartTime or 0)
	
	if (tickLeft) < ENUM_TIME then	-- 0.5초 연출		
		local nowScale = 1.0 + math.sin((tickLeft) * 10.0)
		if nowScale > 0.99 then
			icon:SetScale(nowScale)
			return
		end
	end
	
	DelFade(icon)	
end

local function AddFade(self, icon, spellId, startTime, name)
	if startTime == 0 then
		local spellCode = name
		if spellCode then
			spellCode = spellCode
		else
			spellCode = spellId
		end
		icon.spellCode = spellCode
		if not self.DebuffFadeStartTime then
			self.DebuffFadeStartTime = {}
		end
		if not self.DebuffFadeStartTime[icon.spellCode] then
			self.DebuffFadeStartTime[icon.spellCode] = GetTime()
		end
		icon.tickStartTime = self.DebuffFadeStartTime[icon.spellCode]	
	else
		icon.tickStartTime = startTime
	end
	if not icon.debuffFadeticker then
		icon.debuffFadeticker = C_Timer.NewTicker(0.01, function() onFadeIn(icon) end)
		onFadeIn(icon)
	end
end

local function onUpdateIconTimer(self)
	self.timeLeft = self.expirationTime - GetTime()

	if self.timeLeft > 100 or self.timeLeft <= 0 then
		if self.noIcon then
			self.timer:SetText("●")
		else
			self.timer:SetText("")
		end
	else
		self.timer:SetFormattedText("%d", self.timeLeft + 0.5)
	end
end

function IRF3:BuildAuraList()
	table.wipe(ignoreAuraId)
	table.wipe(ignoreAuraName)
	table.wipe(bossAuraId)
	table.wipe(bossAuraName)
	for spellid in pairs(IRF3.ignoreAura) do
		if IRF3.db.ignoreAura[spellid] ~= false then
			ignoreAuraId[spellid] = true
		end
	end
	for spell, v in pairs(IRF3.db.ignoreAura) do
		if v == true then
			if type(spell) == "number" then
				ignoreAuraId[spell] = true
			else
				ignoreAuraName[spell] = true
			end
		end
	end
	for spellid2 in pairs(IRF3.bossAura) do
		if (IRF3.db.userAura[spellid2] ~= false) and not ignoreAuraId[spellid2] then
			bossAuraId[spellid2] = true
		end
	end
	for spell2, v in pairs(IRF3.db.userAura) do
		if (v == true) and not ignoreAuraId[spell2] and not ignoreAuraName[spell2] then
			if type(spell2) == "number" then
				bossAuraId[spell2] = true
			else
				bossAuraName[spell2] = true
			end
		end
	end
end

function InvenRaidFrames3Member_SetAuraFont(self)
	self.bossAura.count:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.font.file), IRF3.db.font.size, "THINOUTLINE")
	self.bossAura.count:SetShadowColor(0, 0, 0)
	self.bossAura.count:SetShadowOffset(1, -1)
	self.bossAura.timerParent.text:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.font.file), IRF3.db.font.size, "THINOUTLINE")
	self.bossAura.timerParent.text:SetShadowColor(0, 0, 0)
	self.bossAura.timerParent.text:SetShadowOffset(1, -1)
	for i = 1, 5 do
		local debuffIcon = self["debuffIcon"..i]
		debuffIcon.count:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.font.file), IRF3.db.font.size, "THINOUTLINE")
		debuffIcon.count:SetShadowColor(0, 0, 0)
		debuffIcon.count:SetShadowOffset(1, -1)
		debuffIcon.timer:SetFont(LibStub("LibSharedMedia-3.0"):Fetch("font", IRF3.db.font.file), IRF3.db.font.size, IRF3.db.font.attribute)
		debuffIcon.timer:SetShadowColor(0, 0, 0)
		debuffIcon.timer:SetShadowOffset(1, -1)
		debuffIcon.timer:ClearAllPoints()
--~  		if IRF3.db.enableSpellTimerType1 then
		debuffIcon.timer:SetPoint("TOPLEFT", debuffIcon.icon, "TOPLEFT", 0, 2)
		debuffIcon.count:SetPoint("BOTTOMRIGHT", debuffIcon.icon, "BOTTOMRIGHT", 4, 0)
--~ 		else
--~  			debuffIcon.timer:SetPoint("CENTER", debuffIcon.icon, "CENTER", 0, 0)
--~  			debuffIcon.count:SetPoint("CENTER", debuffIcon.icon, "CENTER", 0, 0)
--~ 		end
		hideIcon(debuffIcon)
	end
end

function InvenRaidFrames3Member_UpdateAura(self)
	if not IRF3.isClassic and UnitInRaid(self.unit) then
		InvenRaidFrames3Member_NewUpdateDebuff(self)
		return
	end
	
	self.numDebuffIcons = 0
	local baIndex, baIsBuff, baIcon, baCount, baDuration, baExpirationTime, baSpellId
	local dispelable, dispelType
	local debuffIndex = 0
	local buffIndex = 0

	IRF3:ForEachAura(self.displayedUnit, "HARMFUL", nil, 
		function(name, icon, count, debuffType, duration, expirationTime, _, _, _, spellId, _, isBossAura)
			if name then
				debuffIndex = debuffIndex + 1
				if not ignoreAuraId[spellId] and not ignoreAuraName[name] then
					debuffType = dispelTypes[debuffType] or "none"
					if self.optionTable.onlyDispel and not LRD:CheckHelpDispel(debuffType) then
						return true
					end				
					if isBossAura and not bossAuraId[spellId] and not bossAuraName[name] and IRF3.db.userAura[spellId] ~= false and IRF3.db.userAura[name] ~= false then
						IRF3.db.userAura[spellId] = true
						bossAuraId[spellId] = true
						IRF3:Message("새로운 중요 디버프 \""..name.."\"|1을;를; 발견하여 중요 오라 목록에 추가합니다.")
					end
					if self.optionTable.useBossAura and not baIndex and (bossAuraId[spellId] or bossAuraName[name]) then--디버프는 항상 버프에 우선합니다.
						-- 중요 오라 내용 임시 테이블에 저장
						baIndex = debuffIndex
						baIsBuff = false
						baIcon = icon
						baCount = count
						baDuration = duration
						baExpirationTime = expirationTime
						baSpellId = spellId
					elseif self.optionTable.debuffIconFilter[debuffType] and self.optionTable.debuffIcon > self.numDebuffIcons then
						-- 디버프 아이콘
						self.numDebuffIcons = self.numDebuffIcons + 1
						local debuffIcon = self["debuffIcon"..self.numDebuffIcons]
						if debuffIcon then
							debuffIcon:SetSize(self.optionTable.debuffIconSize, self.optionTable.debuffIconSize)
							debuffIcon:SetID(debuffIndex)
							if IRF3.db.colors[debuffType] then
								debuffIcon.color:SetColorTexture(IRF3.db.colors[debuffType][1], IRF3.db.colors[debuffType][2], IRF3.db.colors[debuffType][3])
							else
								debuffIcon.color:SetColorTexture(0, 0, 0)
							end
							debuffIcon.icon:SetTexture(icon)
							debuffIcon.icon:SetScale(1)
							debuffIcon.count:SetText(count and count > 1 and count or nil)
							debuffIcon:Show()
							debuffIcon.expirationTime = expirationTime
							debuffIcon.startTime = expirationTime - duration
							if duration > 0 and self.optionTable.showDispelTimer then
								if not debuffIcon.spellticker then
									debuffIcon.spellticker = C_Timer.NewTicker(0.5, function() onUpdateIconTimer(debuffIcon) end)
								end
								onUpdateIconTimer(debuffIcon)
							else
								debuffIcon.timer:SetText("")
							end
							
							if IRF3.db.enableFadeIn and (duration == 0 or GetTime() - debuffIcon.startTime < ENUM_TIME) then
								AddFade(self, debuffIcon, spellId, debuffIcon.startTime, name)--add
							end
						end
					end
					if not dispelable and LRD:CheckHelpDispel(debuffType) then
						dispelable = true
						dispelType = debuffType
					end
				end
				return true
			else
				return false
			end
		end
	)

	if not baIndex then
		IRF3:ForEachAura(self.displayedUnit, "HELPFUL", nil, 
			function(name, icon, count, debuffType, duration, expirationTime, _, _, _, spellId, _, isBossAura)
				if name then
					buffIndex = buffIndex + 1
					if not ignoreAuraId[spellId] and not ignoreAuraName[name] then			
						if isBossAura and not bossAuraId[spellId] and not bossAuraName[name] and IRF3.db.userAura[spellId] ~= false and IRF3.db.userAura[name] ~= false then
							IRF3.db.userAura[spellId] = true
							bossAuraId[spellId] = true
							IRF3:Message("새로운 중요 버프 \""..name.."\"|1을;를; 발견하여 중요 오라 목록에 추가합니다.")
						end
						if self.optionTable.useBossAura and not baIndex and (bossAuraId[spellId] or bossAuraName[name]) then--디버프는 항상 버프에 우선합니다.
							-- 중요 오라 내용 임시 테이블에 저장
							baIndex = buffIndex
							baIsBuff = true
							baIcon = icon
							baCount = count
							baDuration = duration
							baExpirationTime = expirationTime
							baSpellId = spellId
						end
					end
					return true
				else
					return false
				end
			end
		)
	end
	
	if baIndex then
		-- 중요 오라 표시
		self.bossAura:SetSize(self.optionTable.bossAuraSize, self.optionTable.bossAuraSize)
		self.bossAura.icon:SetTexture(baIcon)
		self.bossAura.count:SetText(baCount and baCount > 1 and baCount or nil)
		self.bossAura:SetID(baIndex)
		self.bossAura.baIsBuff = baIsBuff
		if self.optionTable.bossAuraTimer and baDuration and (baDuration > 0) then
			self.bossAura.cooldown:SetCooldown(baExpirationTime - baDuration, baDuration)
			self.bossAura.cooldown:Show()
		else
			self.bossAura.cooldown:Hide()
		end
		self.bossAura:Show()
		if baDuration and baDuration > 0 and baExpirationTime then
			self.bossAura.endTime = baExpirationTime
			self.bossAura.startTime = baExpirationTime - baDuration
			if not self.bossAura.ticker then
				self.bossAura.ticker = C_Timer.NewTicker(0.5, function() bossAuraOnUpdate(self.bossAura, self.optionTable.bossAuraOpt) end)
			end
			bossAuraOnUpdate(self.bossAura, self.optionTable.bossAuraOpt)
			
			if IRF3.db.enableFadeIn and GetTime() - self.bossAura.startTime < ENUM_TIME then
				AddFade(self, self.bossAura, baSpellId, self.bossAura.startTime)-- add
			end
		else
			if self.bossAura.ticker then
				self.bossAura.ticker:Cancel()
				self.bossAura.ticker = nil
			end
			self.bossAura.timerParent.text:SetText(nil)
		end
	else
		hideIcon(self.bossAura)
	end
	for i = self.numDebuffIcons + 1, 5 do
		hideIcon(self["debuffIcon"..i])
	end
	if self.numDebuffIcons == 0 then
		if self.DebuffFadeStartTime then
			table.wipe(self.DebuffFadeStartTime)
		end
		self.DebuffFadeStartTime = {}
	end
	if dispelable then
		self.dispelType = dispelType
		if self.optionTable.dispelSound ~= "None" then
			if GetTime() > lastTime then
				lastTime = GetTime() + self.optionTable.dispelSoundDelay
				PlaySoundFile(SM:Fetch("sound", self.optionTable.dispelSound))
			end
		end
	else
		self.dispelType = nil
	end
end

function InvenRaidFrames3Member_NewUpdateDebuff(self)

	if not self.PlayerAuras then
		self.PlayerAuras = {}
	end
	
	local baIndex, baIsBuff, baIcon, baCount, baDuration, baExpirationTime, baSpellId
	local dispelable, dispelType
	local debuffIndex = 0
	local buffIndex = 0
	self.numDebuffIcons = 0
	for auraInstanceID, aura in pairs(self.PlayerAuras) do
		local name = aura.name
		local icon = aura.icon
		local count = aura.applications or 0
		local duration = aura.duration
		local expirationTime = aura.expirationTime
		local caster = aura.sourceUnit
		local spellId = aura.spellId
		local isHelpful = aura.isHelpful
		local isHarmful = aura.isHarmful
		local isBossAura = aura.isBossAura
		local debuffType = aura.dispelName
		if name and isHarmful then
			debuffIndex = debuffIndex + 1
			if not ignoreAuraId[spellId] and not ignoreAuraName[name] then
				debuffType = dispelTypes[debuffType] or "none"
				if self.optionTable.onlyDispel and not LRD:CheckHelpDispel(debuffType) then
					return true
				end
				if isBossAura and not bossAuraId[spellId] and not bossAuraName[name] and IRF3.db.userAura[spellId] ~= false and IRF3.db.userAura[name] ~= false then
					IRF3.db.userAura[spellId] = true
					bossAuraId[spellId] = true
					IRF3:Message("새로운 중요 디버프 \""..name.."\"|1을;를; 발견하여 중요 오라 목록에 추가합니다.")
				end
				if self.optionTable.useBossAura and not baIndex and (bossAuraId[spellId] or bossAuraName[name]) then--디버프는 항상 버프에 우선합니다.
					-- 중요 오라 내용 임시 테이블에 저장
					baIndex = debuffIndex
					baIsBuff = false
					baIcon = icon
					baCount = count
					baDuration = duration
					baExpirationTime = expirationTime
					baSpellId = spellId
				elseif self.optionTable.debuffIconFilter[debuffType] and self.optionTable.debuffIcon > self.numDebuffIcons then
					-- 디버프 아이콘
					self.numDebuffIcons = self.numDebuffIcons + 1
					local debuffIcon = self["debuffIcon"..self.numDebuffIcons]
					if debuffIcon then
						debuffIcon:SetSize(self.optionTable.debuffIconSize, self.optionTable.debuffIconSize)
						debuffIcon:SetID(debuffIndex)
						if IRF3.db.colors[debuffType] then
							debuffIcon.color:SetColorTexture(IRF3.db.colors[debuffType][1], IRF3.db.colors[debuffType][2], IRF3.db.colors[debuffType][3])
						else
							debuffIcon.color:SetColorTexture(0, 0, 0)
						end
						debuffIcon.icon:SetTexture(icon)
						debuffIcon.icon:SetScale(1)
						debuffIcon.count:SetText(count and count > 1 and count or nil)
						debuffIcon:Show()
						debuffIcon.expirationTime = expirationTime
						debuffIcon.startTime = expirationTime - duration
						if duration > 0 and self.optionTable.showDispelTimer then
							if not debuffIcon.spellticker then
								debuffIcon.spellticker = C_Timer.NewTicker(0.5, function() onUpdateIconTimer(debuffIcon) end)
							end
							onUpdateIconTimer(debuffIcon)
						else
							debuffIcon.timer:SetText("")
						end
						
						if IRF3.db.enableFadeIn and (duration == 0 or GetTime() - debuffIcon.startTime < ENUM_TIME) then
							AddFade(self, debuffIcon, spellId, debuffIcon.startTime, name)--add
						end
					end
				end
				if not dispelable and LRD:CheckHelpDispel(debuffType) then
					dispelable = true
					dispelType = debuffType
				end
			end
		end
	end

	if not baIndex then
		for auraInstanceID, aura in pairs(self.PlayerAuras) do
			local name = aura.name
			local icon = aura.icon
			local count = aura.stack
			local duration = aura.duration
			local expirationTime = aura.expirationTime
			local caster = aura.sourceUnit
			local spellId = aura.spellId
			local isHelpful = aura.isHelpful
			local isHarmful = aura.isHarmful
			local isBossAura = aura.isBossAura
			local debuffType = aura.dispelName
			if name and isHelpful then
				buffIndex = buffIndex + 1
				if not ignoreAuraId[spellId] and not ignoreAuraName[name] then			
					if isBossAura and not bossAuraId[spellId] and not bossAuraName[name] and IRF3.db.userAura[spellId] ~= false and IRF3.db.userAura[name] ~= false then
						IRF3.db.userAura[spellId] = true
						bossAuraId[spellId] = true
						IRF3:Message("새로운 중요 버프 \""..name.."\"|1을;를; 발견하여 중요 오라 목록에 추가합니다.")
					end
					if self.optionTable.useBossAura and not baIndex and (bossAuraId[spellId] or bossAuraName[name]) then--디버프는 항상 버프에 우선합니다.
						-- 중요 오라 내용 임시 테이블에 저장
						baIndex = buffIndex
						baIsBuff = true
						baIcon = icon
						baCount = count
						baDuration = duration
						baExpirationTime = expirationTime
						baSpellId = spellId
					end
				end
			end
		end
	end
	
	if baIndex then
		-- 중요 오라 표시
		self.bossAura:SetSize(self.optionTable.bossAuraSize, self.optionTable.bossAuraSize)
		self.bossAura.icon:SetTexture(baIcon)
		self.bossAura.count:SetText(baCount and baCount > 1 and baCount or nil)
		self.bossAura:SetID(baIndex)
		self.bossAura.baIsBuff = baIsBuff
		if self.optionTable.bossAuraTimer and baDuration and (baDuration > 0) then
			self.bossAura.cooldown:SetCooldown(baExpirationTime - baDuration, baDuration)
			self.bossAura.cooldown:Show()
		else
			self.bossAura.cooldown:Hide()
		end
		self.bossAura:Show()
		if baDuration and baDuration > 0 and baExpirationTime then
			self.bossAura.endTime = baExpirationTime
			self.bossAura.startTime = baExpirationTime - baDuration
			if not self.bossAura.ticker then
				self.bossAura.ticker = C_Timer.NewTicker(0.5, function() bossAuraOnUpdate(self.bossAura, self.optionTable.bossAuraOpt) end)
			end
			bossAuraOnUpdate(self.bossAura, self.optionTable.bossAuraOpt)
			
			if IRF3.db.enableFadeIn and GetTime() - self.bossAura.startTime < ENUM_TIME then
				AddFade(self, self.bossAura, baSpellId, self.bossAura.startTime)-- add
			end
		else
			if self.bossAura.ticker then
				self.bossAura.ticker:Cancel()
				self.bossAura.ticker = nil
			end
			self.bossAura.timerParent.text:SetText(nil)
		end
	else
		hideIcon(self.bossAura)
	end
	for i = self.numDebuffIcons + 1, 5 do
		hideIcon(self["debuffIcon"..i])
	end
	if self.numDebuffIcons == 0 then
		if self.DebuffFadeStartTime then
			table.wipe(self.DebuffFadeStartTime)
		end
		self.DebuffFadeStartTime = {}
	end
	if dispelable then
		self.dispelType = dispelType
		if self.optionTable.dispelSound ~= "None" then
			if GetTime() > lastTime then
				lastTime = GetTime() + self.optionTable.dispelSoundDelay
				PlaySoundFile(SM:Fetch("sound", self.optionTable.dispelSound))
			end
		end
	else
		self.dispelType = nil
	end
end

function InvenRaidFrames3Member_BossAuraOnLoad(self)
	self.cooldown.noOCC = true
	self.cooldown.noCooldownCount = true
	self.cooldown:SetHideCountdownNumbers(true)
end

local tooltipUpdate = 0
function InvenRaidFrames3Member_AuraIconOnUpdate(self, elapsed)
	if not InvenRaidFrames3.tootipState then return end
	
	tooltipUpdate = tooltipUpdate + elapsed
	if tooltipUpdate > 0.1 then
		tooltipUpdate = 0
		if self:IsMouseOver() then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 0, 0)
			if self.baIsBuff then
				GameTooltip:SetUnitBuff(self:GetParent().displayedUnit, self:GetID())
			else
				GameTooltip:SetUnitDebuff(self:GetParent().displayedUnit, self:GetID())
			end
		elseif GameTooltip:IsOwned(self) then
			GameTooltip:Hide()
		end
	end
	
end

IRF3.ignoreAura = {
	[6788] = true, [8326] = true, [11196] = true, [15822] = true, [21163] = true,
	[24360] = true, [24755] = true, [26004] = true, [26013] = true, --[25771] = true, -- 성기사 참을성
	[26680] = true, [28169] = true, [28504] = true, [29232] = true, [30108] = true,
	[30529] = true, [36032] = true, [36893] = true, [36900] = true, [36901] = true,
	[40880] = true, [40882] = true, [40883] = true, [40891] = true, [40896] = true,
	[40897] = true, [41292] = true, [41337] = true, [41350] = true, [41425] = true,
	[43681] = true, [55711] = true, [57723] = true, [57724] = true, [64805] = true,
	[64808] = true, [64809] = true, [64810] = true, [64811] = true, [64812] = true,
	[64813] = true, [64814] = true, [64815] = true, [64816] = true, [69127] = true,
	[69438] = true, [70402] = true, [71328] = true, [72144] = true, [72145] = true,
	[80354] = true, [89798] = true, [96328] = true, [96325] = true,
	[96326] = true, [95809] = true, [36895] = true, [71041] = true, [122835] = true,
	[173660] = true, [173649] = true, [173657] = true, [173658] = true, [173976] = true,
	[173661] = true, [174524] = true, [173659] = true,
	[160455] = true, -- Fatigued
	[206151] = true, -- 도전자의 짐(쐐기 신화)
	[234143] = true, -- 무너지는 미래의 반지
--	[124273] = true, [124274] = true,  -- 시간차
	[124275] = true, -- 작은 시간차
	[352562] = true, -- 반동 대응법
}

IRF3.bossAura = {
[361632] = true,	-- 어둠땅, 안트로스 - 추방의 징표
--~ [106872] = true, [107268] = true, [111600] = true, [118961] = true, [145206] = true, [153795] = true, [155721] = true, [160029] = true, [185093] = true, [192048] = true, [192706] = true, [193069] = true, [193367] = true, [193783] = true, [194327] = true, [196068] = true, [197943] = true, [198006] = true, [198190] = true, [199063] = true, [201146] = true, [203096] = true, [203770] = true, [203774] = true, [204463] = true, [204517] = true, [204531] = true, [204611] = true, [204859] = true, [204895] = true, [204962] = true, [205201] = true, [205344] = true, [205649] = true, [205771] = true, [205984] = true, [206384] = true, [206480] = true, [206617] = true, [206651] = true, [206798] = true, [206936] = true, [208431] = true, [208929] = true, [209011] = true, [209158] = true, [209244] = true, [209598] = true, [209615] = true, [209973] = true, [210315] = true, [210863] = true, [210879] = true, [211471] = true, [211802] = true, [211939] = true, [212568] = true, [214167] = true, [214335] = true, [215449] = true, [216040] = true, [217093] = true, [218304] = true, [218342] = true, [218350] = true, [218368] = true, [218809] = true, [219024] = true, [219025] = true, [219602] = true, [219610] = true, [219812] = true, [219964] = true, [219965] = true, [219966] = true, [221028] = true, [221246] = true, [221344] = true, [221606] = true, [221891] = true, [222178] = true, [222719] = true, [223511] = true, [223655] = true, [224188] = true, [225080] = true, [225105] = true, [227832] = true, [228029] = true, [228054] = true, [228248] = true, [228249] = true, [228253] = true, [228270] = true, [228280] = true, [228331] = true, [228883] = true, [228918] = true, [229159] = true, [230139] = true, [230201] = true, [230362] = true, [231363] = true, [231729] = true, [231998] = true, [232249] = true, [233272] = true, [233568] = true, [233570] = true, [233963] = true, [233983] = true, [234114] = true, [235117] = true, [235222] = true, [236283] = true, [236459] = true, [236494] = true, [236519] = true, [236550] = true, [236596] = true, [236710] = true, [238018] = true, [238598] = true, [239264] = true, [239739] = true, [240447] = true, [240706] = true, [240735] = true, [243299] = true, [245509] = true, 
}