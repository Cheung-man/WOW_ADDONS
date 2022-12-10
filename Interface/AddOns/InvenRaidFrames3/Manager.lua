--[[
인벤 레이드 프레임 공격대 관리자 스크립트
]]

local _G = _G
local IRF3 = _G[...]
local texturePath = "Interface\\AddOns\\"..(...).."\\Texture\\"
local onPetBattle = false
local GetTexCoordsForRoleSmallCircle = _G.GetTexCoordsForRoleSmallCircle
if not GetTexCoordsForRoleSmallCircle then
	GetTexCoordsForRoleSmallCircle = _G.GetTexCoordsForRole
end

local inCombat
if not CompactRaidFrameManager then
	local IRF3errframe = CreateFrame("Frame",nil,UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
	IRF3errframe:SetFrameStrata("MEDIUM")
	IRF3errframe:SetWidth(250) -- Set these to whatever height/width is needed
	IRF3errframe:SetHeight(200) -- for your Texture
	IRF3errframe:SetBackdrop(BACKDROP_TESTWATERMARK_16_16_2222)
	IRF3errframe:SetMovable(true)
	IRF3errframe:EnableMouse(true)
	IRF3errframe:SetClampedToScreen(true)


	IRF3errframe:SetPoint("CENTER",0,0)
	IRF3errframe:Show()

	IRF3errframe:RegisterForDrag('LeftButton')
	IRF3errframe:SetScript("OnDragStart",function(self)
		self:StartMoving()
	end)
	IRF3errframe:SetScript("OnDragStop",function(self)
		self:StopMovingOrSizing()
	end)

	IRF3errframe.title = IRF3errframe:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	IRF3errframe.title:SetText('IRF3 오류: 블리자드 기본 공격대 애드온이 꺼져있으면 인벤 레이드 프레임을 사용 할 수 없습니다.\r\rBlizzard_CompactRaidFrames\rBlizzard_CUFProfiles\r\r강제로 활성화 하였습니다.\rUI Reload 를 눌러주세요.')
	IRF3errframe.title:SetPoint("TOPLEFT", 8, -12)
	IRF3errframe.title:SetJustifyH("LEFT")
	IRF3errframe.title:SetWidth(240)


	IRF3errframe.reload = CreateFrame("Button", "IRF3_RELOAD", IRF3errframe)--, "SecureHandlerClickTemplate")
	IRF3errframe.reload:SetPoint("BOTTOM", 0, 10)
	IRF3errframe.reload:SetWidth(100)
	IRF3errframe.reload:SetHeight(25)

	IRF3errframe.reload:SetNormalFontObject("GameFontNormal")

	local ntex = IRF3errframe.reload:CreateTexture()
	ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
	ntex:SetTexCoord(0, 0.625, 0, 0.6875)
	ntex:SetAllPoints()
	IRF3errframe.reload:SetNormalTexture(ntex)

	local htex = IRF3errframe.reload:CreateTexture()
	htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
	htex:SetTexCoord(0, 0.625, 0, 0.6875)
	htex:SetAllPoints()
	IRF3errframe.reload:SetHighlightTexture(htex)

	local ptex = IRF3errframe.reload:CreateTexture()
	ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
	ptex:SetTexCoord(0, 0.625, 0, 0.6875)
	ptex:SetAllPoints()
	IRF3errframe.reload:SetPushedTexture(ptex)

	IRF3errframe.reload:SetText("UI Reload")
	IRF3errframe.reload:RegisterForClicks("AnyUp")
	IRF3errframe.reload:SetScript('OnClick', function(self, button, down)
		if button == "LeftButton" or button =="RightButton" then
			EnableAddOn('Blizzard_CompactRaidFrames')
			EnableAddOn('Blizzard_CUFProfiles')
			C_UI.Reload()
		end
	end)
	IRF3errframe.reload:Show()
end

-- 와우 기본 공격대 프레임 및 설정창 숨기기
if CompactRaidFrameManager then
   CompactRaidFrameManager:UnregisterAllEvents()
   CompactRaidFrameManager:SetAlpha(0)
   CompactRaidFrameManager:SetScale(0.00001)
   CompactRaidFrameManagerToggleButton:EnableMouse(nil)
end

if PartyMemberFrame1 then
	PartyMemberFrame1:ClearAllPoints()
	PartyMemberFrame1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 18, -160)
end

if CompactUnitFrameProfiles then
	CompactUnitFrameProfiles:UnregisterAllEvents()
end

if InterfaceOptionsFrame then
	local _
	for _, button in pairs(InterfaceOptionsFrameCategories.buttons) do
		if CompactUnitFrameProfiles and button.element and button.element.name == CompactUnitFrameProfiles.name then
			button:SetScale(0.00001)
			button:SetAlpha(0)
		end
	end
