
local _G = _G
local pairs = _G.pairs
local GetTime = _G.GetTime
local IRF3 = _G[...]

-- 직업별 생존기 정의 (*는 타인에게 걸 수 있는 생존기)
local SL = IRF3.GetSpellName
local skills = {	-- 10.0.0
	["WARRIOR"] = { [SL(871)] = "방벽", [SL(12975)] = "최저", [SL(23920)] = "주반", [SL(118038)] = "투혼", [SL(184364)] = "격재", [SL(392966)] = "주막" },
	["HUNTER"] = { [SL(5384)] = "죽척", [SL(186265)] = "거북", [SL(199483)] = "위장", [SL(264735)] = "생존" },
	["MAGE"] = { [SL(45438)] = "얼방", [SL(32612)] = "투명", [SL(110960)] = "상투" },
	["ROGUE"] = { [SL(1966)] = "교란", [SL(5277)] = "회피", [SL(11327)] = "소멸", [SL(31224)] = "그망", [SL(31230)] = "구사", [SL(199754)] = "반격" },
	["PRIEST"] = { [SL(586)] = "소실", [SL(15286)] = "흡선", [SL(19236)] = "기도", [SL(27827)] = "구원", [SL(47585)] = "분산", [SL(64901)] = "희망" },
	["WARLOCK"] = { [SL(104773)] = "결의", [SL(108416)] = "서약" },
	["PALADIN"] = { [SL(498)] = "가호", [SL(642)] = "무적", [SL(31850)] = "헌수", [SL(86659)] = "고대", [SL(204018)] = "수호", [SL(205191)] = "눈", [SL(212641)] = "고대" },
	["DRUID"] = { [SL(22812)] = "껍질", [SL(61336)] = "생본", [SL(102558)] = "화신" },
	["SHAMAN"] = { [SL(108271)] = "영혼", [SL(108281)] = "고인", [SL(210918)] = "에테" },
	["MONK"] = { [SL(115203)] = "강화", [SL(122783)] = "마해", [SL(122278)] = "해악", [SL(122470)] = "업보", [SL(213664)] = "민활", [SL(115176)] = "명상"},
	["DEMONHUNTER"] = { [SL(187827)] = "탈태", [SL(196555)] = "황천", [SL(198589)] = "흐릿", [SL(263648)] = "영방" },
	["DEATHKNIGHT"] = { [SL(48707)] = "대보", [SL(48792)] = "얼인", [SL(49039)] = "리치", [SL(55233)] = "흡혈", [SL(81256)] = "춤룬", [SL(194679)] = "룬전" },
	["EVOKER"] = { [SL(363916)] = "비늘", [SL(374348)] = "소불" },
	["*"] = { [SL(1022)] = "보축", [SL(47788)] = "수호", [SL(33206)] = "고억", [SL(6940)] = "희축", [SL(29166)] = "자극", [SL(102342)] = "무껍", [SL(116849)] = "고치", [SL(228049)] = "여왕", [SL(204018)] = "주축", [SL(209426)] = "어둠", [SL(357170)] = "팽창" },
	["POTION"] = { [SL(307162)] = "지능", [SL(307164)] = "힘", [SL(307159)] = "민첩", [SL(322302)] = "희물", [SL(307161)] = "총명", [SL(307494)] = "퇴마", [SL(307497)] = "집착", [SL(307495)] = "도깨", [SL(307163)] = "체력", [SL(307496)] = "각성", [SL(307195)] = "투물" },
	["SUB"] = { [SL(203720)] = "쐐기",  [SL(215479)] = "무쇠",  [SL(65116)] = "석화" }
}

