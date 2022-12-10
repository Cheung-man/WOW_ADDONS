local _G = _G
local IRF3 = _G[...]

local IRF3_RaidCheck = CreateFrame("Frame")
local dataTable = {};  		-- 플레이어 데이터
local IRF3_Raidcheck_Save = {};	-- 저장데이터

local IRF3_Raidcheck_Food = {
	308474, 
	308504, 
	308430, 
	308509, 
	327704, 
	327701, 
	327705, 
	327702, 
	308525, 
	341449, 
	327708, 
	327706, 
	327709, 
	308488, 
	308506, 
	308434,
	308514,
	308525,
	327707,
	308637,	
};

local IRF3_Raidcheck_Flask = {
	307187, --광대한 지평선의 영약 -- Stamina  -- 152640
	307185, --권능의 유령 영약 --  Main stat -- 171275
	307166, --거스름너울의 영약 --    -- 152641	
};

local IRF3_Raidcheck_Runes = {
	347901, -- 증강의 룬
};

local function getMemberCount()
	if(IsInRaid()) then
		return GetNumGroupMembers();
	elseif(IsInGroup())then
		return GetNumGroupMembers()-1;
	else
		return 0;
	end
end

local function getMemberName(index)
	local pName = "";
	if(IsInRaid()) then
		pName = GetUnitName("raid"..index, true);
	elseif(IsInGroup() and index > 0) then
		pName = GetUnitName("party"..index, true);
	elseif(index == 0) then
		pName = GetUnitName("player", true);
	end
	return pName;
end

local function getPlayerBuffs(index)
	local buffs = {};
	local duration = {};
	local buffName = {};
	local buffValue = {};
	local pclass = nil;

	local unitBuffTarget = "player";

	if(index > 0) then unitBuffTarget = getMemberName(index); end

	for i=1,40 do
		local spell, _, _, _, _,dur,_, _, _, spellId,_,_,_,_,_,v2 = UnitAura(unitBuffTarget, i, "HELPFUL");

		if spell then
			buffs[i] 	= spellId;

			if(dur == 0) then
				duration[i] = math.floor(-1337);
			else
				duration[i] = math.floor((dur-GetTime())/60);
			end
	
			if(buffs[i] == 308474) then v2 = 18; end
			if(buffs[i] == 308504) then v2 = 18; end
			if(buffs[i] == 308430) then v2 = 18; end
			if(buffs[i] == 308509) then v2 = 18; end
			if(buffs[i] == 327704) then v2 = 18; end
			if(buffs[i] == 327701) then v2 = 18; end
			if(buffs[i] == 327705) then v2 = 18; end
			if(buffs[i] == 327702) then v2 = 18; end
			if(buffs[i] == 308525) then v2 = 18; end
			
			if(buffs[i] == 341449) then v2 = 20; end
			if(buffs[i] == 327708) then v2 = 20; end
			if(buffs[i] == 327706) then v2 = 20; end
			if(buffs[i] == 327709) then v2 = 20; end			
			
			if(buffs[i] == 308488) then v2 = 30; end
			if(buffs[i] == 308506) then v2 = 30; end
			if(buffs[i] == 308434) then v2 = 30; end
			if(buffs[i] == 308514) then v2 = 30; end
			if(buffs[i] == 308525) then v2 = 30; end
			if(buffs[i] == 327707) then v2 = 30; end
			if(buffs[i] == 308637) then v2 = 30; end

			if(buffs[i] == 307187) then v2 = 70; end
			if(buffs[i] == 307185) then v2 = 70; end
			if(buffs[i] == 307166) then v2 = 70; end
			
			if(buffs[i] == 347901) then v2 = 18; end		
			
			
			if(v2) then
				buffValue[i] = v2;
			else
				buffValue[i] = 0;
			end

		end
	end
	return {buffs, duration, buffValue};
end

local function playerHasBuff(mode, index)
	local checkArr = {};
	local Flags;

	if(mode == "flask") then
		checkArr = IRF3_Raidcheck_Flask;
		Flags = IRF3.db.units.flaskFlags;
	end

	if(mode == "rune") then
		checkArr = IRF3_Raidcheck_Runes;
		Flags = IRF3.db.units.runeFlags;
	end

	if(mode == "food") then
		checkArr = IRF3_Raidcheck_Food;
		Flags = IRF3.db.units.foodFlags;
	end

	local data 		= getPlayerBuffs(index);
	local buffs 		= data[1];
	local duration 	= data[2];
	local value 		= data[3];
	local val;

	for id, spellID in pairs(checkArr) do
		for i=1,40 do
			if(buffs[i] and spellID and Flags) then
				if(value[i]) then val = value[i]; else val = 2; end
				if(buffs[i] == spellID and val >= Flags) then
					if(duration[i] == -1337) then
						return 3;
					elseif(duration[i] < 10) then
						return 2;
					else
						return 1;
					end
				end
			end
		end
	end

	return 0;
end

local function getPlayerClass(index)
	local unitBuffTarget = "player";
	if(index > 0) then unitBuffTarget = getMemberName(index); end
	local _,_,pclass = UnitClass(unitBuffTarget);
	return pclass;
end