end

--[[
function IRF3_HockCRFLoad()
  SetRaidProfileOption(GetActiveRaidProfile(), "shown", false);
  CompactRaidFrameManager_SetSetting("IsShown", false);
  IRF3_HockCRFLoad = nil
end
hooksecurefunc("CompactUnitFrameProfiles_ValidateProfilesLoaded", IRF3_HockCRFLoad)
]]
-- 위치 표시기를 단축키로 사용할 수 있게 개조
local btn, newPoint
local function preClick(self)
	newPoint = self:GetID() == 0
end
for i = 0, 9 do
	btn = CreateFrame("Button", "InvenRaidFrames3WorldMarker"..i, nil, "SecureActionButtonTemplate")
	btn:SetID(i)
	if i == 0 then
		L_UIDropDownMenu_GetCurrentDropDown().displayMode = nil -- prevent taint?
		btn:SetScript("PreClick", preClick)
		btn:SetAttribute("*type*", "macro")
		btn:SetAttribute("*macrotext*", "/click CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton")
	elseif i == 9 then
		btn:SetAttribute("*type*", "worldmarker")
		btn:SetAttribute("*action*", "clear")
		btn:RegisterForClicks("AnyDown")
	else
		btn:SetAttribute("*type*", "worldmarker")
		btn:SetAttribute("*action*", "toggle")
		btn:SetAttribute("*marker*", i)
		btn:RegisterForClicks("AnyDown")
	end
end
_G["BINDING_NAME_CLICK InvenRaidFrames3WorldMarker0:LeftButton"] = "위치 표시기 메뉴 열기"
for i = 1, 8 do
	_G["BINDING_NAME_CLICK InvenRaidFrames3WorldMarker"..i..":LeftButton"] = _G["WORLD_MARKER"..i]:gsub("\124T.+\124t", ""):gsub("\124r", ""):gsub("\124c[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]", ""):trim()
end
_G["BINDING_NAME_CLICK InvenRaidFrames3WorldMarker9:LeftButton"] = WORLD_MARKER:gsub("%%d", ""):trim().." "..REMOVE_WORLD_MARKERS
--~ LibStub("LibEnhanceDDMenu-1.0"):RegisterNewPoint(CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonDropDown, function() return newPoint end, function() newPoint = nil end, "cursor")
if CompactRaidFrameManager then
	if CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton then
		CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton:SetScript("PostClick", function()
			if not IRF3:IsLeader2() then
				CloseDropDownMenus(1)
			end
		end)
	end
end

IRF3.manager = InvenRaidFrames3Manager

local function checkMode()
	if IsInRaid() then
		if IRF3.manager.mode ~= "raid" then
			IRF3.manager.mode = "raid"
			return true
		end
	elseif IsInGroup() then
		if IRF3.manager.mode ~= "party" then
			IRF3.manager.mode = "party"
			return true
		end
	elseif IRF3.manager.mode ~= "solo" then
		IRF3.manager.mode = "solo"
		return true
	end
	return nil
end

local function updateCount()

	if not CompactRaidFrameManager then
		IRF3.manager.content.memberCountLabel:SetText("애드온이 꺼져있음")
		IRF3.manager.content.label:SetText("블리자드 기본")
		return
	end

	CRF_CountStuff()
	if IsInGroup() then
		IRF3.manager.content.label:SetFormattedText("%s%d %s%d %s%d %s%d", "|TInterface\\LFGFrame\\LFGRole:14:14:0:0:64:16:32:48:0:16|t", RaidInfoCounts.totalRoleTANK, "|TInterface\\LFGFrame\\LFGRole:14:14:0:0:64:16:48:64:0:16|t", RaidInfoCounts.totalRoleHEALER, "|TInterface\\LFGFrame\\LFGRole:14:14:0:0:64:16:16:32:0:16|t", RaidInfoCounts.totalRoleDAMAGER, "|TInterface\\RaidFrame\\ReadyCheck-NotReady:14:14:0:0|t", RaidInfoCounts.totalRoleNONE)
	else
		IRF3.manager.content.label:SetText("IRF 공격대 관리자")
	end
	IRF3.manager.content.memberCountLabel:SetFormattedText("%d/%d", RaidInfoCounts.totalAlive, RaidInfoCounts.totalCount)
end

-- 이벤트 발생 시 스크립트 실행
IRF3.manager:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		if GetCVar("scriptProfile") == "1" then
			DEFAULT_CHAT_FRAME:AddMessage("IRF3 : CPU 사용량 모니터링이 켜져있습니다. 사용중이 아니면 꺼주세요.", 1,1,1);
		end
		checkMode()
		IRF3:SetManagerMode()
	elseif event == "UPDATE_ALL_UI_WIDGETS" then
			IRF3:HideBlizFrames()