if IRF3.isClassic then

	skills["WARRIOR"][SL(118038)] = nil		-- 7.0.1
	skills["WARRIOR"][SL(184364)] = nil		-- 7.0.1
	skills["WARRIOR"][SL(392966)] = nil		-- 10.0.0
	skills["HUNTER"][SL(186265)] = nil		-- 7.0.1 거북의 상
	skills["HUNTER"][SL(199483)] = nil		-- 7.0.1 위장술
	skills["HUNTER"][SL(264735)] = nil		-- 8.0.1 적자생존
	skills["MAGE"][SL(110960)] = nil		-- 5.0.4 상급 투명화	
	skills["ROGUE"][SL(1966)] = nil			-- 클래식에는 버프가 없다
	skills["ROGUE"][SL(199754)] = nil		-- 7.0.1
	skills["PRIEST"][SL(15286)] = nil		-- 흡선 클래식은 생존기 아님
	skills["PRIEST"][SL(19236)] = nil		-- 구원의 기도 클래식은 생존기 아님
	skills["WARLOCK"][SL(108416)] = nil		-- 흑마 생존기가 없음. 없으면 오류 날까봐 하나 남겨둠	
	skills["PALADIN"][SL(31821)] = "오라"	-- 리치왕에선 생존기
	skills["PALADIN"][SL(64205)] = "성희"
	skills["PALADIN"][SL(86659)] = nil		-- 4.0.0
	skills["PALADIN"][SL(205191)] = nil		-- 7.0.1
	skills["PALADIN"][SL(212641)] = nil		-- 7.0.3	
	skills["DRUID"][SL(102558)] = nil		-- 화신: 우르속의 수호자	
	skills["SHAMAN"][SL(108281)] = nil		-- 
	skills["SHAMAN"][SL(210918)] = nil		-- 주술사 생존기가 없음. 없으면 오류 날까봐 하나 남겨둠
	skills["*"][SL(6940)] = "희손"		-- 희생의 손길
	skills["*"][SL(102342)] = nil
	skills["*"][SL(116849)] = nil
	skills["*"][SL(228049)] = nil
	skills["*"][SL(204018)] = nil
	skills["*"][SL(209426)] = nil
	skills["*"][SL(357170)] = nil
	wipe(skills["MONK"])
	wipe(skills["DEMONHUNTER"])
	wipe(skills["EVOKER"])
	
	wipe(skills["POTION"])
	skills["POTION"] = { [SL(3680)] = "하투", [SL(4079)] = "은폐", [SL(11392)] = "투명" }
	
	wipe(skills["SUB"])
	skills["SUB"] = { [SL(7744)] = "포세", [SL(20594)] = "석화" }
	
end

local checkSpellID = {
	[SL(86659)] = 86659, -- 고대 왕의 수호자(보호 특성)
}
local ignoreEndTime = { [SL(5384)] = true, [SL(122278)] = true }
for _, v in pairs(skills) do
	v[""] = nil
end


ignoreEndTime[""] = nil
checkSpellID[""] = nil

local function survivalSkillOnUpdate(self)
	if self.survivalSkillEndTime then
		self.survivalSkillTimeLeft = (":%d"):format(self.survivalSkillEndTime - GetTime() + 0.5)
	end
	InvenRaidFrames3Member_UpdateLostHealth(self)--이름 프레임 업데이트
end

local function addSurvivalSkill(self, spellKey, skillShortName, endTime)
	if self.survivalSkill and skillShortName ~= self.survivalSkill then	-- 이미 생존기가 켜져 있다면
		self.survivalPrevSkill = self.survivalSkillKey
	end
	self.survivalSkillKey = spellKey
	self.survivalSkill = skillShortName
	self.survivalSkillEndTime = endTime
	self.survivalSkillTimeLeft = self.survivalSkillEndTime and (self.survivalSkillEndTime - GetTime()) or ""
	if spellKey and not self.survivalticker then
		self.survivalticker = C_Timer.NewTicker(0.5, function() survivalSkillOnUpdate(self) end)
	end
end

local function initSurvivalSkill(self)
	if self.survivalticker then
		self.survivalticker:Cancel()
		self.survivalticker = nil
	end
	self.survivalSkillKey, self.survivalSkill, self.survivalSkillEndTime, self.survivalSkillTimeLeft, self.survivalPrevSkill = nil, nil, nil, nil, nil
end

