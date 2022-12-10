local _G = _G
local next = _G.next
local pairs = _G.pairs
local ipairs = _G.ipairs
local select = _G.select
local tinsert = _G.table.insert
local wipe = _G.wipe
local UnitBuff = _G.UnitBuff
local GetSpellInfo = _G.GetSpellInfo
local IsSpellKnown = _G.IsSpellKnown
local UnitIsPlayer = _G.UnitIsPlayer
local UnitInVehicle = _G.UnitInVehicle
local IRF3 = _G[...]

if not UnitInVehicle then
	UnitInVehicle = function(unit) return false end
end

IRF3.raidBuffData = {}

function InvenRaidFrames3Member_UpdateBuffs()

end

function IRF3:SetupClassBuff()
	self.SetupClassBuff = nil	
	
	InvenRaidFrames3CharDB.classBuff, InvenRaidFrames3CharDB.classBuff2 = nil, type(InvenRaidFrames3CharDB.classBuff2) == "table" and InvenRaidFrames3CharDB.classBuff2 or {}
end

local playerClass = select(2, UnitClass("player"))
-- 주문ID는 1레벨로 통일
-- 상급은 직업버프에서 빼고 레이드버프에는 넣고 same 에서 연결
local classRaidBuffs = ({
	WARRIOR = {
		[469] = { 2 },			-- 지휘의 외침
		[6673] = { 3 },			-- 전투의 외침
	},
	ROGUE = {
	},
	PRIEST = {
		[1243] = { 2 },			-- 신의 권능: 인내 21562
		[14752] = { 5 },		-- 천상의 정신
	},
	MAGE = {
		[1459] = { 4 },			-- 신비한 지능
		[61316] = { 4 },		-- 달라란의 총명함
	},
	WARLOCK = {
		[6307] = { 2 },			-- 피의 서약
		[54424] = { 4, 5 },		-- 지옥의 지능
	},
	HUNTER = {
		[19506] = { 9 },		-- 정조준 오라
	},
	DRUID = {
		[1126] = { 1 },			-- 야생의 징표
	},
	SHAMAN = {
		[30802] = { 9 },		-- 해방된 분노
	},
	PALADIN = {
--		[19740] = { 3 },		-- 힘의 축복
--		[19742] = { 11 },		-- 지혜의 축복
--		[20217] = { 6 },		-- 왕의 축복
--~ 		[25782] = { 3 },		-- 힘의 축복
--~ 		[25894] = { 11 },		-- 지혜의 축복
--~ 		[25898] = { 6 },		-- 왕의 축복
	},
	DEATHKNIGHT = {
		[57330] = { 7, 8 },		-- 겨울의 뿔피리		+힘 +민첩
--~ 		[55610] = { 10 },		-- 얼음 발톱 연마	근접 가속 20%
		[53137] = { 4 },		-- 누더기골렘의 힘	전투력 +10%
	},
})[playerClass]

if not classRaidBuffs then return end

local raidBuffs = {
	-- 능력치
	[1] = {
		1126,	-- [드루이드] 야생의 징표
		21849,	-- [드루이드] 야생의 선물
	},
	-- 체력
	[2] = {
		1243,	-- [사제] 신의 권능: 인내
		469,	-- [전사] 지휘의 외침
		6307,	-- [흑마법사] 피의 서약
	},
	-- 전투력
	[3] = {
		6673,	-- [전사] 전투의 외침
--~ 		19740,	-- [성기사] 힘의 축복
--~ 		25782,	-- [성기사] 상급 힘의 축복
	},
	-- 지능
	[4] = {
		1459,	-- [마법사] 신비한 총명함
		23028,	-- [마법사] 신비한 총명함
		61316,	-- [마법사] 달라란의 총명함
		54424,	-- [흑마법사] 지옥의 지능
	},
	-- 정신력
	[5] = {
		14752,	-- [사제] 천상의 정신
		27681	-- [사제] 정신력의 기원
--		54424,	-- [흑마법사] 지옥의 지능
	},
	-- 능력치%
	[6] = {
--~ 		20217,	-- [성기사] 왕의 축복
--~ 		25898,	-- [성기사] 상급 왕의 축복
	},
	-- 힘
	[7] = {
		57330,	-- [죽음의 기사] 겨울의 뿔피리
	},
	-- 민첩
	[8] = {
		57330,	-- [죽음의 기사] 겨울의 뿔피리
	},
	-- 전투력 10%
	[9] = {
		19506,	-- [사냥꾼] 정조준 오라
		30802,	-- [주술사] 해방된 분노
		53137,	-- [주술사] 누더기골렘의 힘
	},
	-- 가속
	[10] = {
--~ 		55610,	-- [죽음의 기사] 얼음 발톱 연마
	},
	-- 마나 회복
	[11] = {
--~ 		19742,	-- [성기사] 지혜의 축복
--~ 		25894,	-- [성기사] 상급 지혜의 축복
	},
}