-- Torghast fix
	elseif event == "CLIENT_SCENE_CLOSED" then
		if IRF3.db.run and (IRF3.db.use == 1 or (IRF3.db.use == 2 and IRF3.manager.mode ~= "solo") or (IRF3.db.use == 3 and IRF3.manager.mode == "raid") or (IRF3.db.use == 4 and IRF3.manager.mode == "party")) and not onPetBattle then
			inCombat = InCombatLockdown() or UnitAffectingCombat("player")
			if not inCombat then
			   IRF3:Hide()
			   IRF3:Show()
			end
			
			IRF3:HideBlizFrames()
		end
-- Torghast fix
	elseif event == "DISPLAY_SIZE_CHANGED" or event == "UI_SCALE_CHANGED" then
		IRF3:SetManagerPosition()
	elseif event == "GROUP_ROSTER_UPDATE" then
		if checkMode() then
			if self.run then
				IRF3:SetManagerMode()
			end
		elseif self.run and self.isExpand then
			updateCount()
		end
	elseif event == "RAID_TARGET_UPDATE" or event == "PLAYER_TARGET_CHANGED" then
		if self.run and self.isExpand then
			CompactRaidFrameManager_UpdateRaidIcons()
		end
	elseif event == "PET_BATTLE_OPENING_START" then
		onPetBattle = true
		IRF3:SetManagerMode()
	elseif event == "PET_BATTLE_CLOSE" then
		onPetBattle = false
		IRF3:SetManagerMode()
	--elseif event == "CINEMATIC_STOP" then
	-- 9.0.1
	elseif self.run and self.isExpand then
		-- PARTY_LEADER_CHANGED, PLAYER_REGEN_ENABLED, PLAYER_REGEN_DISABLED
		IRF3:SetManagerMode()
	end
end)

IRF3.manager.toggleButton:RegisterForClicks("LeftButtonUp")
IRF3.manager.toggleButton:SetScript("OnClick", function(self)
	self = self:GetParent()
	self.isExpand = not self.isExpand
	IRF3:SetManagerMode()
end)

IRF3.manager.content.lockButton:SetScript("OnClick", function(self)
	IRF3.db.lock = not IRF3.db.lock
	self:SetText(IRF3.db.lock and UNLOCK or LOCK)
	if IRF3.optionFrame.lockMenu and IRF3.optionFrame.lockMenu:IsVisible() then
		IRF3.optionFrame.lockMenu:Update()
	end
end)

IRF3.manager.content.hideButton:SetScript("OnClick", function(self)
	IRF3:SetAttribute("run", not IRF3.db.run)
	InvenRaidFrames3Overlord:GetScript("PostClick")(InvenRaidFrames3Overlord)
end)

function IRF3:ToggleManager()
	if self.db.useManager then
		self.manager:RegisterEvent("PLAYER_ENTERING_WORLD")
-- Torghast fix
		self.manager:RegisterEvent("UPDATE_ALL_UI_WIDGETS")
--		self.manager:RegisterEvent("ZONE_CHANGED_NEW_AREA")
--		self.manager:RegisterEvent("CLIENT_SCENE_OPENED")
		self.manager:RegisterEvent("CLIENT_SCENE_CLOSED")

-- Torghast fix
		self.manager:RegisterEvent("DISPLAY_SIZE_CHANGED")
		self.manager:RegisterEvent("UI_SCALE_CHANGED")
		self.manager:RegisterEvent("GROUP_ROSTER_UPDATE")
		self.manager:RegisterEvent("PARTY_LEADER_CHANGED")
		self.manager:RegisterEvent("RAID_TARGET_UPDATE")
		self.manager:RegisterEvent("PLAYER_TARGET_CHANGED")
--		self.manager:RegisterEvent("PLAYER_REGEN_ENABLED")
		self.manager:RegisterEvent("PLAYER_REGEN_DISABLED")
--		self.manager:RegisterEvent("PLAYER_REGEN_ENABLED")
		self.manager:RegisterEvent("PET_BATTLE_OPENING_START")
		self.manager:RegisterEvent("PET_BATTLE_CLOSE")
--		self.manager:RegisterEvent("CINEMATIC_STOP")  -- 9.0.1 add
		checkMode()
		self:SetManagerMode()
	else
		self.manager.run, self.manager.mode, self.manager.isExpand = nil
		self.manager:UnregisterAllEvents()
		self.manager:Hide()
	end
