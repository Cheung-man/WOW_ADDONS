﻿local IRF3 = InvenRaidFrames3
local Option = IRF3.optionFrame
local LBO = LibStub("LibBlueOption-1.0")

local pairs = _G.pairs

function Option:CreateAggroMenu(menu, parent)
	local function update(member)
		if member:IsVisible() and member.hasAggro then
			InvenRaidFrames3Member_UpdateDisplayText(member)
		end
	end
	menu.arrow = LBO:CreateWidget("CheckBox", parent, "어그로 화살표 보기", "어그로를 획득한 플레이어의 이름 왼쪽에 붉은색 화살표를 표시합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useAggroArrow
		end,
		function(v)
			IRF3.db.units.useAggroArrow = v
			Option:UpdateMember(update)
		end
	)
	menu.arrow:SetPoint("TOPLEFT", 5, 5)
	local useList = { "사용 안함", "항상", "파티/공격대", "공격대" }
	menu.use = LBO:CreateWidget("DropDown", parent, "어그로 소리 재생 조건", "어그로 획득/손실 시 소리를 재생할 조건을 설정합니다.", nil, nil, true,
		function() return IRF3.db.units.aggroType, useList end,
		function(v)
			IRF3.db.units.aggroType = v
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOP", menu.arrow, "BOTTOM", 0, -10)
	local function disable()
		return IRF3.db.units.aggroType == 1
	end
	menu.gain = LBO:CreateWidget("Media", parent, "어그로 획득 시 소리", "자신이 어그로를 획득 했을때 소리를 재생합니다. None으로 설정하시면 소리 재생 기능을 사용하지 않습니다.", nil, disable, true,
		function()
			return IRF3.db.units.aggroGain, "sound"
		end,
		function(v)
			IRF3.db.units.aggroGain = v
		end
	)
	menu.gain:SetPoint("TOP", menu.use, "BOTTOM", 0, -10)
	menu.lost = LBO:CreateWidget("Media", parent, "어그로 손실 시 소리", "자신이 어그로를 잃었을때 소리를 재생합니다. None으로 설정하시면 소리 재생 기능을 사용하지 않습니다.", nil, disable, true,
		function()
			return IRF3.db.units.aggroLost, "sound"
		end,
		function(v)
			IRF3.db.units.aggroLost = v
		end
	)
	menu.lost:SetPoint("TOP", menu.gain, "TOP", 0, 0)
	menu.lost:SetPoint("RIGHT", -5, 0)
end

function Option:CreateOutlineMenu(menu, parent)
	local function update(member)
		member:SetupOutline()
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateOutline(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Member_UpdateOutline(member.petButton)
			end
		end
	end
	local outlineList = { "사용 안함", "해제 가능한 디버프", "대상", "마우스 오버", "체력 낮음(퍼센트)", "어그로", "전술목표 아이콘", "체력 낮음(실수치)" }
	menu.use = LBO:CreateWidget("DropDown", parent, "외곽선 동작", "각 공격대원 프레임의 주위에 있는 외곽선의 기능을 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.outline.type + 1, outlineList
		end,
		function(v)
			IRF3.db.units.outline.type = v - 1
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -5)
	local function disable()
		return IRF3.db.units.outline.type == 0
	end
	menu.scale = LBO:CreateWidget("Slider", parent, "외곽선 크기", "외곽선의 크기를 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.outline.scale * 100, 50, 150, 1, "%" end,
		function(v)
			IRF3.db.units.outline.scale = v / 100
			Option:UpdateMember(update)
		end
	)
	menu.scale:SetPoint("TOP", menu.use, "BOTTOM", 0, -10)
	menu.alpha = LBO:CreateWidget("Slider", parent, "외곽선 투명도", "외곽선의 투명도를 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.outline.alpha * 100, 10, 100, 1, "%" end,
		function(v)
			IRF3.db.units.outline.alpha = v / 100
			Option:UpdateMember(update)
		end
	)
	menu.alpha:SetPoint("TOP", menu.scale, "TOP", 0, 0)
	menu.alpha:SetPoint("RIGHT", -5, 0)
	local function getColor(key)
		return IRF3.db.units.outline[key][1], IRF3.db.units.outline[key][2], IRF3.db.units.outline[key][3]
	end
	local function setColor(r, g, b, key)
		IRF3.db.units.outline[key][1], IRF3.db.units.outline[key][2], IRF3.db.units.outline[key][3] = r, g, b
		Option:UpdateMember(update)
	end
	menu.targetColor = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "대상을 선택했을 때 외곽선 색상을 설정합니다", function() return IRF3.db.units.outline.type ~= 2 end, nil, true, getColor, setColor, "targetColor")
	menu.targetColor:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	menu.mouseoverColor = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "마우스 오버한 대상의 외곽선 색상을 설정합니다", function() return IRF3.db.units.outline.type ~= 3 end, nil, true, getColor, setColor, "mouseoverColor")
	menu.mouseoverColor:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	menu.aggroColor = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "어그로를 획득한 대상의 외곽선 색상을 설정합니다", function() return IRF3.db.units.outline.type ~= 5 end, nil, true, getColor, setColor, "aggroColor")
	menu.aggroColor:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	local function isLowHealth()
		return IRF3.db.units.outline.type ~= 4
	end
	menu.lowHealthColor = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "생명력이 낮은 대상의 외곽선 색상을 설정합니다", isLowHealth, nil, true, getColor, setColor, "lowHealthColor")
	menu.lowHealthColor:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	menu.lowHealth = LBO:CreateWidget("Slider", parent, "체력 저하 경고 체력량", "지정한 퍼센트 이하로 체력이 떨어지면 외곽선을 표시합니다.", isLowHealth, nil, true,
		function() return IRF3.db.units.outline.lowHealth * 100, 1, 99, 1, "%" end,
		function(v)
			IRF3.db.units.outline.lowHealth = v / 100
			Option:UpdateMember(update)
		end
	)
	menu.lowHealth:SetPoint("TOP", menu.alpha, "BOTTOM", 0, -10)
	local function isRaidIcon()
		return IRF3.db.units.outline.type ~= 6
	end
	menu.raidIconColor = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "지정한 전술 목표 아이콘을 가진 대상의 외곽선 색상을 설정합니다", isRaidIcon, nil, true, getColor, setColor, "raidIconColor")
	menu.raidIconColor:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	local function getRaidIcon(icon)
		return IRF3.db.units.outline.raidIcon[icon]
	end
	local function setRaidIcon(v, icon)
		IRF3.db.units.outline.raidIcon[icon] = v
		Option:UpdateMember(update)
	end
	for i, text in ipairs(Option.dropdownTable["징표"]) do
		menu["raidIcon"..i] = LBO:CreateWidget("CheckBox", parent, text, text.."에 외곽선을 표시합니다.", isRaidIcon, nil, true, getRaidIcon, setRaidIcon, i)
		if i == 1 then
			menu["raidIcon"..i]:SetPoint("TOP", menu.raidIconColor, "BOTTOM", 0, 0)
		elseif i == 2 then
			menu["raidIcon"..i]:SetPoint("TOP", menu.raidIcon1, 0, 0)
			menu["raidIcon"..i]:SetPoint("RIGHT", -5, 0)
		else
			menu["raidIcon"..i]:SetPoint("TOP", menu["raidIcon"..(i - 2)], "BOTTOM", 0, 14)
		end
	end
	local function isLowHealth2()
		return IRF3.db.units.outline.type ~= 7
	end
	menu.lowHealthColor2 = LBO:CreateWidget("ColorPicker", parent, "외곽선 색상", "생명력이 낮은 대상의 외곽선 색상을 설정합니다", isLowHealth2, nil, true, getColor, setColor, "lowHealthColor2")
	menu.lowHealthColor2:SetPoint("TOP", menu.scale, "BOTTOM", 0, -10)
	menu.lowHealth2 = LBO:CreateWidget("Slider", parent, "체력 저하 경고 생명력량", "지정한 생명력 이하로 떨어지면 외곽선을 표시합니다. (키마이론에서 10000으로 설정하면 유용합니다)", isLowHealth2, nil, true,
		function() return IRF3.db.units.outline.lowHealth2, 1, 99999, 1, "" end,
		function(v)
			IRF3.db.units.outline.lowHealth2 = v
			Option:UpdateMember(update)
		end
	)
	menu.lowHealth2:SetPoint("TOP", menu.alpha, "BOTTOM", 0, -10)
end

