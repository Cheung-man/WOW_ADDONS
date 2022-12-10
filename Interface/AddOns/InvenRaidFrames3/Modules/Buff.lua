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
	InvenRaidFrames3CharDB.classBuff = nil
	InvenRaidFrames3CharDB.classBuff2 = type(InvenRaidFrames3CharDB.classBuff2) == "table" and InvenRaidFrames3CharDB.classBuff2 or {}
end

local playerClass = select(2, UnitClass("player"))

local classRaidBuffs = ({
	WARRIOR = {
		[6673] = { 1 },		-- [전사] 전투의 외침 (Legit 8.0)
	},
	ROGUE = {
	},
	PRIEST = {
		[21562] = { 2 },	-- 신의 권능: 인내 (Legit 8.0)
	},
	MAGE = {
		[1459] = { 3 },		-- 신비한 총명함 (Legit 8.0)
	},
	WARLOCK = {
	},
	HUNTER = {
	},
	DRUID = {
		[1126] = { 4 },		-- 야생의 징표 (10.0)
	},
	SHAMAN = {
	},
	PALADIN = {
	},
	DEATHKNIGHT = {
	},
	MONK = {
	},
	DEMONHUNTER = {
	},
	EVOKER = {
		[364342] = { 5 },	
	},
})[playerClass]

if not classRaidBuffs then return end

local raidBuffs = {
	-- 전투력
	[1] = {
		6673,		-- [전사] 전투의 외침 (Legit 8.0)
	},
	-- 체력
	[2] = {
		21562,		-- [사제] 신의 권능: 인내 (Legit 8.0)
	},
	-- 지능
	[3] = {
		1459,		-- [마법사] 신비한 총명함 (Legit 8.0)
	},
	-- 유연성
	[4] = {
		1126,		-- [드루이드] 야생의 징표 (10.0)
	},
	[5] = {
		364342,		-- [기원사] 청동용군단의 축복 (10.0)
	},
--~ 	-- 지축
--~ 	[5] = {
--~ 		203539,		-- [성기사] 상급 지혜의 축복
--~ 	},
}

local sameBuffs = {
	[1459] = 61316,	-- 달라란의 총명함
}

IRF3.raidBuffData = {
	same = sameBuffs,
	link = {
		--[469] = 2048,		-- 지휘의 외침 = 전투의 외침
		--[20217] = 19740,	-- 왕의 축복 = 힘의 축복
	},
}

local linkRaidBuffs = {}

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

local function getBuff(unit, spellId)
	if InvenRaidFrames3Member_UnitAura(raidBuffInfo[spellId].name, unit, "HELPFUL") then
		for _, i in ipairs(classRaidBuffs[spellId]) do
			checkMask[i] = raidBuffInfo[spellId]
		end
	elseif IRF3.isClassic and sameBuffs[spellId] and raidBuffInfo[sameBuffs[spellId]] and AuraUtil.FindAuraByName(raidBuffInfo[sameBuffs[spellId]].name, unit, "HELPFUL") then
		for _, i in ipairs(classRaidBuffs[spellId]) do
			checkMask[i] = raidBuffInfo[sameBuffs[spellId]]
		end
	else
		for _, i in ipairs(classRaidBuffs[spellId]) do
			if checkMask[i] == nil then
				checkMask[i] = false
				for _, v in ipairs(raidBuffs[i]) do
					if InvenRaidFrames3Member_UnitAura(v.name, unit, "HELPFUL") then -- , v.rank
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
	return spellId
end

local function isMyParty(arg1, arg2)
	if not arg1 or not arg2 then
		return true
	end
	if select(3, GetRaidRosterInfo(arg1)) == select(3, GetRaidRosterInfo(arg2)) then
		return true
	end
	return false
end

InvenRaidFrames3Member_UpdateBuffs = function(self)
	if IRF3.isClassic or not UnitInRaid(self.unit) then
		InvenRaidFrames3Member_orgUpdateBuffs(self)
	else
		InvenRaidFrames3Member_NewUpdateBuffs(self)
	end
end