end

function IRF3:SetManagerMode()
	if (self.db.use == 1 or (self.db.use == 2 and self.manager.mode ~= "solo") or (self.db.use == 3 and self.manager.mode == "raid") or (self.db.use == 4 and self.manager.mode == "party")) and not onPetBattle then
		self.manager.run = true
		self.manager:Show()
		self:SetManagerPosition()
		if self.manager.isExpand then
			inCombat = InCombatLockdown() or UnitAffectingCombat("player")
			self.manager.content:Show()
			updateCount()
			if CompactRaidFrameManager then
				CompactRaidFrameManager_UpdateRaidIcons()
				if self:IsLeader() then
					self.manager.content.readyCheckButton:Enable()
					self.manager.content.readyCheckButton:SetAlpha(1)
					if HasLFGRestrictions and HasLFGRestrictions() then
						if self.manager.content.rolePollButton then
							self.manager.content.rolePollButton:Disable()
							self.manager.content.rolePollButton:SetAlpha(0.5)
						end
						self.manager.content.everyoneIsAssistButton:Disable()
						self.manager.content.everyoneIsAssistButton:SetAlpha(0.5)
					else
						if self.manager.content.rolePollButton then
							self.manager.content.rolePollButton:Enable()
							self.manager.content.rolePollButton:SetAlpha(1)
						end
						self.manager.content.everyoneIsAssistButton:Enable()
						self.manager.content.everyoneIsAssistButton:SetAlpha(1)
					end
				else
					self.manager.content.readyCheckButton:Disable()
					self.manager.content.readyCheckButton:SetAlpha(0.5)
					if self.manager.content.rolePollButton then
						self.manager.content.rolePollButton:Disable()
						self.manager.content.rolePollButton:SetAlpha(0.5)
					end
					self.manager.content.everyoneIsAssistButton:Disable()
					self.manager.content.everyoneIsAssistButton:SetAlpha(0.5)
				end
				if self.manager.content.markerButton then
					if self:IsLeader2() then
						self.manager.content.markerButton:Enable()
						self.manager.content.markerButton:SetAlpha(1)
					else
						self.manager.content.markerButton:Disable()
						self.manager.content.markerButton:SetAlpha(0.5)
					end
				end
				self.manager.content.lockButton:SetText(self.db.lock and UNLOCK or LOCK)
				self.manager.content.hideButton:SetText(self.db.run and HIDE or SHOW)
				if inCombat then
					self.manager.content.hideButton:Disable()
					self.manager.content.hideButton:SetAlpha(0.5)
				else
					self.manager.content.hideButton:Enable()
					self.manager.content.hideButton:SetAlpha(1)
				end
				self:UpdateManagerGroupFilter()
			end
		else
			self.manager.content:Hide()
		end
	else
		self.manager.run, self.manager.isExpand = nil
		self.manager:Hide()
	end
end