function Option:CreateRangeMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_OnUpdate2(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Member_OnUpdate2(member.petButton)
			end
		end
	end
	menu.outrange = LBO:CreateWidget("Slider", parent, "사정 거리 밖 투명도", "사정 거리가 벗어난 플레이어의 체력바 투명도를 조절합니다.", nil, nil, true,
		function()
			return IRF3.db.units.fadeOutAlpha * 100, 0, 100, 1, "%"
		end,
		function(v)
			IRF3.db.units.fadeOutAlpha = v / 100
			Option:UpdateMember(update)
		end
	)
	menu.outrange:SetPoint("TOPLEFT", 5, -10)
	menu.outRangeName = LBO:CreateWidget("CheckBox", parent, "먼 사정거리 직업별 이름 색상 사용", "사정거리가 벗어난 플레이어의 이름 색상을 직업 색상으로 표시합니다. 사정거리를 벗어난 죽은 대상은 반투명한 이름으로 출력됩니다.", nil, nil, true,
		function()
			return IRF3.db.units.outRangeName
		end,
		function(v)
			IRF3.db.units.outRangeName = v
			Option:UpdateMember(update)
		end
	)
	menu.outRangeName:SetPoint("TOP", menu.outrange, "BOTTOM", 0, -5)
	menu.mana = LBO:CreateWidget("CheckBox", parent, "먼 사정거리 마나바 투명도 적용", "사정거리가 벗어난 플레이어의 마나바도 투명도를 적용합니다.", nil, nil, true,
		function()
			return IRF3.db.units.fadeOutOfRangePower
		end,
		function(v)
			IRF3.db.units.fadeOutOfRangePower = v
			Option:UpdateMember(update)
		end
	)
	menu.mana:SetPoint("TOP", menu.outRangeName, "BOTTOM", 0, 0)
end

function Option:CreateLostHealthMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateDisplayText(member)
		end
	end
	local typeList = { "표시 안함", "손실 생명력", "손실 생명력 퍼센트", "남은 생명력", "남은 생명력 퍼센트" }
	menu.type = LBO:CreateWidget("DropDown", parent, "표시 방식", "생명력이 표시될 방식을 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.healthType + 1, typeList
		end,
		function(v)
			IRF3.db.units.healthType = v - 1
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.type:SetPoint("TOPLEFT", 5, -5)
	local function disable()
		return IRF3.db.units.healthType == 0
	end
	local rangeList = { "항상", "사정거리 안", "사정거리 밖" }
	menu.range = LBO:CreateWidget("DropDown", parent, "표시 조건", "생명력을 표시할 조건을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.healthRange, rangeList
		end,
		function(v)
			IRF3.db.units.healthRange = v
			Option:UpdateMember(update)
		end
	)
	menu.range:SetPoint("TOPRIGHT", -5, -5)
	menu.short = LBO:CreateWidget("CheckBox", parent, "생명력 짧게 표시", "생명력 숫자를 1000 단위로 짧게 표시합니다. 예를 들어 3700의 표시할 생명력이 있다면 이를 3.7로 표시합니다. 또 퍼센트 방식의 표현일 경우 % 기호를 표시하지 않습니다.", nil, disable, true,
		function()
			return IRF3.db.units.shortLostHealth
		end,
		function(v)
			IRF3.db.units.shortLostHealth = v
			Option:UpdateMember(update)
		end
	)
	menu.short:SetPoint("TOP", menu.type, "BOTTOM", 0, -5)
	menu.nameEndl = LBO:CreateWidget("CheckBox", parent, "두줄로 표시", "이름과 생명력/생존기를 두줄로 표시합니다.", nil, nil, true,
		function()
			return IRF3.db.units.nameEndl
		end,
		function(v)
			IRF3.db.units.nameEndl = v
			Option:UpdateMember(IRF3.headers[0].members[1].SetupPowerBar)
			Option:UpdateMember(update)
			Option:UpdatePreview()
		end
	)
	menu.nameEndl:SetPoint("TOP", menu.range, "BOTTOM", 0, -5)
	menu.healthRed = LBO:CreateWidget("CheckBox", parent, "생명력 색상 표시", "생명력 글자에 색상을 표시합니다. (손실: 붉은색, 흡수: 파랑색)", nil, disable, true,
		function()
			return IRF3.db.units.healthRed
		end,
		function(v)
			IRF3.db.units.healthRed = v
			Option:UpdateMember(update)
		end
	)
	menu.healthRed:SetPoint("TOP", menu.short, "BOTTOM", 0, -5)
	menu.showAbsorb = LBO:CreateWidget("CheckBox", parent, "보호막량 표시", "최대 체력 상태에서 보호막이 있을 경우 보호막량을 표시합니다.", nil, disable, true,
		function()
			return IRF3.db.units.showAbsorbHealth
		end,
		function(v)
			IRF3.db.units.showAbsorbHealth = v
			Option:UpdateMember(update)
		end
	)
	menu.showAbsorb:SetPoint("TOP", menu.healthRed, "BOTTOM", 0, -5)
end

function Option:UpdateIconPos()
	Option:UpdateMember(InvenRaidFrames3Member_SetupIconPos)
end

function Option:CreateBuffCheckMenu(menu, parent)
	local raidBuffs = {}
	for spellId in pairs(InvenRaidFrames3CharDB.classBuff2) do
		if type(spellId) == "number" and spellId > 0 and spellId == floor(spellId) and GetSpellInfo(spellId) and not IsPassiveSpell(spellId) then
			if not (IRF3.raidBuffData.link and IRF3.raidBuffData.link[spellId]) then
				table.insert(raidBuffs, spellId)
			end
		end
	end

	if #raidBuffs == 0 then
		menu.text = parent:GetParent():CreateFontString(nil, "OVERLAY", "GameFontNormal")
		menu.text:SetPoint("CENTER", 0, 0)
		menu.text:SetText("The function is currently unavailable.")
		return
	else
		table.sort(raidBuffs, function(a, b)
			local A, B = GetSpellInfo(a), GetSpellInfo(b)
			if A == B then
				return a < b
			else
				return A < B
			end
		end)
	end

	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "버프 확인 아이콘을 표시할 위치를 설정합니다.", nil, nil, nil,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.buffIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.buffIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOPLEFT", 5, -10)
	local function updateSize(member)
		if member:IsVisible() then
			if member.buffIcon1:IsVisible() then
				member.buffIcon1:SetSize(IRF3.db.units.buffIconSize, IRF3.db.units.buffIconSize)
			end
			if member.buffIcon2:IsVisible() then
				member.buffIcon2:SetSize(IRF3.db.units.buffIconSize, IRF3.db.units.buffIconSize)
			end
		end
	end
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "버프 확인 아이콘의 크기를 설정합니다.", nil, nil, nil,
		function()
			return IRF3.db.units.buffIconSize, 8, 20, 1, "px"
		end,
		function(v)
			IRF3.db.units.buffIconSize = v
			Option:UpdateMember(updateSize)
		end
	)
	menu.size:SetPoint("TOPRIGHT", -5, -10)
	
	--[==[
	local printedSpell = {}
	if IRF3.playerClass == "PALADIN" and IRF3.castableBuffs[1] and IRF3.castableBuffs[8] then
		printedSpell[IRF3.castableBuffs[1][1]] = 8
		printedSpell[IRF3.castableBuffs[8][1]] = true
	end
	]==]

	local buffTypeList = { "표시 안함", "버프가 없을 때 표시", "버프가 있을 때 표시" }

	local function getBuff(spellId)
		return (InvenRaidFrames3CharDB.classBuff2[spellId] or 0) + 1, buffTypeList
	end

	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateBuffs(member)
		end
	end
	
	local function setBuff(v, spellId)
		InvenRaidFrames3CharDB.classBuff2[spellId] = v - 1
		if IRF3.raidBuffData.link and IRF3.raidBuffData.link[spellId] then
--			InvenRaidFrames3CharDB.classBuff2[IRF3.raidBuffData.link[spellId]] = v - 1
		end
		Option:UpdateMember(update)
	end

	local _, spellName, spellIcon, text

	for i, spellId in ipairs(raidBuffs) do
		spellName, _, spellIcon = GetSpellInfo(spellId)
		text = ("|T%s:0:0:0:-1|t %s"):format(spellIcon, spellName)
		if IRF3.raidBuffData.link then
			for p, v in pairs(IRF3.raidBuffData.link) do
				if v == spellId then
					spellName, _, spellIcon = GetSpellInfo(p)
					text = text..", "..("|T%s:0:0:0:-1|t %s"):format(spellIcon, spellName)
					break
				end
			end
		end
		menu["buff"..i] = LBO:CreateWidget("DropDown", parent, text, text..": ".."버프의 표시 여부를 설정합니다.", nil, nil, nil, getBuff, setBuff, spellId)
		if i == 1 then
			menu["buff"..i]:SetPoint("TOP", menu.pos, "BOTTOM", 0, -10)
		elseif i == 2 then
			menu["buff"..i]:SetPoint("TOP", menu.size, "BOTTOM", 0, -10)
		else
			menu["buff"..i]:SetPoint("TOP", menu["buff"..(i - 2)], "BOTTOM", 0, -10)
		end
	end
end

function Option:CreateSpellTimerMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateSpellTimer(member)
		end
	end
	local useList = { "사용 안함", "내가 시전한 버프", "내가 시전한 디버프", "모든 버프", "모든 디버프" }
	local function getUse(id)
		return InvenRaidFrames3CharDB.spellTimer[id].use + 1, useList
	end
	local function setUse(v, id)
		if self and self:GetParent() then
			if not self:GetParent():IsShown() then
IRF3:PRINT("IRF3 CreateSpellTimerMenu return")
				return
			else
				if self:GetParent():GetParent() then
					if not self:GetParent():GetParent():IsShown() then
IRF3:PRINT("IRF3 CreateSpellTimerMenu return")
						return
					else
IRF3:PRINT("IRF3 CreateSpellTimerMenu shown")
					end
				end
			end
		end
		InvenRaidFrames3CharDB.spellTimer[id].use = v - 1
		Option:UpdateMember(update)
		LBO:Refresh(parent)
		IRF3:BuildSpellTimerList()
		IRF3:UpdateSpellTimerFont()
		IRF3:UpdateSpellTimerWidth()
	end
	local function disable(id)
		return InvenRaidFrames3CharDB.spellTimer[id].use == 0
	end
	local function getPos(id)
		return Option.dropdownTable["아이콘변환"][InvenRaidFrames3CharDB.spellTimer[id].pos], Option.dropdownTable["아이콘"]
	end
	local function setPos(v, id)
		InvenRaidFrames3CharDB.spellTimer[id].pos = Option.dropdownTable["아이콘변환"][v]
		Option:UpdateIconPos()
		IRF3:UpdateSpellTimerWidth()
	end
	local displayList = { "아이콘 + 남은 시간", "아이콘", "남은 시간", "아이콘 + 경과 시간", "경과 시간" }
	local function getDisplay(id)
		return InvenRaidFrames3CharDB.spellTimer[id].display, displayList
	end
	local function setDisplay(v, id)
		InvenRaidFrames3CharDB.spellTimer[id].display = v
		Option:UpdateMember(update)
		IRF3:BuildSpellTimerList()
		IRF3:UpdateSpellTimerFont()
	end
	local function getScale(id)
		return InvenRaidFrames3CharDB.spellTimer[id].scale * 100, 50, 150, 1, "%"
	end
	local function setScale(v, id)
		InvenRaidFrames3CharDB.spellTimer[id].scale = v / 100
		Option:UpdateMember(update)
		IRF3:BuildSpellTimerList()
		IRF3:UpdateSpellTimerFont()
	end
	local function getName(id)
		return InvenRaidFrames3CharDB.spellTimer[id].name or ""
	end
	local function setName(v, id)
		v = v:trim()
		InvenRaidFrames3CharDB.spellTimer[id].name = v ~= "" and v or nil
		Option:UpdateMember(update)
		IRF3:BuildSpellTimerList()
		IRF3:UpdateSpellTimerFont()
	end

	menu.enableSpellTimerType1 = LBO:CreateWidget("CheckBox", parent, "아이콘과 남은 시간을 겹치게 표시합니다.", "주문 타이머의 아이콘과 타이머 폰트의 위치를 겹치게 합니다.", nil, nil, true,
		function() return IRF3.db.enableSpellTimerType1 end,
		function(v)
			IRF3.db.enableSpellTimerType1 = v
			IRF3:UpdateSpellTimerFont()
			IRF3:UpdateSpellTimerWidth()
		end
	)
	menu.enableSpellTimerType1:SetPoint("LEFT", 0, -15)

	menu.enableFadeIn = LBO:CreateWidget("CheckBox", parent, "아이콘의 등장 연출을 사용합니다.", "주문 타이머와 약화 효과의 점점 커지는 연출을 활성화 합니다.", nil, nil, true,
		function() return IRF3.db.enableFadeIn end,
		function(v)
			IRF3.db.enableFadeIn = v
		end
	)
	menu.enableFadeIn:SetPoint("TOP", menu.enableSpellTimerType1, "BOTTOM", 0, 10)
	
	menu.spellTimerFont = LBO:CreateWidget("Font", parent, "주문 타이머 남은 시간 글꼴 설정", "주문 타이머 남은 시간 글꼴을 변경합니다.", nil, nil, true,
		function()
			return IRF3.db.spellTimerFont.file, IRF3.db.spellTimerFont.size, IRF3.db.spellTimerFont.attribute, IRF3.db.spellTimerFont.shadow
		end,
		function(file, size, attribute, shadow)
			IRF3.db.spellTimerFont.file, IRF3.db.spellTimerFont.size, IRF3.db.spellTimerFont.attribute, IRF3.db.spellTimerFont.shadow = file, size, attribute, shadow
			IRF3:UpdateSpellTimerFont()
			Option:UpdatePreview()
		end
	)
	menu.spellTimerFont:SetPoint("TOP", menu.enableFadeIn, "BOTTOM", 20, -10)
	
	menu.spellTimerColor = LBO:CreateWidget("ColorPicker", parent, "주문 타이머 남은 시간 색상", "주문 타이머 남은 시간 색상을 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.colors.spellTimer[1], IRF3.db.colors.spellTimer[2], IRF3.db.colors.spellTimer[3]
		end,
		function(r, g, b)
			IRF3.db.colors.spellTimer[1], IRF3.db.colors.spellTimer[2], IRF3.db.colors.spellTimer[3] = r, g, b
			IRF3:UpdateSpellTimerFont()
			Option:UpdatePreview()
		end
	)
	menu.spellTimerColor:SetPoint("TOP", menu.spellTimerFont, "BOTTOM", 200, 35)
	
	menu.spellTimerCountFont = LBO:CreateWidget("Font", parent, "주문 타이머 중첩 갯수 글꼴 설정", "주문 타이머 중첩 갯수 글꼴을 변경합니다.", nil, nil, true,
		function()
			return IRF3.db.spellTimerCountFont.file, IRF3.db.spellTimerCountFont.size, IRF3.db.spellTimerCountFont.attribute, IRF3.db.spellTimerCountFont.shadow
		end,
		function(file, size, attribute, shadow)
			IRF3.db.spellTimerCountFont.file, IRF3.db.spellTimerCountFont.size, IRF3.db.spellTimerCountFont.attribute, IRF3.db.spellTimerCountFont.shadow = file, size, attribute, shadow
			IRF3:UpdateSpellTimerFont()
			Option:UpdatePreview()
		end
	)
	menu.spellTimerCountFont:SetPoint("TOP", menu.spellTimerFont, "BOTTOM", 0, -10)
	
	menu.spellTimerCountColor = LBO:CreateWidget("ColorPicker", parent, "주문 타이머 중첩 갯수 색상", "주문 타이머 중첩 갯수 색상을 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.colors.spellTimerCount[1], IRF3.db.colors.spellTimerCount[2], IRF3.db.colors.spellTimerCount[3]
		end,
		function(r, g, b)
			IRF3.db.colors.spellTimerCount[1], IRF3.db.colors.spellTimerCount[2], IRF3.db.colors.spellTimerCount[3] = r, g, b
			IRF3:UpdateSpellTimerFont()
			Option:UpdatePreview()
		end
	)
	menu.spellTimerCountColor:SetPoint("TOP", menu.spellTimerCountFont, "BOTTOM", 200, 35)
	
	for i, info in ipairs(InvenRaidFrames3CharDB.spellTimer) do
		menu["use"..i] = LBO:CreateWidget("DropDown", parent, "주문 타이머 "..i, "주문 타이머 "..i.."의 사용 여부 및 버프/디버프 속성을 설정합니다.", nil, nil, true, getUse, setUse, i)
		if i == 1 then
			menu["use"..i]:SetPoint("TOP", menu.spellTimerCountFont, "BOTTOM", 0, -20)
			--menu["use"..i]:SetPoint("TOP", 0, -5)
		else
			menu["use"..i]:SetPoint("TOP", menu["name"..(i - 1)], "BOTTOM", 0, -20)
		end
		menu["use"..i]:SetPoint("LEFT", 5, 0)
		menu["pos"..i] = LBO:CreateWidget("DropDown", parent, "위치", "주문 타이머 "..i.."의 위치를 설정합니다.", nil, disable, true, getPos, setPos, i)
		menu["pos"..i]:SetPoint("TOP", menu["use"..i], "TOP", 0, 0)
		menu["pos"..i]:SetPoint("RIGHT", -5, 0)
		menu["display"..i] = LBO:CreateWidget("DropDown", parent, "표시 방식", "주문 타이머 "..i.."의 표시 방식를 설정합니다.", nil, disable, true, getDisplay, setDisplay, i)
		menu["display"..i]:SetPoint("TOP", menu["use"..i], "BOTTOM", 0, -5)
		menu["scale"..i] = LBO:CreateWidget("Slider", parent, "크기", "주문 타이머 "..i.."의 크기를 설정합니다.", nil, disable, true, getScale, setScale, i)
		menu["scale"..i]:SetPoint("TOP", menu["pos"..i], "BOTTOM", 0, -5)
		menu["name"..i] = LBO:CreateWidget("EditBox", parent, "버프/디버프 이름", "주문 타이머 "..i.."로 사용할 버프 혹은 디버프의 이름이나 주문 번호(Spell ID)을 입력하세요. 입력 후 꼭 Enter키를 눌러야 변경 사항이 적용됩니다.", nil, disable, true, getName, setName, i)
		menu["name"..i].title:ClearAllPoints()
		menu["name"..i].title:SetPoint("TOP", 0, -3)
		menu["name"..i].box:ClearAllPoints()
		menu["name"..i].box:SetPoint("TOP", menu["name"..i].title, "BOTTOM", 0, -7)
		menu["name"..i].box:SetPoint("LEFT", 0, 0)
		menu["name"..i].box:SetPoint("RIGHT", 0, 0)
		menu["name"..i]:SetPoint("TOP", menu["display"..i], "BOTTOM", 0, -5)
		menu["name"..i]:SetPoint("LEFT", 5, 0)
		menu["name"..i]:SetPoint("RIGHT", -5, 0)
	end
end

function Option:CreateSurvivalSkillMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateSurvivalSkill(member)
			InvenRaidFrames3Member_UpdateDisplayText(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "생존기 보기", "플레이어가 시전한 생존기술(방패의 벽, 얼음 방패 등)을 플레이어의 이름과 대체합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useSurvivalSkill
		end,
		function(v)
			IRF3.db.units.useSurvivalSkill = v
			LBO:Refresh(parent)
			Option:UpdateMember(update)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 0)
	menu.timer = LBO:CreateWidget("CheckBox", parent, "생존기 남은 시간 보기", "플레이어가 시전한 생존기술의 남은 시간을 추가로 표시합니다.", nil, function() return not IRF3.db.units.useSurvivalSkill end, true,
		function()
			return IRF3.db.units.showSurvivalSkillTimer
		end,
		function(v)
			IRF3.db.units.showSurvivalSkillTimer = v
			Option:UpdateMember(update)
		end
	)
	menu.timer:SetPoint("TOPRIGHT", -5, 0)
	menu.sub = LBO:CreateWidget("CheckBox", parent, "준생존기 보기", "악마사냥꾼 악마 쐐기나 양조 수도사의 무쇠가죽주같은 재사용 대기시간이 짧은 준생존기도 함께 보여줍니다.", nil, function() return not IRF3.db.units.useSurvivalSkill end, true,
		function()
			return IRF3.db.units.showSurvivalSkillSub
		end,
		function(v)
			IRF3.db.units.showSurvivalSkillSub = v
			LBO:Refresh(parent)
			Option:UpdateMember(update)
		end
	)
	menu.sub:SetPoint("TOP", menu.use, "BOTTOM", 0, 5)
	menu.potion = LBO:CreateWidget("CheckBox", parent, "물약 보기", "물약 섭취 여부를 보여줍니다.", nil, function() return not IRF3.db.units.useSurvivalSkill end, true,
		function()
			return IRF3.db.units.showSurvivalSkillPotion
		end,
		function(v)
			IRF3.db.units.showSurvivalSkillPotion = v
			LBO:Refresh(parent)
			Option:UpdateMember(update)
		end
	)
	menu.potion:SetPoint("TOP", menu.timer, "BOTTOM", 0, 5)
end

function Option:CreateHealPredictionMenu(menu, parent)
	local function update(member)
		member.myHealPredictionBar:SetStatusBarColor(IRF3.db.units.myHealPredictionColor[1], IRF3.db.units.myHealPredictionColor[2], IRF3.db.units.myHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
		member.otherHealPredictionBar:SetStatusBarColor(IRF3.db.units.otherHealPredictionColor[1], IRF3.db.units.otherHealPredictionColor[2], IRF3.db.units.otherHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
		member.absorbPredictionBar:SetStatusBarColor(IRF3.db.units.AbsorbPredictionColor[1], IRF3.db.units.AbsorbPredictionColor[2], IRF3.db.units.AbsorbPredictionColor[3], IRF3.db.units.healPredictionAlpha)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateHealPrediction(member)
		end
		if member.petButton then
			update(member.petButton)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "들어오는 치유/흡수 기능의 사용 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.displayHealPrediction
		end,
		function(v)
			IRF3.db.units.displayHealPrediction = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -5)
	local function disable()
		return not IRF3.db.units.displayHealPrediction
	end
	menu.alpha = LBO:CreateWidget("Slider", parent, "들어오는 치유/흡수바 투명도", "플레이어에게 들어오는 치유량을 표시하는 바의 투명도를 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.healPredictionAlpha * 100, 0, 100, 1, "%" end,
		function(v)
			IRF3.db.units.healPredictionAlpha = v / 100
			Option:UpdateMember(update)
		end
	)
	menu.alpha:SetPoint("TOPRIGHT", -5, -5)
	menu.myIcon = LBO:CreateWidget("CheckBox", parent, "내 치유 아이콘 표시", "내가 시전한 치유바와는 별도로 치유 받는 플레이어에게 네모 모양의 치유 아이콘을 표시합니다.", nil, disable, true,
		function() return IRF3.db.units.healIcon end,
		function(v)
			IRF3.db.units.healIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.myIcon:SetPoint("TOP", menu.use, "BOTTOM", 0, 0)
	menu.otherIcon = LBO:CreateWidget("CheckBox", parent, "타인 치유 아이콘 표시", "타인이 시전한 치유바와는 별도로 치유 받는 플레이어에게 네모 모양의 치유 아이콘을 표시합니다.", nil, disable, true,
		function() return IRF3.db.units.healIconOther end,
		function(v)
			IRF3.db.units.healIconOther = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.otherIcon:SetPoint("TOP", menu.alpha, "BOTTOM", 0, 0)
	local function disable2()
		if disable() then
			return true
		else
			return not(IRF3.db.units.healIcon or IRF3.db.units.healIconOther)
		end
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "치유/흡수 아이콘 위치", "치유/흡수 아이콘의 위치를 설정합니다.", nil, disable2, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.healIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.healIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOP", menu.myIcon, "BOTTOM", 0, 0)
	menu.size = LBO:CreateWidget("Slider", parent, "치유/흡수 아이콘 크기", "치유/흡수 아이콘의 크기를 설정합니다.", nil, disable2, true,
		function()
			return IRF3.db.units.healIconSize, 8, 20, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.healIconSize = v
			Option:UpdateMember(update)
		end
	)
	menu.size:SetPoint("TOP", menu.otherIcon, "BOTTOM", 0, 0)
	menu.myColor = LBO:CreateWidget("ColorPicker", parent, "내가 시전한 치유 색상", "내가 시전한 치유바 혹은 아이콘의 색상을 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.myHealPredictionColor[1], IRF3.db.units.myHealPredictionColor[2], IRF3.db.units.myHealPredictionColor[3] end,
		function(r, g, b)
			IRF3.db.units.myHealPredictionColor[1], IRF3.db.units.myHealPredictionColor[2], IRF3.db.units.myHealPredictionColor[3] = r, g, b
			Option:UpdateMember(update)
		end
	)
	menu.myColor:SetPoint("TOP", menu.pos, "BOTTOM", 0, 0)
	menu.otherColor = LBO:CreateWidget("ColorPicker", parent, "타인이 시전한 치유 색상", "다른 사람이 시전한 치유바 혹은 아이콘의 색상을 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.otherHealPredictionColor[1], IRF3.db.units.otherHealPredictionColor[2], IRF3.db.units.otherHealPredictionColor[3] end,
		function(r, g, b)
			IRF3.db.units.otherHealPredictionColor[1], IRF3.db.units.otherHealPredictionColor[2], IRF3.db.units.otherHealPredictionColor[3] = r, g, b
			Option:UpdateMember(update)
		end
	)
	menu.otherColor:SetPoint("TOP", menu.size, "BOTTOM", 0, 0)
	menu.AbsorbColor = LBO:CreateWidget("ColorPicker", parent, "예상 흡수량 바 색상", "예상 흡수량 바의 색상을 설정합니다.", nil, disable, true,
		function() return IRF3.db.units.AbsorbPredictionColor[1], IRF3.db.units.AbsorbPredictionColor[2], IRF3.db.units.AbsorbPredictionColor[3] end,
		function(r, g, b)
			IRF3.db.units.AbsorbPredictionColor[1], IRF3.db.units.AbsorbPredictionColor[2], IRF3.db.units.AbsorbPredictionColor[3] = r, g, b
			Option:UpdateMember(update)
		end
	)
	menu.AbsorbColor:SetPoint("TOP", menu.myColor, "BOTTOM", 0, 0)
end

function Option:CreateIgnoreAuraMenu(menu, parent)
	local debuffs = {}
	menu.list = LBO:CreateWidget("List", parent, "무시할 오라 목록", nil, nil, nil, true,
		function()
			wipe(debuffs)
			for debuff in pairs(IRF3.ignoreAura) do
				if IRF3.db.ignoreAura[debuff] ~= false then
					local text = ("%s(%d)"):format(GetSpellInfo(debuff) or "", debuff)
					tinsert(debuffs, text)
				end
			end
			for debuff, v in pairs(IRF3.db.ignoreAura) do
				if v == true then
					if IRF3.ignoreAura[debuff] then
						IRF3.db.ignoreAura[debuff] = nil
					else
						local text
						if type(debuff) == "number" then
							text = ("%s(%d)"):format(GetSpellInfo(debuff) or "", debuff)
						else
							text = debuff
						end
						tinsert(debuffs, text)
					end
				end
			end
			sort(debuffs)
			return debuffs, true
		end,
		function(v)
			menu.delete:Update()
		end
	)
	menu.list:SetPoint("TOPLEFT", 5, -5)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateAura(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Pet_UpdateDebuffs(member.petButton)
			end
		end
	end
	menu.delete = LBO:CreateWidget("Button", parent, "삭제", "선택된 오라를 목록에서 삭제합니다.", nil,
		function()
			if menu.list:GetValue() then
				menu.delete.title:SetFormattedText("\"%s\" 삭제", debuffs[menu.list:GetValue()])
				return nil
			else
				menu.delete.title:SetText("삭제")
				return true
			end
		end, nil,
		function()
			local name = debuffs[menu.list:GetValue()]
			IRF3:Message(("\"%s\"|1이;가; 무시할 오라 목록에서 삭제되었습니다."):format(name))
			for spellId in string.gmatch(name, "%d+") do
				name = tonumber(spellId)
			end
			if IRF3.ignoreAura[name] then
				IRF3.db.ignoreAura[name] = false
			elseif IRF3.db.ignoreAura[debuffs[menu.list:GetValue()]] then
				IRF3.db.ignoreAura[debuffs[menu.list:GetValue()]] = false
			else
				IRF3.db.ignoreAura[name] = nil
			end
			menu.list:Setup()
			menu.reset:Update()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
		end
	)
	menu.delete:SetPoint("TOPLEFT", menu.list, "BOTTOMLEFT", 0, 12)
	menu.delete:SetPoint("TOPRIGHT", menu.list, "BOTTOMRIGHT", 0, 12)
	menu.editbox = LBO:CreateEditBox(parent, nil, "ChatFontNormal", nil, true)
	menu.editbox:SetPoint("TOPLEFT", menu.delete, "BOTTOMLEFT", 2, 6)
	menu.editbox:SetPoint("TOPRIGHT", menu.delete, "BOTTOMRIGHT", -60, 6)
	menu.editbox:SetScript("OnTextChanged", function() menu.add:Update() if menu.editbox:GetText() ~= "" then menu.add.txt = menu.editbox:GetText() end end)
	menu.editbox:SetScript("OnEscapePressed", function(self)
		self:SetText("")
		self:ClearFocus()
	end)
	local function add()
		local text = (menu.add.txt or ""):trim()	--local text = (menu.editbox:GetText() or ""):trim()
		local spell
		if tonumber(text) then
			spell = tonumber(text)
			text = GetSpellInfo(text) or nil
		else
			spell = text
		end
		menu.editbox:SetText("")
		menu.editbox:ClearFocus()
		if not text then
			IRF3:Message(("%d 주문은 존재하지 않는 주문 ID 입니다."):format(spell))
		elseif IRF3.db.ignoreAura[spell] or IRF3.db.ignoreAura[text] or (IRF3.ignoreAura[spell] and IRF3.db.ignoreAura[spell] ~= false) or (IRF3.ignoreAura[text] and IRF3.db.ignoreAura[text] ~= false) then
			IRF3:Message(("\"%s\"|1은;는; 이미 무시할 오라 목록에 있습니다."):format(text))
		else
			IRF3:Message(("\"%s\"|1이;가; 무시할 오라 목록에 추가되었습니다."):format(text))
			if IRF3.ignoreAura[spell] then
				IRF3.db.ignoreAura[spell] = nil
			else
				IRF3.db.ignoreAura[spell] = true
			end
			menu.list:Setup()
			menu.reset:Update()
			menu.delete:Update()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
		end
	end
	menu.editbox:SetScript("OnEnterPressed", function(self)
		if (self:GetText() or ""):trim() ~= "" then
			add()
		else
			self:SetText("")
			self:ClearFocus()
		end
	end)
	menu.add = LBO:CreateWidget("Button", parent, "추가", "오라를 목록에 추가합니다.", nil, false, true, add)	-- function() return (menu.editbox:GetText() or ""):trim() == "" end
	menu.add:SetPoint("TOPLEFT", menu.editbox, "TOPRIGHT", 2, 14)
	menu.add:SetPoint("RIGHT", menu.delete, "RIGHT", 0, 0)
	menu.reset = LBO:CreateWidget("Button", parent, "초기값 복원", "무시할 오라 목록을 초기값으로 복원합니다.", nil, function() return not next(IRF3.db.ignoreAura) end, true,
		function()
			menu.editbox:SetText("")
			menu.editbox:ClearFocus()
			wipe(IRF3.db.ignoreAura)
			menu.list:Setup()
			menu.reset:Update()
			menu.delete:Update()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
			IRF3:Message("무시할 오라 목록이 초기값으로 복원되었습니다.")
		end
	)
	menu.reset:SetPoint("TOP", menu.add, "BOTTOM", 0, 18)
	menu.reset:SetPoint("LEFT", menu.delete, "LEFT", 0, 0)
	menu.reset:SetPoint("RIGHT", menu.delete, "RIGHT", 0, 0)
end

function Option:CreateDebuffIconMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateAura(member)
		end
	end
	menu.num = LBO:CreateWidget("Slider", parent, "표시될 디버프 수", "플레이어 프레임에 표시될 디버프 수를 설정합니다. 0으로 설정하면 표시하지 않습니다.", nil, disable, true,
		function()
			return IRF3.db.units.debuffIcon, 0, 5, 1, "개"
		end,
		function(v)
			IRF3.db.units.debuffIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.num:SetPoint("TOPLEFT", 5, -5)
	local function disable()
		return IRF3.db.units.debuffIcon == 0
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "디버프 아이콘이 플레이어 프레임에 위치할 곳을 설정합니다.", nil, disable, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.debuffIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.debuffIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOPRIGHT", -5, -5)
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "디버프 아이콘의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.debuffIconSize, 4, 20, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.debuffIconSize = v
			Option:UpdateMember(update)
		end
	)
	menu.size:SetPoint("TOP", menu.num, "BOTTOM", 0, -10)
	local typeList = { "아이콘 + 색상", "아이콘", "색상" }
	menu.type = LBO:CreateWidget("DropDown", parent, "표시 형식", "디버프 아이콘의 표시 형식을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.debuffIconType, typeList
		end,
		function(v)
			IRF3.db.units.debuffIconType = v
			Option:UpdateMember(IRF3.headers[0].members[1].SetupDebuffIcon)
		end
	)
	menu.type:SetPoint("TOP", menu.pos, "BOTTOM", 0, -10)
	local function getDebuff(debuff)
		return IRF3.db.units.debuffIconFilter[debuff]
	end
	local function setDebuff(v, debuff)
		IRF3.db.units.debuffIconFilter[debuff] = v
		Option:UpdateMember(update)
	end
	local colorList = { "Magic", "Curse", "Disease", "Poison", "none" }
	local colorLocale = { "마법", "저주", "질병", "독", "무속성" }
	for i, color in ipairs(colorList) do
		menu["color"..i] = LBO:CreateWidget("CheckBox", parent, colorLocale[i].." 보기", colorLocale[i].." 계열의 디버프를 표시합니다.", nil, disable, true, getDebuff, setDebuff, color)
		if i == 1 then
			menu["color"..i]:SetPoint("TOP", menu.size, "BOTTOM", 0, 0)
		elseif i == 2 then
			menu["color"..i]:SetPoint("TOP", menu.color1, 0, 0)
			menu["color"..i]:SetPoint("RIGHT", -5, 0)
		else
			menu["color"..i]:SetPoint("TOP", menu["color"..(i - 2)], "BOTTOM", 0, 14)
		end
	end
	
	menu.onlyDispel = LBO:CreateWidget("CheckBox", parent, "해제 가능한 약화 효과만 보기", "해제 가능한 약화 효과만 보기", nil, nil, true,
		function() return IRF3.db.units.onlyDispel end,
		function(v)
			IRF3.db.units.onlyDispel = v
		end
	)
	menu.onlyDispel:SetPoint("TOP", menu.size, "BOTTOM", 0, -90)
	
	menu.showDispelTimer = LBO:CreateWidget("CheckBox", parent, "남은 시간 표시", "아이콘에 지속 시간을 표시 합니다.", nil, nil, true,
		function() return IRF3.db.units.showDispelTimer end,
		function(v)
			IRF3.db.units.showDispelTimer = v
		end
	)
	menu.showDispelTimer:SetPoint("TOP", menu.onlyDispel, "BOTTOM", 0, 0)
end

function Option:CreateDebuffHealthMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateState(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Member_UpdateState(member.petButton)
			end
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "체력바 색상을 변경하기", "해제 가능한 디버프에 걸린 플레이어의 체력바 색상을 변경합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useDispelColor
		end,
		function(v)
			IRF3.db.units.useDispelColor = v
			Option:UpdateMember(update)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -5)
	menu.sound = LBO:CreateWidget("Media", parent, "소리 재생", "해제 가능한 디버프에 걸린 플레이어가 있으면 소리를 재생합니다. None으로 설정하시면 소리 재생 기능을 사용하지 않습니다.", nil, nil, true,
		function()
			return IRF3.db.units.dispelSound, "sound"
		end,
		function(v)
			IRF3.db.units.dispelSound = v
		end
	)
	menu.sound:SetPoint("TOPRIGHT", -5, -5)
end

function Option:CreateBossAuraMenu(menu, parent)
	local debuffs = {}
	menu.list = LBO:CreateWidget("List", parent, "중요 오라 목록", nil, nil, nil, true,
		function()
			wipe(debuffs)
			for debuff in pairs(IRF3.bossAura) do
				if IRF3.db.userAura[debuff] ~= false then
					local text = ("%s(%d)"):format(GetSpellInfo(debuff) or "", debuff)
					tinsert(debuffs, text)
				end
			end
			for debuff, v in pairs(IRF3.db.userAura) do
				if v == true then
					if IRF3.bossAura[debuff] then
						IRF3.db.userAura[debuff] = nil
					else
						local text
						if type(debuff) == "number" then
							text = ("%s(%d)"):format(GetSpellInfo(debuff) or "", debuff)
						else
							text = debuff
						end
						if type(text) == "string" then
							tinsert(debuffs, text)
						end
					end
				end
			end
			sort(debuffs)
			return debuffs, true
		end,
		function(v)
			menu.delete:Update()
		end
	)
	menu.list:SetPoint("TOPLEFT", 5, -5)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_SetAuraFont(member)
			InvenRaidFrames3Member_UpdateAura(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Member_UpdateAura(member.petButton)
			end
		end
	end
	menu.delete = LBO:CreateWidget("Button", parent, "삭제", "선택된 오라를 목록에서 삭제합니다.", nil,
		function()
			if menu.list:GetValue() then
				menu.delete.title:SetFormattedText("\"%s\" 삭제", debuffs[menu.list:GetValue()])
				return nil
			else
				menu.delete.title:SetText("삭제")
				return true
			end
		end, nil,
		function()
			local name = debuffs[menu.list:GetValue()]
			IRF3:Message(("\"%s\"|1이;가; 중요 오라 목록에서 삭제되었습니다."):format(name))
			for spellId in string.gmatch(name, "%d+") do
				name = tonumber(spellId)
			end
			if IRF3.db.userAura[name] then
				IRF3.db.userAura[name] = false
			elseif IRF3.db.userAura[debuffs[menu.list:GetValue()]] then
				IRF3.db.userAura[debuffs[menu.list:GetValue()]] = false
			end
			menu.reset:Update()
			menu.list:Setup()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
		end
	)
	menu.delete:SetPoint("TOPLEFT", menu.list, "BOTTOMLEFT", 0, 12)
	menu.delete:SetPoint("TOPRIGHT", menu.list, "BOTTOMRIGHT", 0, 12)
	menu.editbox = LBO:CreateEditBox(parent, nil, "ChatFontNormal", nil, true)
	menu.editbox:SetPoint("TOPLEFT", menu.delete, "BOTTOMLEFT", 2, 6)
	menu.editbox:SetPoint("TOPRIGHT", menu.delete, "BOTTOMRIGHT", -60, 6)
	menu.editbox:SetScript("OnTextChanged", function() menu.add:Update() if menu.editbox:GetText() ~= "" then menu.add.txt = menu.editbox:GetText() end end)
	menu.editbox:SetScript("OnEscapePressed", function(self)
		self:SetText("")
		self:ClearFocus()
	end)
	local function add()
		local text = (menu.add.txt or ""):trim()	--local text = (menu.editbox:GetText() or ""):trim()
		local spell
		if tonumber(text) then
			spell = tonumber(text)
			text = GetSpellInfo(text) or nil
		else
			spell = text
		end
		menu.editbox:SetText("")
		menu.editbox:ClearFocus()
		if not text then
			IRF3:Message(("%d 주문은 존재하지 않는 주문 ID 입니다."):format(spell))
		elseif IRF3.db.userAura[spell] or IRF3.db.userAura[spell] or (IRF3.bossAura[spell] and IRF3.db.userAura[spell] ~= false) or (IRF3.bossAura[text] and IRF3.db.userAura[text] ~= false) then
			IRF3:Message(("\"%s\"|1은;는; 이미 중요 오라 목록에 있습니다."):format(text))
		else
			IRF3:Message(("\"%s\"|1이;가; 중요 오라 목록에 추가되었습니다."):format(text))
			if IRF3.bossAura[spell] then
				IRF3.db.userAura[spell] = nil
			else
				IRF3.db.userAura[spell] = true
			end
			menu.list:Setup()
			menu.reset:Update()
			menu.delete:Update()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
		end
	end
	menu.editbox:SetScript("OnEnterPressed", function(self)
		if (self:GetText() or ""):trim() ~= "" then
			add()
		else
			self:SetText("")
			self:ClearFocus()
		end
	end)
	menu.add = LBO:CreateWidget("Button", parent, "추가", "오라를 목록에 추가합니다.", nil, false, true, add)	-- function() return (menu.editbox:GetText() or ""):trim() == "" end
	menu.add:SetPoint("TOPLEFT", menu.editbox, "TOPRIGHT", 2, 14)
	menu.add:SetPoint("RIGHT", menu.delete, "RIGHT", 0, 0)
	menu.reset = LBO:CreateWidget("Button", parent, "초기값 복원", "중요 오라 목록을 초기값으로 복원합니다.", nil, function() return not next(IRF3.db.userAura) end, true,
		function()
			menu.editbox:SetText("")
			menu.editbox:ClearFocus()
			wipe(IRF3.db.userAura)
			menu.list:Setup()
			menu.reset:Update()
			menu.delete:Update()
			IRF3:BuildAuraList()
			Option:UpdateMember(update)
			IRF3:Message("중요 오라 목록이 초기값으로 복원되었습니다.")
		end
	)
	menu.reset:SetPoint("TOP", menu.add, "BOTTOM", 0, 18)
	menu.reset:SetPoint("LEFT", menu.delete, "LEFT", 0, 0)
	menu.reset:SetPoint("RIGHT", menu.delete, "RIGHT", -90, 0)
	menu.use = LBO:CreateWidget("CheckBox", parent, "중요 오라 사용하기", "중요 오라 아이콘 표시 기능을 사용합니다.", nil, nil, true,
		function() return IRF3.db.units.useBossAura end,
		function(v)
			IRF3.db.units.useBossAura = v
			Option:UpdateMember(update)
			menu.pos:Update()
			menu.size:Update()
			menu.alpha:Update()
			menu.timer:Update()
		end
	)
	menu.use:SetPoint("TOPRIGHT", -5, -5)
	local function disable()
		return not IRF3.db.units.useBossAura
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "중요 오라 아이콘을 표시할 위치를 설정합니다.", nil, disable, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.bossAuraPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.bossAuraPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 0)
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "중요 오라 아이콘의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.bossAuraSize, 8, 60, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.bossAuraSize = v
			Option:UpdateMember(update)
		end
	)
	menu.size:SetPoint("TOP", menu.pos, "BOTTOM", 0, -10)
	local function updateAlpha(member)
		member.bossAura:SetAlpha(IRF3.db.units.bossAuraAlpha)
	end
	menu.alpha = LBO:CreateWidget("Slider", parent, "투명도", "중요 오라 아이콘의 투명도를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.bossAuraAlpha * 100, 0, 100, 1, "%"
		end,
		function(v)
			IRF3.db.units.bossAuraAlpha = v / 100
			Option:UpdateMember(updateAlpha)
		end
	)
	menu.alpha:SetPoint("TOP", menu.size, "BOTTOM", 0, -10)
	menu.timer = LBO:CreateWidget("CheckBox", parent, "시계 텍스쳐 표시", "중요 오라의 남은 시간을 시계 형식으로 표시합니다.", nil, disable, true,
		function()
			return IRF3.db.units.bossAuraTimer
		end,
		function(v)
			IRF3.db.units.bossAuraTimer = v
			Option:UpdateMember(update)
		end
	)
	menu.timer:SetPoint("TOP", menu.alpha, "BOTTOM", 0, -10)
	local timerTypes = { "시간 표시 안함", "남은 시간", "경과 시간" }
	menu.timerType = LBO:CreateWidget("DropDown", parent, "시간 표시 방식", "중요 오라의 시간 표시 방식을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.bossAuraOpt + 1, timerTypes
		end,
		function(v)
			IRF3.db.units.bossAuraOpt = v - 1
			Option:UpdateIconPos()
			Option:UpdateMember(update)
		end
	)
	menu.timerType:SetPoint("TOP", menu.timer, "BOTTOM", 0, 0)
end

function Option:CreateEnemyMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateState(member)
			if member.petButton and member.petButton:IsVisible() then
				InvenRaidFrames3Member_UpdateState(member.petButton)
			end
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "정신 지배 등으로 적대적이된 플레이어의 체력바 색상을 변경하는 기능의 사용 여부를 설정합니다.", nil, nil, true,
		function() return IRF3.db.units.useHarm end,
		function(v)
			IRF3.db.units.useHarm = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 5)
	menu.color = LBO:CreateWidget("ColorPicker", parent, "색상", "적대적이된 플레이어의 체력바 색상을 설정합니다.", nil, function() return not IRF3.db.units.useHarm end, true,
		function()
			return IRF3.db.colors.harm[1], IRF3.db.colors.harm[2], IRF3.db.colors.harm[3]
		end,
		function(r, g, b)
			IRF3.db.colors.harm[1], IRF3.db.colors.harm[2], IRF3.db.colors.harm[3] = r, g, b
			Option:UpdateMember(update)
		end
	)
	menu.color:SetPoint("TOPRIGHT", -5, 5)
end

function Option:CreateRaidTargetMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateRaidIcon(member)
			InvenRaidFrames3Member_UpdateRaidIconTarget(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "전술 목표 아이콘을 플레이어 프레임에 표시합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useRaidIcon
		end,
		function(v)
			IRF3.db.units.useRaidIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 5)
	local function disable()
		return not IRF3.db.units.useRaidIcon
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "전술 목표 아이콘의 위치를 설정합니다.", nil, disable, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.raidIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.raidIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 10)
	menu.scale = LBO:CreateWidget("Slider", parent, "전술 목표 아이콘 크기", "전술 목표 아이콘의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.raidIconSize, 8, 24, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.raidIconSize = v
			Option:UpdateMember(update)
		end
	)
	menu.scale:SetPoint("TOP", menu.pos, "TOP", 0, 0)
	menu.scale:SetPoint("RIGHT", -5, 0)
	menu.target = LBO:CreateWidget("CheckBox", parent, "대상이 선택한 대상의 전술 목표 아이콘 보기", "플레이어가 선택한 대상의 전술 목표 아이콘을 표시합니다.", nil, disable, true,
		function()
			return IRF3.db.units.raidIconTarget
		end,
		function(v)
			IRF3.db.units.raidIconTarget = v
			Option:UpdateMember(update)
		end
	)
	menu.target:SetPoint("TOP", menu.pos, "BOTTOM", 0, -5)
	local function get(id)
		return IRF3.db.units.raidIconFilter[id]
	end
	local function set(v, id)
		IRF3.db.units.raidIconFilter[id] = v
		Option:UpdateMember(update)
	end
	for i, icon in ipairs(self.dropdownTable["징표"]) do
		menu["icon"..i] = LBO:CreateWidget("CheckBox", parent, icon.." 보기", icon.."를 레이드 프레임에 표시합니다.", nil, disable, true, get, set, i)
		if i == 1 then
			menu.icon1:SetPoint("TOP", menu.target, "BOTTOM", 0, 0)
		elseif i == 2 then
			menu.icon2:SetPoint("TOP", menu.icon1, "TOP", 0, 0)
			menu.icon2:SetPoint("RIGHT", -5, 0)
		else
			menu["icon"..i]:SetPoint("TOP", menu["icon"..(i - 2)], "BOTTOM", 0, 15)
		end
	end
end

function Option:CreateCastingBarMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateCastingBar(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "시전바 보기 기능의 사용 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useCastingBar
		end,
		function(v)
			IRF3.db.units.useCastingBar = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 5)
	local disable = function() return not IRF3.db.units.useCastingBar end
	local function updateColor(member)
		member.castingBar:SetStatusBarColor(IRF3.db.units.castingBarColor[1], IRF3.db.units.castingBarColor[2], IRF3.db.units.castingBarColor[3])
	end
	menu.color = LBO:CreateWidget("ColorPicker", parent, "색상", "시전바의 색상을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.castingBarColor[1], IRF3.db.units.castingBarColor[2], IRF3.db.units.castingBarColor[3]
		end,
		function(r, g, b)
			IRF3.db.units.castingBarColor[1], IRF3.db.units.castingBarColor[2], IRF3.db.units.castingBarColor[3] = r, g, b
			Option:UpdateMember(updateColor)
		end
	)
	menu.color:SetPoint("TOPRIGHT", -5, 5)
	local posList = { "상단", "하단", "좌측", "우측" }
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "시전바가 플레이어 프레임에 위치할 곳을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.castingBarPos, posList
		end,
		function(v)
			IRF3.db.units.castingBarPos = v
			Option:UpdateMember(InvenRaidFrames3Member_SetupCastingBarPos)
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 0)
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "시전바의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.castingBarHeight, 1, 5, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.castingBarHeight = v
			Option:UpdateMember(InvenRaidFrames3Member_SetupCastingBarPos)
		end
	)
	menu.size:SetPoint("TOP", menu.color, "BOTTOM", 0, 0)