function InvenRaidFrames3Member_orgUpdateBuffs(self)
	if not UnitIsPlayer(self.displayedUnit) or UnitInVehicle(self.displayedUnit) then 
		hideBuffIcon(self["buffIcon1"])
		hideBuffIcon(self["buffIcon2"])
		return 
	end
	
	wipe(checkMask)
	buffCnt = 0
	for spellId in pairs(currentRaidBuffs) do
		buff = getBuff(self.displayedUnit, spellId)
		if InvenRaidFrames3CharDB.classBuff2[spellId] == 1 then
			-- 버프가 없을 때 표시
			if not buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		elseif InvenRaidFrames3CharDB.classBuff2[spellId] == 2 then
			-- 버프가 있을 때 표시
			if buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		end
		if buffCnt == 2 then return end
	end

	for i = buffCnt + 1, 2 do
		hideBuffIcon(self["buffIcon"..i])
	end
end

local function getNewBuff(self, spellId)
	if InvenRaidFrames3Member_NewUnitAura(self, raidBuffInfo[spellId].name, "HELPFUL") then
		for _, i in ipairs(classRaidBuffs[spellId]) do
			checkMask[i] = raidBuffInfo[spellId]
		end
	elseif IRF3.isClassic and sameBuffs[spellId] and raidBuffInfo[sameBuffs[spellId]] and InvenRaidFrames3Member_NewUnitAura(self, raidBuffInfo[sameBuffs[spellId]].name, "HELPFUL") then
		for _, i in ipairs(classRaidBuffs[spellId]) do
			checkMask[i] = raidBuffInfo[sameBuffs[spellId]]
		end
	else
		for _, i in ipairs(classRaidBuffs[spellId]) do
			if checkMask[i] == nil then
				checkMask[i] = false
				for _, v in ipairs(raidBuffs[i]) do
					if InvenRaidFrames3Member_NewUnitAura(self, spellId, "HELPFUL") then -- , v.rank
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
	return spellId
end

function InvenRaidFrames3Member_NewUpdateBuffs(self)
	if not UnitIsPlayer(self.displayedUnit) or UnitInVehicle(self.displayedUnit) then 
		hideBuffIcon(self["buffIcon1"])
		hideBuffIcon(self["buffIcon2"])
		return 
	end
	
	if not self.PlayerAuras then
		self.PlayerAuras = {}
	end
	
	wipe(checkMask)
	buffCnt = 0
	
	for spellId in pairs(currentRaidBuffs) do
		buff = getNewBuff(self, spellId)
		if InvenRaidFrames3CharDB.classBuff2[spellId] == 1 then
			-- 버프가 없을 때 표시
			if not buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		elseif InvenRaidFrames3CharDB.classBuff2[spellId] == 2 then
			-- 버프가 있을 때 표시
			if buff then
				buffCnt = buffCnt + 1
				showBuffIcon(self["buffIcon"..buffCnt], raidBuffInfo[spellId].icon)
			end
		end
		if buffCnt == 2 then return end
	end

	for i = buffCnt + 1, 2 do
		hideBuffIcon(self["buffIcon"..i])
	end
end

local function updateClassBuff()
	wipe(currentRaidBuffs)
	wipe(linkRaidBuffs)
	for spellId, mask in pairs(classRaidBuffs) do
		if IsSpellKnown(spellId) then
			currentRaidBuffs[spellId] = mask
		else
			for nextSpellId, sameId in pairs(sameBuffs) do
				if IsSpellKnown(nextSpellId) then
					currentRaidBuffs[nextSpellId] = mask
					break
				end
			end
		end
	end
	for a, b in pairs(IRF3.raidBuffData.link) do
		if currentRaidBuffs[a] and currentRaidBuffs[b] then
			linkRaidBuffs[a] = b
			currentRaidBuffs[a] = nil
			currentRaidBuffs[b] = nil
		end
	end
	if not IRF3.SetupClassBuff then
		for _, header in pairs(IRF3.headers) do
			for _, member in pairs(header.members) do
				if member:IsVisible() then
					InvenRaidFrames3Member_orgUpdateBuffs(member)
				end
			end
		end
	end
end

local handler = CreateFrame("Frame")
handler:SetScript("OnEvent", updateClassBuff)
if wowtocversion and wowtocversion > 90000 then
	handler:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	handler:RegisterEvent("PLAYER_TALENT_UPDATE")
end
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
			if spellId == 203538 or spellId == 203539 or spellId == 1022 or spellId == 1038 or spellId == 1044 or spellId == 6940 then	-- 성기사 예외 처리
				InvenRaidFrames3CharDB.classBuff2[spellId] = 2
			else
				InvenRaidFrames3CharDB.classBuff2[spellId] = 1
			end
		end
	end
	updateClassBuff()
end