function IRF3:SetManagerPosition()
	if not self.manager.run then return end
	self.manager:ClearAllPoints()
	self.manager.toggleButton:ClearAllPoints()
	if self.db.managerPos < 45 or self.db.managerPos > 315 then
		self.manager.pos = "LEFT"
		self.manager:SetSize(186, self.manager.mode == "raid" and 221 or 147)
		self.manager.toggleButton:SetSize(15, 64)
		self.manager.toggleButton:SetPoint("RIGHT", -2, 0)
		self.manager.toggleButton:SetHitRectInsets(5, 0, 6, 6)
		self.manager.toggleButton.normal:SetTexture("Interface\\RaidFrame\\RaidPanel-Toggle")
		if self.manager.isExpand then
			self.manager:SetPoint("LEFT", UIParent, -5, -(self.manager:GetHeight() / 2 - select(2, UIParent:GetCenter())) * ((self.db.managerPos - (self.db.managerPos >= 315 and 360 or 0)) / 44))
			self.manager.toggleButton.normal:SetTexCoord(0.53125, 1, 0, 1)
			self.manager.content:ClearAllPoints()
			self.manager.content:SetPoint("TOP", self.manager.bg, 0, 0)
			self.manager.content:SetPoint("LEFT", UIParent, 2, 0)
			self.manager.content:SetPoint("BOTTOMRIGHT", self.manager.bg, -8, 3)
		else
			self.manager:SetPoint("RIGHT", UIParent, "LEFT", 12, -(self.manager:GetHeight() / 2 - select(2, UIParent:GetCenter())) * ((self.db.managerPos - (self.db.managerPos >= 315 and 360 or 0)) / 44))
			self.manager.toggleButton.normal:SetTexCoord(0, 0.46875, 0, 1)
		end
	elseif self.db.managerPos > 135 and self.db.managerPos < 225 then
		self.manager.pos = "RIGHT"
		self.manager:SetSize(186, self.manager.mode == "raid" and 221 or 147)
		self.manager.toggleButton:SetSize(15, 64)
		self.manager.toggleButton:SetPoint("LEFT", 2, 0)
		self.manager.toggleButton:SetHitRectInsets(0, 5, 6, 6)
		self.manager.toggleButton.normal:SetTexture("Interface\\RaidFrame\\RaidPanel-Toggle")
		if self.manager.isExpand then
			self.manager:SetPoint("RIGHT", UIParent, 5, (self.manager:GetHeight() / 2 - select(2, UIParent:GetCenter())) * ((self.db.managerPos - 180) / 44))
			self.manager.toggleButton.normal:SetTexCoord(1, 0.53125, 0, 1)
			self.manager.content:ClearAllPoints()
			self.manager.content:SetPoint("TOP", self.manager.bg, 0, 0)
			self.manager.content:SetPoint("RIGHT", UIParent, -2, 0)
			self.manager.content:SetPoint("BOTTOMLEFT", self.manager.bg, 8, 3)
		else
			self.manager:SetPoint("LEFT", UIParent, "RIGHT", -12, (self.manager:GetHeight() / 2 - select(2, UIParent:GetCenter())) * ((self.db.managerPos - 180) / 44))
			self.manager.toggleButton.normal:SetTexCoord(0.46875, 0, 0, 1)
		end
	elseif self.db.managerPos >= 45 and self.db.managerPos <= 135 then
		self.manager.pos = "TOP"
		self.manager:SetSize(184, self.manager.mode == "raid" and 231 or 156)
		self.manager.toggleButton:SetSize(64, 15)
		self.manager.toggleButton:SetPoint("BOTTOM", 0, 3)
		self.manager.toggleButton:SetHitRectInsets(6, 6, 5, 0)
		self.manager.toggleButton.normal:SetTexture(texturePath.."ManagerToggleHoriz")
		if self.manager.isExpand then
			self.manager:SetPoint("TOP", UIParent, -(self.manager:GetWidth() - UIParent:GetCenter() * 2) * ((self.db.managerPos - 90) / 90), 5)
			self.manager.toggleButton.normal:SetTexCoord(0, 1, 0.53125, 1)
			self.manager.content:ClearAllPoints()
			self.manager.content:SetPoint("TOP", UIParent, 0, 0)
			self.manager.content:SetPoint("LEFT", self.manager.bg, 2, 0)
			self.manager.content:SetPoint("BOTTOMRIGHT", self.manager.bg, -2, 12)
		else
			self.manager:SetPoint("BOTTOM", UIParent, "TOP", -(self.manager:GetWidth() - UIParent:GetCenter() * 2) * ((self.db.managerPos - 90) / 90), -13)
			self.manager.toggleButton.normal:SetTexCoord(0, 1, 0, 0.46875)
		end
	else
		self.manager.pos = "BOTTOM"
		self.manager:SetSize(184, self.manager.mode == "raid" and 223 or 148)
		self.manager.toggleButton:SetSize(64, 15)
		self.manager.toggleButton:SetPoint("TOP", 0, -4)
		self.manager.toggleButton:SetHitRectInsets(6, 6, 0, 5)
		self.manager.toggleButton.normal:SetTexture(texturePath.."ManagerToggleHoriz")
		if self.manager.isExpand then
			self.manager:SetPoint("BOTTOM", UIParent, -(self.manager:GetWidth() - UIParent:GetCenter() * 2) * ((270 - self.db.managerPos) / 90), -5)
			self.manager.toggleButton.normal:SetTexCoord(0, 1, 1, 0.53125)
			self.manager.content:ClearAllPoints()
			self.manager.content:SetPoint("TOPLEFT", self.manager.bg, 2, 0)
			self.manager.content:SetPoint("TOPRIGHT", self.manager.bg, -2, 0)
			self.manager.content:SetPoint("BOTTOM", UIParent, 0, 3)
		else
			self.manager:SetPoint("TOP", UIParent, "BOTTOM", -(self.manager:GetWidth() - UIParent:GetCenter() * 2) * ((270 - self.db.managerPos) / 90), 13)
			self.manager.toggleButton.normal:SetTexCoord(0, 1, 0.46875, 0)
		end
	end
end

local partyGroupPosTable = {
	{ "TOPLEFT", 1, 0 },
	{ "TOP", -21, 0 },
	{ "TOP", 21, 0 },
	{ "TOPRIGHT", -1, 0 },
	{ "BOTTOMLEFT", 1, 0 },
	{ "BOTTOM", -21, 0 },
	{ "BOTTOM", 21, 0 },
	{ "BOTTOMRIGHT", -1, 0 },
}