local sameBuffs = {	-- 같은 버프면 둘중 하나만 걸려도 통과
	[1126] = 21849,		-- 야생의 징표 = 야생의 선물
	[1459] = 23028,		-- 신비한 총명함 = 신비한 총명함
--	[19740] = 25782,	-- 힘의 축복 = 상급 힘의 축복
--	[19742] = 25894,	-- 지혜의 축복 = 상급 지혜의 축복
--	[20217] = 25898,	-- 왕의 축복 = 상급 왕의 축복
	[1243] = 21562,		-- 신의 권능: 인내 = 인내의 기원
	[14752] = 27681,	-- 천상의 정신 = 정신력의 기원
}

-- 한 클래스에 버프가 두종류 이상인데 하나만 충족해도 되는 경우
-- 성기사 6종류는 처리가 어려워서 상급 축복만 처리.
IRF3.raidBuffData = {	-- link 버프는 설정창에서 묶음표시됨
	same = sameBuffs,
	link = {
		[469] = 6673,		-- 지휘의 외침 = 전투의 외침
--		[19740] = 19742,	-- 힘의 축복 = 지혜의 축복
--		[19742] = 19740,	-- 지혜의 축복 = 힘의 축복
--		[20217] = 19740,	-- 왕의 축복 = 힘의 축복
		
--~ 		[25782] = 25894,	-- 힘의 축복 = 상급 힘의 축복
--~ 		[25894] = 25782,	-- 지혜의 축복 = 상급 지혜의 축복
--~ 		[25898] = 25782,	-- 왕의 축복 = 상급 왕의 축복
		
	},
	link2 = {	-- 성기사 축복 3종류 때문에 추가
--		[19740] = 20217,	-- 힘의 축복 = 왕의 축복
--		[19742] = 20217,	-- 지혜의 축복 = 왕의 축복
--		[20217] = 19742,	-- 왕의 축복 = 지혜의 축복
		
--~ 		[25782] = 25898,	-- 힘의 축복 = 상급 힘의 축복
--~ 		[25894] = 25898,	-- 지혜의 축복 = 상급 지혜의 축복
--~ 		[25898] = 25894,	-- 왕의 축복 = 상급 왕의 축복
	},
}

local linkRaidBuffs = {}
local linkRaidBuffs2 = {}

local raidBuffInfo = {}