local function loadData()
	dataTable = {};
	local x= 0;

	if(getMemberCount() == 0 or (IsInGroup() and IsInRaid() == false)) then
		dataTable[1] = {getMemberName(0), playerHasBuff("flask", 0), playerHasBuff("food", 0), getPlayerClass(0),playerHasBuff("rune", 0)};
		x = 1;
	end

	for i = 1, getMemberCount() do
		local name		= getMemberName(i);
		local hasFlask 	= playerHasBuff("flask", i);
		local hasFood 	= playerHasBuff("food", i);
		local hasRune 	= playerHasBuff("rune", i);
		dataTable[i+x] = {name, hasFlask, hasFood, getPlayerClass(i), hasRune};
	end
end

local function getNoRelamName(name)
	local ix = string.find(name, "-");
		if(ix) then return string.sub(name, 0, ix-1); else return name; end
end

local function announce()
	loadData();

	local nofood 	= "";
	local noflask = "";
	local norune  = "";

	local expfood 	= "";
	local expflask 	= "";
	local exprune 	= "";

	local issuesFood 	= true;
	local issuesFlask 	= true;
	local issuesRune 	= true;

	local FoodTreshold  = IRF3.db.units.foodFlags
	local FlaskTreshold = IRF3.db.units.flaskFlags

	local extensionFlask 	= "";
	local extensionFood 	= "";
	local extensionRune 	= "";

	local channel = "";
	local printnames = "";

	extensionFlask 	= " (+"..FlaskTreshold..")";
	extensionFood 	= " (+"..FoodTreshold..")";

	for i = 1, 40 do
		if(dataTable[i]) then
			local name = dataTable[i][1];
			name = getNoRelamName(name);
			local _, _, subgroup, _, _, _, _, _, _, _, _ = GetRaidRosterInfo(i);

			if(dataTable[i][2] == 0) then noflask 	= noflask..""..name..", "; end
			if(dataTable[i][2] == 2) then expflask 	= expflask..""..name.."(만료 경고)"..", "; end

			if(dataTable[i][3] == 0) then nofood 	= nofood..""..name..", "; end
			if(dataTable[i][3] == 2) then expfood 	= expfood..""..name.."(만료 경고)"..", "; end

			if(dataTable[i][5] == 0) then norune 	= norune..""..name..", "; end
			if(dataTable[i][5] == 2) then exprune 	= exprune..""..name.."(만료 경고)"..", "; end
		end
	end

	if(IsInRaid()) 		then channel = "RAID";
	elseif(IsInGroup()) then channel = "PARTY";
	else channel = "SAY"; end

	--Print if everything is good
	if(IRF3.db.units.annFood and string.len(nofood) == 0 and string.len(expfood) == 0) then
		issuesFood = false;
	end

	if(IRF3.db.units.annFlask and string.len(noflask) == 0 and string.len(expflask) == 0) then
		issuesFlask = false;
	end

	if(IRF3.db.units.annRune and string.len(norune) == 0 and string.len(exprune) == 0) then
		issuesRune = false;
	end

	if(IRF3.db.units.annRune == false) then issuesRune = false; end
	if(IRF3.db.units.annFlask == false) then issuesFlask = false; end
	if(IRF3.db.units.annFood == false) then issuesFood = false; end

	if(issuesFood == false and issuesRune == false and issuesFlask == false)then
		if IRF3.db.units.RaidCheckAnn then
			SendChatMessage("전원 도핑이 완료된 상태입니다.", channel, nil, nil);
			else IRF3:Message("전원 도핑이 완료된 상태입니다.")
		end
	end

	if(IRF3.db.units.annFood) then
		if (issuesFood == true or issuesRune == true or issuesFlask == true) then
			if IRF3.db.units.RaidCheckAnn then
				SendChatMessage("도핑이 미흡한 사람이 있습니다.", channel, nil, nil);
				else IRF3:Message("도핑이 미흡한 사람이 있습니다.")
			end
		end
	end
	--Print warnings
	if(IRF3.db.units.annFood) then
		if(string.len(nofood) > 1 or string.len(expfood) > 1) then
			--Cut ending comma
			printnames = nofood..expfood;
			printnames = string.sub(printnames, 0, -3);
			if IRF3.db.units.RaidCheckAnn then
				SendChatMessage("음식 없음: "..printnames, channel, nil, nil);
				else IRF3:Message("음식 없음: "..printnames)
			end
		end
	end

	if(IRF3.db.units.annFlask) then
		if(string.len(noflask) > 1 or string.len(expflask) > 1) then
			--Cut ending comma
			printnames = noflask..expflask;
			printnames = string.sub(printnames, 0, -3);
			if IRF3.db.units.RaidCheckAnn then
				SendChatMessage("영약 없음: "..printnames, channel, nil, nil);
				else IRF3:Message("영약 없음: "..printnames)
			end
		end
	end

	if(IRF3.db.units.annRune) then
		if(IRF3.db.units.showRunes) then
			if(string.len(norune) > 1 or string.len(exprune) > 1)  then
				--Cut ending comma
				printnames = norune..exprune;
				printnames = string.sub(printnames, 0, -3);
				if IRF3.db.units.RaidCheckAnn then
					SendChatMessage("증강의 룬 없음: "..printnames, channel, nil, nil);
					else IRF3:Message("증강의 룬 없음: "..printnames)
				end
			end
		end
	end
end

IRF3_RaidCheck:RegisterEvent("READY_CHECK");

-- 전투준비시 자동알림
function IRF3_RaidCheck:OnEvent(event, addon)
	if event == "READY_CHECK" then
		if IRF3.db.units.RaidCheck then
			loadData();
			announce();
		end
	end
end


IRF3_RaidCheck:SetScript("OnEvent", IRF3_RaidCheck.OnEvent);

function InvenRaidFrames3Member_UpdateRaidCheck(self)
end