local function groupSetPos(self)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:ClearAllPoints()
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetPoint(unpack(partyGroupPosTable[IRF3.db.grouporder[self:GetID()]]))
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetFrameLevel(14)
end

local function groupOnClick(self)
	IRF3.db.groupshown[self:GetID()] = not IRF3.db.groupshown[self:GetID()]
	if IRF3.db.groupshown[self:GetID()] then
		self.selectedHighlight:Show()
	else
		self.selectedHighlight:Hide()
	end
	IRF3:UpdateGroupFilter()
end

local function groupOnDragStart(self)
	IRF3.manager.group.drag = self
	self:SetFrameLevel(15)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:StartMoving()
end

local function groupOnHide(self)
	if IRF3.manager.group.drag == self then
		IRF3.manager.group.drag = nil
		self:StopMovingOrSizing()
		groupSetPos(self)
		return true
	end
	return nil
end

local function groupOnDragStop(self)
	if groupOnHide(self) then
		self:GetScript("OnMouseUp")(self)
		for i = 1, 8 do
			if self:GetID() ~= i and IRF3.manager.group[i]:IsMouseOver() then
				IRF3.db.grouporder[self:GetID()], IRF3.db.grouporder[i] = IRF3.db.grouporder[i], IRF3.db.grouporder[self:GetID()]
				groupSetPos(self)
				groupSetPos(IRF3.manager.group[i])
				IRF3:UpdateGroupFilter()
				break
			end
		end
	end
end

IRF3.manager.group = {}
for i = 1, 8 do
	IRF3.manager.group[i] = IRF3.manager.content.partyGroup["group"..i]
	IRF3.manager.group[i]:RegisterForDrag("LeftButton")
	IRF3.manager.group[i]:SetScript("OnClick", groupOnClick)
	IRF3.manager.group[i]:SetScript("OnDragStart", groupOnDragStart)
	IRF3.manager.group[i]:SetScript("OnDragStop", groupOnDragStop)
	IRF3.manager.group[i]:SetScript("OnHide", groupOnHide)
end

local function classOnClick(self)
	IRF3.db.classshown[self.class] = not IRF3.db.classshown[self.class]
	if IRF3.db.classshown[self.class] then
		self.selectedHighlight:Show()
	else
		self.selectedHighlight:Hide()
	end
	IRF3:UpdateGroupFilter()
end

local function lookupTable(tbl, value)
	for i = 1, #tbl do
		if tbl[i] == value then
			return i
		end
	end
	return nil
end

local classGroupPosTable = {
	{ "TOPLEFT", 3, 0 },
	{ "TOPLEFT", 31, 0 },
	{ "TOPLEFT", 59, 0 },
	{ "TOPLEFT", 87, 0 },
	{ "TOPLEFT", 115, 0 },
	{ "TOPLEFT", 143, 0 },
	{ "TOPLEFT", 171, 0 },
	{ "BOTTOMLEFT", 3, 0 },
	{ "BOTTOMLEFT", 31, 0 },
	{ "BOTTOMLEFT", 59, 0 },
	{ "BOTTOMLEFT", 87, 0 },
	{ "BOTTOMLEFT", 115, 0 },
	{ "BOTTOMLEFT", 143, 0 },
}

local function classSetPos(self, index)
	index = index or lookupTable(IRF3.db.classorder, self.class)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:ClearAllPoints()
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetPoint(unpack(classGroupPosTable[index]))
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetFrameLevel(14)
end

local function classOnDragStart(self)
	IRF3.manager.group.drag = self
	self:SetFrameLevel(15)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:StartMoving()
end

local function classOnHide(self)
	if IRF3.manager.group.drag == self then
		IRF3.manager.group.drag = nil
		self:StopMovingOrSizing()
		classSetPos(self)
		return true
	end
	return nil
end

local function classOnDragStop(self)
	if classOnHide(self) then
		self:GetScript("OnMouseUp")(self)
		for i, class in ipairs(IRF3.db.classorder) do
			if self.class ~= class and IRF3.manager.group[class]:IsMouseOver() then
				local index = lookupTable(IRF3.db.classorder, self.class)
				IRF3.db.classorder[index], IRF3.db.classorder[i] = IRF3.db.classorder[i], IRF3.db.classorder[index]
				classSetPos(self, i)
				classSetPos(IRF3.manager.group[class], index)
				IRF3:UpdateGroupFilter()
				break
			end
		end
	end