local function allCheckSkill(unit, class)
	local findSpellInfoMain = {}
	local findSpellInfoClass = {}
	local findSpellInfoSub = {}
	local findSpellInfoPotion = {}
	IRF3:ForEachAura(unit, "HELPFUL", nil, 
		function(name, _, _, _, _, endTime)
			local spellKey = name
			if spellKey then
				if skills["*"][spellKey] then	-- 1순위가 찾아지면 바로 리턴
					findSpellInfoMain.spellKey = spellKey
					findSpellInfoMain.shortName = skills["*"][spellKey]
					findSpellInfoMain.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
					return true
				elseif class and skills[class][spellKey] then	-- pet은 class 가 nil로 올때가 있다
					findSpellInfoClass.spellKey = spellKey
					findSpellInfoClass.shortName = skills[class][spellKey]
					findSpellInfoClass.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
				elseif IRF3.db.units.showSurvivalSkillSub and skills["SUB"][spellKey] then
					findSpellInfoSub.spellKey = spellKey
					findSpellInfoSub.shortName = skills["SUB"][spellKey]
					findSpellInfoSub.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
				elseif IRF3.db.units.showSurvivalSkillPotion and skills["POTION"][spellKey] then
					findSpellInfoPotion.spellKey = spellKey
					findSpellInfoPotion.shortName = skills["POTION"][spellKey]
					findSpellInfoPotion.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
				end
				return true
			end
			return false
		end
	)
	
	if findSpellInfoMain.spellKey then
		return findSpellInfoMain.spellKey, findSpellInfoMain.shortName, findSpellInfoMain.endTime
	elseif findSpellInfoClass.spellKey then
		return findSpellInfoClass.spellKey, findSpellInfoClass.shortName, findSpellInfoClass.endTime
	elseif findSpellInfoSub.spellKey then
		return findSpellInfoSub.spellKey, findSpellInfoSub.shortName, findSpellInfoSub.endTime
	elseif findSpellInfoPotion.spellKey then
		return findSpellInfoPotion.spellKey, findSpellInfoPotion.shortName, findSpellInfoPotion.endTime
	end
	return nil
end

function InvenRaidFrames3Member_UpdateSurvivalSkill(self)
	if not IRF3.isClassic and UnitInRaid(self.unit) then
		InvenRaidFrames3Member_NewUpdateSurvivalSkill(self)
		return
	end
	
	if IRF3.db.units.useSurvivalSkill then
		local spellKey, skillShortName, endTime = allCheckSkill(self.displayedUnit, self.class)
		addSurvivalSkill(self, spellKey, skillShortName, endTime)
		survivalSkillOnUpdate(self)
	else
		initSurvivalSkill(self)
	end
	InvenRaidFrames3Member_UpdateLostHealth(self)--이름 프레임 업데이트
end

local function allNewCheckSkill(self, class)
	local findSpellInfoClass = {}
	local findSpellInfoSub = {}
	local findSpellInfoPotion = {}
	for auraInstanceID, aura in pairs(self.PlayerAuras) do
		local spellKey = aura.name
		local endTime = aura.expirationTime
		local isHelpful = aura.isHelpful
		if spellKey and isHelpful then
			if skills["*"][spellKey] then	-- 1순위가 찾아지면 바로 리턴
				return spellKey, skills["*"][spellKey], (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
			elseif class and skills[class][spellKey] then	-- pet은 class 가 nil로 올때가 있다
				findSpellInfoClass.spellKey = spellKey
				findSpellInfoClass.shortName = skills[class][spellKey]
				findSpellInfoClass.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
			elseif IRF3.db.units.showSurvivalSkillSub and skills["SUB"][spellKey] then
				findSpellInfoSub.spellKey = spellKey
				findSpellInfoSub.shortName = skills["SUB"][spellKey]
				findSpellInfoSub.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
			elseif IRF3.db.units.showSurvivalSkillPotion and skills["POTION"][spellKey] then
				findSpellInfoPotion.spellKey = spellKey
				findSpellInfoPotion.shortName = skills["POTION"][spellKey]
				findSpellInfoPotion.endTime = (not ignoreEndTime[spellKey] and endTime and endTime > 0) and endTime
			end
		end
	end
	
	if findSpellInfoClass.spellKey then
		return findSpellInfoClass.spellKey, findSpellInfoClass.shortName, findSpellInfoClass.endTime
	elseif findSpellInfoSub.spellKey then
		return findSpellInfoSub.spellKey, findSpellInfoSub.shortName, findSpellInfoSub.endTime
	elseif findSpellInfoPotion.spellKey then
		return findSpellInfoPotion.spellKey, findSpellInfoPotion.shortName, findSpellInfoPotion.endTime
	end
	return nil
end

function InvenRaidFrames3Member_NewUpdateSurvivalSkill(self)

	if not self.PlayerAuras then
		self.PlayerAuras = {}
	end
	
	if IRF3.db.units.useSurvivalSkill then
		local spellKey, skillShortName, endTime = allNewCheckSkill(self, self.class)
		addSurvivalSkill(self, spellKey, skillShortName, endTime)
	else
		initSurvivalSkill(self)
	end
	survivalSkillOnUpdate(self)
end