local function addRaidBuff(tbl, spellId, isClassBuff)
	local spellName, _, spellIcon = GetSpellInfo(spellId)
	if spellName then
		if isClassBuff then
			for _, v in ipairs(tbl) do
				if v.id == spellId then
					return true
				end
			end
		end
		tinsert(tbl, {
			id = spellId,
			name = spellName,
			--rank = spellRank,
			icon = spellIcon,
			passive = IsPassiveSpell(spellId)
		})
		raidBuffInfo[spellId] = tbl[#tbl]
		return true
	end
	return nil
end

for i, spellIds in pairs(raidBuffs) do
	local n = {}
	for _, spellId in ipairs(spellIds) do
		addRaidBuff(n, spellId)
	end
	raidBuffs[i] = n
end

for spellId, mask in pairs(classRaidBuffs) do
	for _, i in ipairs(mask) do
		if #raidBuffs[i] > 0 and addRaidBuff(raidBuffs[i], spellId, true) and not raidBuffInfo[spellId].passive then
			if sameBuffs[spellId] then
				addRaidBuff(raidBuffs[i], sameBuffs[spellId], true)
			end
		else
			classRaidBuffs[spellId] = nil
			sameBuffs[spellId] = nil
			break
		end
	end
end

if not next(classRaidBuffs) then return end

local currentRaidBuffs, checkMask, buffCnt, buff, buff2 = {}, {}, 0

local function showBuffIcon(icon, texture)
	icon:SetSize(IRF3.db.units.buffIconSize, IRF3.db.units.buffIconSize)
	icon:SetTexture(texture)
	icon:Show()
end

local function hideBuffIcon(icon)
	icon:SetSize(0.001, 0.001)
	icon:Hide()
end

local function getBuff(unit, spellId, filter)
	if spellId then		
		if AuraUtil.FindAuraByName(raidBuffInfo[spellId].name, unit, filter) then
			for _, i in ipairs(classRaidBuffs[spellId]) do
				checkMask[i] = raidBuffInfo[spellId]
			end
		elseif sameBuffs[spellId] and raidBuffInfo[sameBuffs[spellId]] and AuraUtil.FindAuraByName(raidBuffInfo[sameBuffs[spellId]].name, unit, filter) then
			for _, i in ipairs(classRaidBuffs[spellId]) do
				checkMask[i] = raidBuffInfo[sameBuffs[spellId]]
			end
		else
			for _, i in ipairs(classRaidBuffs[spellId]) do
				if checkMask[i] == nil then
					checkMask[i] = false
					for _, v in ipairs(raidBuffs[i]) do
						if AuraUtil.FindAuraByName(v.name, unit, filter) then
							checkMask[i] = v
							break
						end
					end
					if checkMask[i] == false then
						spellId = nil
						break
					end
				elseif checkMask[i] == false then
					spellId = nil
					break
				end
			end
		end
	end
	return spellId
end

InvenRaidFrames3Member_UpdateBuffs = function(self)
	if not UnitIsPlayer(self.displayedUnit) or UnitInVehicle(self.displayedUnit) then 
		hideBuffIcon(self["buffIcon1"])
		hideBuffIcon(self["buffIcon2"])
		return 
	end
	
	wipe(checkMask)
	buffCnt = 0
	for spellId in pairs(currentRaidBuffs) do
		buff = getBuff(self.displayedUnit, spellId, "HELPFUL")
		if InvenRaidFrames3CharDB.classBuff2[spellId] == 1 then			-- 버프가 없을 때 표시
			if not buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		elseif InvenRaidFrames3CharDB.classBuff2[spellId] == 2 then			-- 버프가 있을 때 표시
			if buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		end
		if buffCnt == 2 then return end
	end

	for a, b in pairs(linkRaidBuffs) do
		local c = linkRaidBuffs2[a]
		local buff = AuraUtil.FindAuraByName(raidBuffInfo[a].name, self.displayedUnit, "PLAYER")
		local buff2 = not buff and AuraUtil.FindAuraByName(raidBuffInfo[b].name, self.displayedUnit, "PLAYER") or nil
		local buff3 = c and not buff2 and AuraUtil.FindAuraByName(raidBuffInfo[c].name, self.displayedUnit, "PLAYER") or nil
		if InvenRaidFrames3CharDB.classBuff2[b] == 1 then			-- 버프가 없을 때 표시
			if not buff and not buff2 and not buff3 then
				buff = getBuff(self.displayedUnit, a, "PLAYER")
				buff2 = getBuff(self.displayedUnit, b, "PLAYER")
				buff3 = getBuff(self.displayedUnit, c, "PLAYER")
				if not buff and not buff2 and not buff3 then
					buffCnt = buffCnt + 1
					showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[a].icon)
					if buffCnt == 1 then
						buffCnt = buffCnt + 1
						showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[b].icon)
						return
					end
				elseif not buff then
					buffCnt = buffCnt + 1
					showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[a].icon)
				elseif not buff2 then
					buffCnt = buffCnt + 1
					showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[b].icon)
				elseif not buff3 then
					buffCnt = buffCnt + 1
					showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[c].icon)
				end
			end
		elseif InvenRaidFrames3CharDB.classBuff2[b] == 2 then			-- 버프가 있을 때 표시
			if buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[a].icon)
			elseif buff2 then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[b].icon)
			elseif buff3 then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[c].icon)
			end
		end
		if buffCnt == 2 then return end
	end
	
	for i = buffCnt + 1, 2 do
		hideBuffIcon(self["buffIcon"..i])
	end