end
local CLASS_ICON_TCOORDS = _G.CLASS_ICON_TCOORDS
if not CLASS_ICON_TCOORDS["EVOKER"] then
	CLASS_ICON_TCOORDS["EVOKER"] = {0, 0.25, 0.75, 1}
end
if CompactRaidFrameManager then
	for i, class in ipairs(IRF3.classes) do
		IRF3.manager.group[class] = IRF3.manager.content.classGroup[class]
		IRF3.manager.group[class]:GetHighlightTexture():SetAlpha(0.25)
		IRF3.manager.group[class].class = class
		IRF3.manager.group[class]:SetSize(28, 24)
		IRF3.manager.group[class].tex = IRF3.manager.group[class]:CreateTexture(nil, "OVERLAY", nil, 1)
		IRF3.manager.group[class].tex:SetPoint("CENTER", 0, 0)
		IRF3.manager.group[class].tex:SetSize(18, 18)
		IRF3.manager.group[class].tex:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
		IRF3.manager.group[class].tex:SetTexCoord(CLASS_ICON_TCOORDS[class][1], CLASS_ICON_TCOORDS[class][2], CLASS_ICON_TCOORDS[class][3], CLASS_ICON_TCOORDS[class][4])
		IRF3.manager.group[class]:RegisterForDrag("LeftButton")
		IRF3.manager.group[class]:SetScript("OnClick", classOnClick)
		IRF3.manager.group[class]:SetScript("OnDragStart", classOnDragStart)
		IRF3.manager.group[class]:SetScript("OnDragStop", classOnDragStop)
		IRF3.manager.group[class]:SetScript("OnHide", classOnHide)
	end
end

-- ROLE 정렬 시 테이블 설정
local roleGroupPosTable = {
	{ "TOPLEFT", 3, 0 },
	{ "TOPLEFT", 31, 0 },
	{ "TOPLEFT", 59, 0 },
	{ "TOPLEFT", 87, 0 },
}
-- ROLE정렬 시 파티 조정 버튼을 변경
local function roleOnClick(self)
	IRF3.db.roleshown[lookupTable(IRF3.db.roleorder, self.role)] = not IRF3.db.roleshown[lookupTable(IRF3.db.roleorder, self.role)]
	if IRF3.db.roleshown[lookupTable(IRF3.roles, self.role)] then
		self.selectedHighlight:Show()
	else
		self.selectedHighlight:Hide()
	end
	IRF3:UpdateGroupFilter()
end

local function roleSetPos(self, index)
	index = index or lookupTable(IRF3.roles, self.role)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:ClearAllPoints()
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetPoint(unpack(roleGroupPosTable[index]))
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:SetFrameLevel(14)
end

-- ROLE별 정렬 버튼의 동작을 설정
local function roleOnDragStart(self)
	IRF3.manager.group.drag = self
	self:SetFrameLevel(15)
	if SetUserPlaced then
		self:SetUserPlaced(nil)
	end
	self:StartMoving()
end

local function roleOnHide(self)
	if IRF3.manager.group.drag == self then
		IRF3.manager.group.drag = nil
		self:StopMovingOrSizing()
		roleSetPos(self)
		return true
	end
	return nil
end

local function roleOnDragStop(self)
	if roleOnHide(self) then
		self:GetScript("OnMouseUp")(self)
		for i, role in ipairs(IRF3.db.roleorder) do
			if i ~= 4 and self.role ~= role and IRF3.manager.group[role]:IsMouseOver() then
				local index = lookupTable(IRF3.db.roleorder, self.role)
				IRF3.db.roleorder[index], IRF3.db.roleorder[i] = IRF3.db.roleorder[i], IRF3.db.roleorder[index]
				roleSetPos(self, i)
				roleSetPos(IRF3.manager.group[role], index)
				IRF3:UpdateGroupFilter()
				return
			end
		end
		roleSetPos(self)
	end
end