end

function Option:CreatePowerBarAltMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdatePowerBarAlt(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "상황 표시바 보기 기능의 사용 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.usePowerBarAlt
		end,
		function(v)
			IRF3.db.units.usePowerBarAlt = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 5)
	local disable = function() return not IRF3.db.units.usePowerBarAlt end
	local posList = { "상단", "하단", "좌측", "우측" }
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "상황 표시바가 플레이어 프레임에 위치할 곳을 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.powerBarAltPos, posList
		end,
		function(v)
			IRF3.db.units.powerBarAltPos = v
			Option:UpdateMember(InvenRaidFrames3Member_SetupPowerBarAltPos)
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 0)
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "상황 표시바의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.powerBarAltHeight, 1, 5, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.powerBarAltHeight = v
			Option:UpdateMember(InvenRaidFrames3Member_SetupPowerBarAltPos)
		end
	)
	menu.size:SetPoint("TOP", menu.pos, "TOP", 0, 0)
	menu.size:SetPoint("RIGHT", -5, 0)
end

function Option:CreateResurrectionMenu(menu, parent)
	local function update(member)
		if member:IsVisible() and (member.isDead or member.isGhost) then
			InvenRaidFrames3Member_UpdateResurrection(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "플레이어에게 시전되는 부활 시전바 보기 기능 사용 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.useResurrectionBar
		end,
		function(v)
			IRF3.db.units.useResurrectionBar = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, 5)
	local function updateColor(member)
		member.resurrectionBar:SetStatusBarColor(IRF3.db.units.resurrectionBarColor[1], IRF3.db.units.resurrectionBarColor[2], IRF3.db.units.resurrectionBarColor[3])
	end
	menu.color = LBO:CreateWidget("ColorPicker", parent, "색상", "부활 시전바 색상을 설정합니다.", nil, function() return not IRF3.db.units.useResurrectionBar end, true,
		function()
			return IRF3.db.units.resurrectionBarColor[1], IRF3.db.units.resurrectionBarColor[2], IRF3.db.units.resurrectionBarColor[3]
		end,
		function(r, g, b)
			IRF3.db.units.resurrectionBarColor[1], IRF3.db.units.resurrectionBarColor[2], IRF3.db.units.resurrectionBarColor[3] = r, g, b
			Option:UpdateMember(updateColor)
		end
	)
	menu.color:SetPoint("TOPRIGHT", -5, 5)