end

local function checkSpellKnown(spellId)	-- 인자로 1레벨 주문 ID를 받는다. 주문 타입은 모든 레벨을 배운 상태지만. 전사같은 스킬은 최고레벨만 배운거로 나온다.
	if IsPassiveSpell(spellId) then	-- 흑마 팻 스킬들이 패시브로 처리되지않아 설정창이 노출된다.
		return false
	end
	local spellName1, _, _, _, _, _, spellId1 = GetSpellInfo(spellId)	-- 1레벨 ID를 이름으로 변환
	if spellName1 then
		local spellName2, _, _, _, _, _, spellId2 = GetSpellInfo(spellName1)	-- 이름을 내가 가진 스펠 ID로 변환
		if spellName2 then
			return IsSpellKnown(spellId2)
		end
	end
	return false
end

local function updateClassBuff()
	wipe(currentRaidBuffs)
	wipe(linkRaidBuffs)
	wipe(linkRaidBuffs2)
	for spellId, mask in pairs(classRaidBuffs) do
		if checkSpellKnown(spellId) then
			currentRaidBuffs[spellId] = mask
		else
			for nextSpellId, sameId in pairs(sameBuffs) do
				if checkSpellKnown(nextSpellId) then
					currentRaidBuffs[nextSpellId] = mask
					break
				end
			end
		end
	end
	for a, b in pairs(IRF3.raidBuffData.link) do
--		if currentRaidBuffs[a] and currentRaidBuffs[b] then
			linkRaidBuffs[a] = b
			currentRaidBuffs[a] = nil
			currentRaidBuffs[b] = nil
--		end
	end
	for a, b in pairs(IRF3.raidBuffData.link2) do
		linkRaidBuffs2[a] = b
	end
	if not IRF3.SetupClassBuff then
		for _, header in pairs(IRF3.headers) do
			for _, member in pairs(header.members) do
				if member:IsVisible() then
					InvenRaidFrames3Member_UpdateBuffs(member)
				end
			end
		end
	end
end

local handler = CreateFrame("Frame")
handler:SetScript("OnEvent", updateClassBuff)
handler:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
handler:RegisterEvent("PLAYER_TALENT_UPDATE")
handler:RegisterEvent("PLAYER_ENTERING_WORLD")
handler:RegisterEvent("LEARNED_SPELL_IN_TAB")

function IRF3:SetupClassBuff()
	self.SetupClassBuff = nil
	InvenRaidFrames3CharDB.classBuff = nil
	InvenRaidFrames3CharDB.classBuff2 = type(InvenRaidFrames3CharDB.classBuff2) == "table" and InvenRaidFrames3CharDB.classBuff2 or {}
	for spellId in pairs(InvenRaidFrames3CharDB.classBuff2) do
		if not classRaidBuffs[spellId] then
			InvenRaidFrames3CharDB.classBuff2[spellId] = nil
		end
	end
	for spellId in pairs(classRaidBuffs) do
		if raidBuffInfo[spellId].passive then
			InvenRaidFrames3CharDB.classBuff2[spellId] = nil
		elseif InvenRaidFrames3CharDB.classBuff2[spellId] ~= 0 and InvenRaidFrames3CharDB.classBuff2[spellId] ~= 1 and InvenRaidFrames3CharDB.classBuff2[spellId] ~= 2 then
			InvenRaidFrames3CharDB.classBuff2[spellId] = 1
		end
	end
	updateClassBuff()
end