-- ROLE 정렬 버튼을 초기화
if CompactRaidFrameManager then
	for i, role in ipairs(IRF3.roles) do
		IRF3.manager.group[role] = IRF3.manager.content.roleGroup[role]
		IRF3.manager.group[role]:GetHighlightTexture():SetAlpha(0.25)
		IRF3.manager.group[role].role = role
		IRF3.manager.group[role]:SetSize(28, 24)
		IRF3.manager.group[role].tex = IRF3.manager.group[role]:CreateTexture(nil, "OVERLAY", nil, 1)
		IRF3.manager.group[role].tex:SetPoint("CENTER", 0, 0)
		IRF3.manager.group[role].tex:SetSize(32, 32)
		IRF3.manager.group[role].tex:SetTexture("Interface\\AddOns\\InvenRaidFrames3\\Texture\\RoleIcon_MiirGui")
		if lookupTable(IRF3.roles, role) == 1 then
			IRF3.manager.group[role].tex:SetTexCoord(GetTexCoordsForRoleSmallCircle("TANK"))
		elseif lookupTable(IRF3.roles, role) == 2 then
			IRF3.manager.group[role].tex:SetTexCoord(GetTexCoordsForRoleSmallCircle("HEALER"))
		else
			IRF3.manager.group[role].tex:SetTexCoord(GetTexCoordsForRoleSmallCircle("DAMAGER"))
		end
		IRF3.manager.group[role]:RegisterForDrag("LeftButton")
		IRF3.manager.group[role]:SetScript("OnClick", roleOnClick)
		IRF3.manager.group[role]:SetScript("OnDragStart", roleOnDragStart)
		IRF3.manager.group[role]:SetScript("OnDragStop", roleOnDragStop)
		IRF3.manager.group[role]:SetScript("OnHide", roleOnHide)
	end
end

-- 정렬 창 통합 업데이트 스크립트
function IRF3:UpdateManagerGroupFilter()
	if self.manager.group.drag then
		self.manager.group.drag:StopMovingOrSizing()
		if SetUserPlaced then
			self.manager.group.drag:SetUserPlaced(nil)
		end
		self.manager.group.drag = nil
	end
	if self.manager.run and self.manager.isExpand then
		if self.manager.mode == "raid" then
			self.manager.content.everyoneIsAssistButton:Show()
			self.manager.content.groupLine:Show()
			inCombat = InCombatLockdown() or UnitAffectingCombat("player")
			if IRF3.db.groupby == "GROUP" then
				self.manager.content.partyGroup:Show()
				self.manager.content.classGroup:Hide()
				self.manager.content.roleGroup:Hide()
				for i = 1, 8 do
					groupSetPos(self.manager.group[i])
					if inCombat then
						self.manager.group[i]:Disable()
						self.manager.group[i]:SetAlpha(0.5)
						self.manager.group[i].selectedHighlight:SetDesaturated(true)
					else
						self.manager.group[i]:Enable()
						self.manager.group[i]:SetAlpha(1)
						self.manager.group[i].selectedHighlight:SetDesaturated(nil)
					end
					if IRF3.db.groupshown[i] then
						self.manager.group[i].selectedHighlight:Show()
					else
						self.manager.group[i].selectedHighlight:Hide()
					end
				end
			elseif IRF3.db.groupby == "CLASS" then
				self.manager.content.partyGroup:Hide()
				self.manager.content.classGroup:Show()
				self.manager.content.roleGroup:Hide()
				for i, class in ipairs(self.db.classorder) do
					classSetPos(self.manager.group[class], i)
					if inCombat then
						self.manager.group[class]:Disable()
						self.manager.group[class]:SetAlpha(0.5)
						self.manager.group[class].tex:SetDesaturated(true)
						self.manager.group[class].selectedHighlight:SetDesaturated(true)
					else
						self.manager.group[class]:Enable()
						self.manager.group[class]:SetAlpha(1)
						self.manager.group[class].selectedHighlight:SetDesaturated(nil)
						self.manager.group[class].tex:SetDesaturated(not self.db.classshown[class])
					end
					if self.db.classshown[class] then
						self.manager.group[class].selectedHighlight:Show()
					else
						self.manager.group[class].selectedHighlight:Hide()
					end
				end
			else	-- ROLE
				self.manager.content.partyGroup:Hide()
				self.manager.content.classGroup:Hide()
				self.manager.content.roleGroup:Show()
				for i, role in ipairs(self.db.roleorder) do
					if role == "NONE" then
					else
						roleSetPos(self.manager.group[role], i)
						if inCombat then
							self.manager.group[role]:Disable()
							self.manager.group[role]:SetAlpha(0.5)
							self.manager.group[role].tex:SetDesaturated(true)
							self.manager.group[role].selectedHighlight:SetDesaturated(true)
						else
							self.manager.group[role]:Enable()
							self.manager.group[role]:SetAlpha(1)
							self.manager.group[role].selectedHighlight:SetDesaturated(nil)
							self.manager.group[role].tex:SetDesaturated(not self.db.roleshown[i])
						end
						if self.db.roleshown[i] then
							self.manager.group[role].selectedHighlight:Show()
						else
							self.manager.group[role].selectedHighlight:Hide()
						end
					end
				end
			end
		else
			self.manager.content.everyoneIsAssistButton:Hide()
			self.manager.content.groupLine:Hide()
			self.manager.content.partyGroup:Hide()
			self.manager.content.classGroup:Hide()
			self.manager.content.roleGroup:Hide()
		end
	end
end