end

function Option:CreateRaidRoleMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateRoleIcon(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "역할(탱커, 딜러, 힐러) 아이콘의 표시 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.displayRaidRoleIcon
		end,
		function(v)
			IRF3.db.units.displayRaidRoleIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -10)
	local function disable()
		return not IRF3.db.units.displayRaidRoleIcon
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "역할 아이콘을 표시할 위치를 설정합니다.", nil, disable, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.roleIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.roleIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 5)
	local function updateSize(member)
		if member:IsVisible() and member.roleIcon:IsVisible() then
			member.roleIcon:SetSize(IRF3.db.units.roleIconSize, IRF3.db.units.roleIconSize)
		end
	end
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "역할 아이콘의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.roleIconSize, 8, 20, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.roleIconSize = v
			Option:UpdateMember(updateSize)
		end
	)
	menu.size:SetPoint("TOP", menu.pos, "TOP", 0, 0)
	menu.size:SetPoint("RIGHT", 0, -5)

	local pack = { "블리자드 기본", "MiirGui"}
	menu.pack = LBO:CreateWidget("DropDown", parent, "모양", "역할 아이콘의 모양을 변경합니다.", nil, disable, true,
		function()
			return IRF3.db.units.roleIcontype + 1, pack
		end,
		function(v)
			IRF3.db.units.roleIcontype = v - 1
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.pack:SetPoint("TOP", menu.pos, "BOTTOM", 0, 5)
	
	menu.hideDamagerIcon = LBO:CreateWidget("CheckBox", parent, "딜러 아이콘만 감추기", "탱, 힐 아이콘만 표시합니다.", nil, nil, true,
		function()
			return IRF3.db.units.hideDamagerIcon
		end,
		function(v)
			IRF3.db.units.hideDamagerIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.hideDamagerIcon:SetPoint("TOP", menu.pack, "BOTTOM", 0, 5)
end

function Option:CreateCenterStatusIconMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateCenterStatusIcon(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "중앙 상태 아이콘의 표시 여부를 설정합니다.", nil, nil, true,
		function()
			return IRF3.db.units.centerStatusIcon
		end,
		function(v)
			IRF3.db.units.centerStatusIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -10)
end

function Option:CreateRaidCheckMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateRaidCheck(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "전투 준비 시 도핑 여부를 알립니다.", nil, nil, true,
		function()
			return IRF3.db.units.RaidCheck
		end,
		function(v)
			IRF3.db.units.RaidCheck = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -10)

	local disable = function() return not IRF3.db.units.RaidCheck end
if not IRF3.isClassic then	
	menu.alpha = LBO:CreateWidget("Slider", parent, "음식 도핑 기준", "음식 도핑 여부를 체크하는 수치 기준입니다. 하급 음식: 18, 상급 음식: 20, 30", nil, disable, true,
		function() return IRF3.db.units.foodFlags, 18, 30, 1, "" end,
		function(v)
			IRF3.db.units.foodFlags = v
			Option:UpdateMember(update)
		end
	)
else
	menu.alpha = LBO:CreateWidget("Slider", parent, "음식 도핑 기준", "음식 도핑 여부를 체크하는 수치 기준입니다. 하급 음식: 225, 상급 음식: 300, 375", nil, disable, true,
		function() return IRF3.db.units.foodFlags, 225, 375, 1, "" end,
		function(v)
			IRF3.db.units.foodFlags = v
			Option:UpdateMember(update)
		end
	)
end
	menu.alpha:SetPoint("TOPRIGHT", -5, -5)

	menu.beta = LBO:CreateWidget("CheckBox", parent, "증강의 룬 도핑 검사", "증강의 룬 도핑 검사를 합니다.", nil, disable, true,
		function()
			return IRF3.db.units.showRunes
		end,
		function(v)
			IRF3.db.units.showRunes = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.beta:SetPoint("TOP", menu.use, "BOTTOM", 0, 0)


	menu.de = LBO:CreateWidget("CheckBox", parent, "채팅창에 도핑 결과 알리기", "채팅창 (공대창 또는 파티창)에 도핑 결과를 알려줍니다.", nil, disable, true,
		function()
			return IRF3.db.units.RaidCheckAnn
		end,
		function(v)
			IRF3.db.units.RaidCheckAnn = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.de:SetPoint("TOP", menu.alpha, "BOTTOM", 0, 0)
end


function Option:CreateLeaderIconMenu(menu, parent)
	local function update(member)
		if member:IsVisible() then
			InvenRaidFrames3Member_UpdateLeaderIcon(member)
		end
	end
	menu.use = LBO:CreateWidget("CheckBox", parent, "사용하기", "파티장/공격대장 아이콘을 표시합니다..", nil, nil, true,
		function()
			return IRF3.db.units.useLeaderIcon
		end,
		function(v)
			IRF3.db.units.useLeaderIcon = v
			Option:UpdateMember(update)
			LBO:Refresh(parent)
		end
	)
	menu.use:SetPoint("TOPLEFT", 5, -10)
	local function disable()
		return not IRF3.db.units.useLeaderIcon
	end
	menu.pos = LBO:CreateWidget("DropDown", parent, "위치", "파티장/공격대장 아이콘을 표시할 위치를 설정합니다.", nil, disable, true,
		function()
			return Option.dropdownTable["아이콘변환"][IRF3.db.units.leaderIconPos], Option.dropdownTable["아이콘"]
		end,
		function(v)
			IRF3.db.units.leaderIconPos = Option.dropdownTable["아이콘변환"][v]
			Option:UpdateIconPos()
		end
	)
	menu.pos:SetPoint("TOP", menu.use, "BOTTOM", 0, 5)
	local function updateSize(member)
		if member:IsVisible() and member.leaderIcon:IsVisible() then
			member.leaderIcon:SetSize(IRF3.db.units.leaderIconSize, IRF3.db.units.leaderIconSize)
		end
	end
	menu.size = LBO:CreateWidget("Slider", parent, "크기", "파티장/공격대장 아이콘의 크기를 설정합니다.", nil, disable, true,
		function()
			return IRF3.db.units.leaderIconSize, 8, 20, 1, "픽셀"
		end,
		function(v)
			IRF3.db.units.leaderIconSize = v
			Option:UpdateMember(updateSize)
		end
	)
	menu.size:SetPoint("TOP", menu.pos, "TOP", 0, 0)
	menu.size:SetPoint("RIGHT", 0, -5)
end