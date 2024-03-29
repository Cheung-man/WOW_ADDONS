﻿--[[
인벤 레이드 프레임 개인 멤버 스크립트
]]

local _G = _G
local IRF3, noOption = ...
local pairs = _G.pairs
local ipairs = _G.ipairs
local unpack = _G.unpack
local select = _G.select
local tinsert = _G.table.insert
local max = _G.math.max
local min = _G.math.min
local UnitExists = _G.UnitExists
local UnitHealth = _G.UnitHealth
local UnitHealthMax = _G.UnitHealthMax
local UnitPower = _G.UnitPower
local UnitPowerMax = _G.UnitPowerMax
local UnitPowerType = _G.UnitPowerType
local UnitAlternatePowerInfo = _G.UnitAlternatePowerInfo
local GetUnitPowerBarInfo = _G.GetUnitPowerBarInfo
local UnitInRange = _G.UnitInRange
local UnitIsGhost = _G.UnitIsGhost
local UnitIsDead = _G.UnitIsDead
local UnitIsDeadOrGhost = _G.UnitIsDeadOrGhost
local UnitIsAFK = _G.UnitIsAFK
local UnitIsUnit = _G.UnitIsUnit
local UnitCanAttack = _G.UnitCanAttack
local UnitIsConnected = _G.UnitIsConnected
local UnitHasVehicleUI = _G.UnitHasVehicleUI
local UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned
local UnitGetIncomingHeals = _G.UnitGetIncomingHeals
local UnitGetTotalAbsorbs = _G.UnitGetTotalAbsorbs
local UnitIsPlayer = _G.UnitIsPlayer
local UnitInParty = _G.UnitInParty
local UnitInRaid = _G.UnitInRaid
local UnitClass = _G.UnitClass
local UnitDistanceSquared = _G.UnitDistanceSquared
local UnitInOtherParty = _G.UnitInOtherParty
local UnitHasIncomingResurrection = _G.UnitHasIncomingResurrection
local UnitInPhase = _G.UnitInPhase
local UnitPhaseReason = _G.UnitPhaseReason
local GetRaidRosterInfo = _G.GetRaidRosterInfo
local UnitIsGroupLeader = _G.UnitIsGroupLeader
local InCombatLockdown = _G.InCombatLockdown
local GetTime = _G.GetTime
local SM = LibStub("LibSharedMedia-3.0")
--local LEDDM = LibStub("LibEnhanceDDMenu-1.0")
local eventHandler = {}
IRF3 = _G[IRF3]
IRF3.visibleMembers = {}

function IRF3:SetupAll(update)
	for _, header in pairs(self.headers) do
		for _, member in pairs(header.members) do
			member:Setup()
		end
	end
	for _, member in pairs(self.petHeader.members) do
		member:Setup()
	end
end

local statusBarTexture = "Interface\\RaidFrame\\Raid-Bar-Resource-Fill"

local function setupMemberTexture(self)
	statusBarTexture = SM:Fetch("statusbar", IRF3.db.units.texture)
	self.powerBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", -1)
	self.healthBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", -1)
	self.myHealPredictionBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", -2)
	self.myHealPredictionBar:SetStatusBarColor(IRF3.db.units.myHealPredictionColor[1], IRF3.db.units.myHealPredictionColor[2], IRF3.db.units.myHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
	self.otherHealPredictionBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", -3)
	self.otherHealPredictionBar:SetStatusBarColor(IRF3.db.units.otherHealPredictionColor[1], IRF3.db.units.otherHealPredictionColor[2], IRF3.db.units.otherHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
	self.absorbPredictionBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", -4)
	self.absorbPredictionBar:SetStatusBarColor(IRF3.db.units.AbsorbPredictionColor[1], IRF3.db.units.AbsorbPredictionColor[2], IRF3.db.units.AbsorbPredictionColor[3], IRF3.db.units.healPredictionAlpha)
	self.overAbsorbGlow:SetTexture("Interface\\RaidFrame\\Shield-Overshield")
	self.overAbsorbGlow:SetDrawLayer("OVERLAY", 2)
	self.overAbsorbGlow:SetBlendMode("ADD")
	self.overAbsorbGlow:ClearAllPoints()
	self.overAbsorbGlow:SetPoint("BOTTOMRIGHT", self.healthBar, "BOTTOMRIGHT", 7, 0)
	self.overAbsorbGlow:SetPoint("TOPRIGHT", self.healthBar, "TOPRIGHT", 7, 0)
	self.overAbsorbGlow:SetWidth(16)
	self.overAbsorbGlow:SetAlpha(0.4)
	if self.petButton then
		self.petButton.powerBar:SetStatusBarTexture(statusBarTexture, "BORDER", -1)
		self.petButton.healthBar:SetStatusBarTexture(statusBarTexture, "BORDER", -1)
		self.petButton.myHealPredictionBar:SetStatusBarTexture(statusBarTexture, "BORDER", -1)
		self.petButton.myHealPredictionBar:SetStatusBarColor(IRF3.db.units.myHealPredictionColor[1], IRF3.db.units.myHealPredictionColor[2], IRF3.db.units.myHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
		self.petButton.otherHealPredictionBar:SetStatusBarTexture(statusBarTexture, "BORDER", -1)
		self.petButton.otherHealPredictionBar:SetStatusBarColor(IRF3.db.units.otherHealPredictionColor[1], IRF3.db.units.otherHealPredictionColor[2], IRF3.db.units.otherHealPredictionColor[3], IRF3.db.units.healPredictionAlpha)
	end
	if self.castingBar then
		self.castingBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", 4)
		self.castingBar:SetStatusBarColor(IRF3.db.units.castingBarColor[1], IRF3.db.units.castingBarColor[2], IRF3.db.units.castingBarColor[3])
	end
	if self.powerBarAlt then
		self.powerBarAlt:SetStatusBarTexture(statusBarTexture, "OVERLAY", 1)
		self.powerBarAlt:SetStatusBarColor(self.powerBarAlt.r or 1, self.powerBarAlt.g or 1, self.powerBarAlt.b or 1)
	end
	if self.resurrectionBar then
		self.resurrectionBar:SetStatusBarTexture(statusBarTexture, "OVERLAY", 5)
		self.resurrectionBar:SetStatusBarColor(IRF3.db.units.resurrectionBarColor[1], IRF3.db.units.resurrectionBarColor[2], IRF3.db.units.resurrectionBarColor[3])
	end
	if self.bossAura then
		self.bossAura:SetAlpha(IRF3.db.units.bossAuraAlpha)
	end
	if self.centerStatusIcon then
		self.centerStatusIcon:ClearAllPoints()
		self.centerStatusIcon:SetPoint("CENTER", self, "BOTTOM", 0, IRF3.db.height / 3 + 2)
		self.centerStatusIcon:SetSize(18, 18)
	end
end

local function setHorizontal(bar)
	bar:SetOrientation("HORIZONTAL")
	bar:ClearAllPoints()
	bar:SetPoint("TOPLEFT", bar:GetParent(), "TOPLEFT", 0, 0)
	bar:GetParent().orientation = 1
end

local function setVertical(bar, parent)
	bar:SetOrientation("VERTICAL")
	bar:ClearAllPoints()
	bar:SetPoint("BOTTOMLEFT", bar:GetParent(), "BOTTOMLEFT", 0, 0)
	bar:GetParent().orientation = 2
end

local function setupMemberBarOrientation(self)
	if IRF3.db.units.orientation == 1 then
		self.healthBar:SetOrientation("HORIZONTAL")
		setHorizontal(self.myHealPredictionBar)
		setHorizontal(self.otherHealPredictionBar)
		setHorizontal(self.absorbPredictionBar)
	else
		self.healthBar:SetOrientation("VERTICAL")
		setVertical(self.myHealPredictionBar)
		setVertical(self.otherHealPredictionBar)
		setVertical(self.absorbPredictionBar)
	end
end

local function setupMemberPowerBar(self)
	self.healthBar:ClearAllPoints()
	self.powerBar:ClearAllPoints()
	if IRF3.db.units.nameEndl then
	
		self.name:SetPoint("CENTER", self.healthBar, 0, 5)
	
		if self.losttext then
			self.losttext:SetPoint("TOP", self.name, "BOTTOM", 0, -2)
		end
		
	else
		self.name:SetPoint("CENTER", self.healthBar, 0, 0)
		if self.losttext then
			self.losttext:SetPoint("TOP", self.name, "BOTTOM", 0, -2)--no use
		end
	end
	if IRF3.db.units.powerBarPos == 1 or IRF3.db.units.powerBarPos == 2 then
		self.powerBar:SetWidth(0)
		self.powerBar:SetOrientation("HORIZONTAL")
		if IRF3.db.units.powerBarHeight > 0 then
			self.powerBar:SetHeight(IRF3.db.height * IRF3.db.units.powerBarHeight)
		else
			self.powerBar:SetHeight(0.001)
		end
		if IRF3.db.units.powerBarPos == 1 then
			self.healthBar:SetPoint("TOPLEFT", self.powerBar, "BOTTOMLEFT", 0, 0)
			self.healthBar:SetPoint("BOTTOMRIGHT", 0, 0)
			self.powerBar:SetPoint("TOPLEFT", 0, 0)
			self.powerBar:SetPoint("TOPRIGHT", 0, 0)
		else
			self.healthBar:SetPoint("TOPLEFT", 0, 0)
			self.healthBar:SetPoint("BOTTOMRIGHT", self.powerBar, "TOPRIGHT", 0, 0)
			self.powerBar:SetPoint("BOTTOMLEFT", 0, 0)
			self.powerBar:SetPoint("BOTTOMRIGHT", 0, 0)
		end
	else
		self.powerBar:SetHeight(0)
		self.powerBar:SetOrientation("VERTICAL")
		if IRF3.db.units.powerBarHeight > 0 then
			self.powerBar:SetWidth(IRF3.db.width * IRF3.db.units.powerBarHeight)
		else
			self.powerBar:SetWidth(0.001)
		end
		if IRF3.db.units.powerBarPos == 3 then
			self.healthBar:SetPoint("TOPLEFT", self.powerBar, "TOPRIGHT", 0, 0)
			self.healthBar:SetPoint("BOTTOMRIGHT", 0, 0)
			self.powerBar:SetPoint("TOPLEFT", 0, 0)
			self.powerBar:SetPoint("BOTTOMLEFT", 0, 0)
		else
			self.healthBar:SetPoint("TOPLEFT", 0, 0)
			self.healthBar:SetPoint("BOTTOMRIGHT", self.powerBar, "BOTTOMLEFT", 0, 0)
			self.powerBar:SetPoint("TOPRIGHT", 0, 0)
			self.powerBar:SetPoint("BOTTOMRIGHT", 0, 0)
		end
	end
end

local function checkMouseOver(self)
	if not UnitIsUnit(self:GetParent().displayedUnit, "mouseover") then
		self:Hide()
	end
end

local function setupMemberOutline(self)
	if not self.outline then
		self.outline = CreateFrame("Frame", nil, self, BackdropTemplateMixin and "BackdropTemplate")
		self.outline:SetPoint("TOPLEFT", self, "TOPLEFT", -3, 2);
		self.outline:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 3, -2);
		self.outline:SetBackdrop({
			--bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile = "Interface\\Addons\\InvenRaidFrames3\\Texture\\Border.tga",
			--tile = true,
			--tileEdge = true,
			--tileSize = 16,
			edgeSize = 16,
			--insets = { left = -3, right = 2, top = -2, bottom = 3 },
		})
	else
	end

	self.outline:SetScript("OnUpdate", nil)
	self.outline:SetScale(self.optionTable.outline.scale)
	self.outline:SetAlpha(self.optionTable.outline.alpha)
	self:UnregisterEvent("PLAYER_TARGET_CHANGED")
	self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
	if self.optionTable.outline.type == 2 then
		self:RegisterEvent("PLAYER_TARGET_CHANGED")
		self.outline:SetBackdropBorderColor(self.optionTable.outline.targetColor[1], self.optionTable.outline.targetColor[2], self.optionTable.outline.targetColor[3])
	elseif self.optionTable.outline.type == 3 then
		self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
		self.outline:SetBackdropBorderColor(self.optionTable.outline.mouseoverColor[1], self.optionTable.outline.mouseoverColor[2], self.optionTable.outline.mouseoverColor[3])
		self.outline:SetScript("OnUpdate", checkMouseOver)
	elseif self.optionTable.outline.type == 4 then
		self.outline:SetBackdropBorderColor(self.optionTable.outline.lowHealthColor[1], self.optionTable.outline.lowHealthColor[2], self.optionTable.outline.lowHealthColor[3])
	elseif self.optionTable.outline.type == 5 then
		self.outline:SetBackdropBorderColor(self.optionTable.outline.aggroColor[1], self.optionTable.outline.aggroColor[2], self.optionTable.outline.aggroColor[3])
	elseif self.optionTable.outline.type == 6 then
		self.outline:SetBackdropBorderColor(self.optionTable.outline.raidIconColor[1], self.optionTable.outline.raidIconColor[2], self.optionTable.outline.raidIconColor[3])
	elseif self.optionTable.outline.type == 7 then
		self.outline:SetBackdropBorderColor(self.optionTable.outline.lowHealthColor2[1], self.optionTable.outline.lowHealthColor2[2], self.optionTable.outline.lowHealthColor2[3])
	else
		self.outline:Hide()
	end
	if self.petButton then
		setupMemberOutline(self.petButton)
	end
end

local function setupMemberDebuffIcon(self)
	if self.optionTable.debuffIconType == 1 then
		for i = 1, 5 do
			self["debuffIcon"..i].color:ClearAllPoints()
			self["debuffIcon"..i].color:SetAllPoints()
			self["debuffIcon"..i].color:Show()
			self["debuffIcon"..i].icon:ClearAllPoints()
			self["debuffIcon"..i].icon:SetPoint("TOPLEFT", 1, -1)
			self["debuffIcon"..i].icon:SetPoint("BOTTOMRIGHT", -1, 1)
			self["debuffIcon"..i].icon:Show()
		end
	elseif self.optionTable.debuffIconType == 2 then
		for i = 1, 5 do
			self["debuffIcon"..i].color:Hide()
			self["debuffIcon"..i].icon:ClearAllPoints()
			self["debuffIcon"..i].icon:SetPoint("TOPLEFT", 1, -1)
			self["debuffIcon"..i].icon:SetPoint("BOTTOMRIGHT", -1, 1)
			self["debuffIcon"..i].icon:Show()
		end
	else
		for i = 1, 5 do
			self["debuffIcon"..i].color:ClearAllPoints()
			self["debuffIcon"..i].color:SetPoint("TOPLEFT", 1, -1)
			self["debuffIcon"..i].color:SetPoint("BOTTOMRIGHT", -1, 1)
			self["debuffIcon"..i].color:Show()
			self["debuffIcon"..i].icon:Hide()
		end
	end
end

local function setupMemberAll(self)
	InvenRaidFrames3Member_SetOptionTable(self, IRF3.db.units)
	self.background:SetColorTexture(IRF3.db.units.backgroundColor[1], IRF3.db.units.backgroundColor[2], IRF3.db.units.backgroundColor[3], IRF3.db.units.backgroundColor[4])
	if self.petButton then
		InvenRaidFrames3Member_SetOptionTable(self.petButton, IRF3.db.units)
		self.petButton.background:SetTexture(IRF3.db.units.backgroundColor[1], IRF3.db.units.backgroundColor[2], IRF3.db.units.backgroundColor[3], IRF3.db.units.backgroundColor[4])
	end
	setupMemberTexture(self)
	setupMemberPowerBar(self)
	setupMemberBarOrientation(self)
	setupMemberOutline(self)
	setupMemberDebuffIcon(self)
	InvenRaidFrames3Member_SetupPowerBarAltPos(self)
	InvenRaidFrames3Member_SetupCastingBarPos(self)
	InvenRaidFrames3Member_SetupIconPos(self)
	InvenRaidFrames3Member_SetAuraFont(self)

	self.name:SetFont(SM:Fetch("font", IRF3.db.font.file), IRF3.db.font.size, IRF3.db.font.attribute)
	self.name:SetShadowColor(0, 0, 0)
	if IRF3.db.font.shadow then
		self.name:SetShadowOffset(1, -1)
	else
		self.name:SetShadowOffset(0, 0)
	end
	self.losttext:SetFont(SM:Fetch("font", IRF3.db.font.file), IRF3.db.font.size, IRF3.db.font.attribute)
	self.losttext:SetShadowColor(0, 0, 0)
	if IRF3.db.font.shadow then
		self.losttext:SetShadowOffset(1, -1)
	else
		self.losttext:SetShadowOffset(0, 0)
	end

	InvenRaidFrames3Member_UpdateAll(self)
end

local function updateHealPredictionBarSize(self)
	self = self:GetParent()
	self.myHealPredictionBar:SetWidth(self.healthBar:GetWidth())
	self.myHealPredictionBar:SetHeight(self.healthBar:GetHeight())
	self.otherHealPredictionBar:SetWidth(self.healthBar:GetWidth())
	self.otherHealPredictionBar:SetHeight(self.healthBar:GetHeight())
	self.absorbPredictionBar:SetWidth(self.healthBar:GetWidth())
	self.absorbPredictionBar:SetHeight(self.healthBar:GetHeight())
end

local function getUnitPetOrOwner(unit)
	if unit then
		if unit == "player" then
			return "pet"
		elseif unit == "vehicle" or unit == "pet" then
			return "player"
		elseif unit:find("pet") then
			return (unit:gsub("pet", ""))
		else
			return (unit:gsub("(%d+)", "pet%1"))
		end
	end
	return nil
end

local function baseOnAttributeChanged(self, key, value)
	if key == "unit" then
		if value then
			key = getUnitPetOrOwner(value)
			self:RegisterUnitEvent("UNIT_NAME_UPDATE", value, key)
			self:RegisterUnitEvent("UNIT_CONNECTION", value, key)
			self:RegisterUnitEvent("UNIT_HEALTH", value, key)
			self:RegisterUnitEvent("UNIT_MAXHEALTH", value, key)
			if IRF3.isClassic then
				self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", value, key)
			else
				self:RegisterUnitEvent("UNIT_HEAL_PREDICTION", value, key)
				self:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", value, key)
			end
			self:RegisterUnitEvent("UNIT_POWER_UPDATE", value, key)
			self:RegisterUnitEvent("UNIT_MAXPOWER", value, key)
			self:RegisterUnitEvent("UNIT_DISPLAYPOWER", value, key)
			self:RegisterUnitEvent("UNIT_POWER_BAR_SHOW", value, key)
			self:RegisterUnitEvent("UNIT_POWER_BAR_HIDE", value, key)
			self:RegisterUnitEvent("UNIT_AURA", value, key)

		else
			self:UnregisterEvent("UNIT_NAME_UPDATE")
			self:UnregisterEvent("UNIT_CONNECTION")
			self:UnregisterEvent("UNIT_HEALTH")
			self:UnregisterEvent("UNIT_MAXHEALTH")
			self:UnregisterEvent("UNIT_HEAL_PREDICTION")
			if IRF3.isClassic then
				self:UnregisterEvent("UNIT_HEALTH_FREQUENT")
			else
				self:UnregisterEvent("UNIT_ABSORB_AMOUNT_CHANGED")
			end
			self:UnregisterEvent("UNIT_POWER_UPDATE")
			self:UnregisterEvent("UNIT_MAXPOWER")
			self:UnregisterEvent("UNIT_DISPLAYPOWER")
			self:UnregisterEvent("UNIT_POWER_BAR_SHOW")
			self:UnregisterEvent("UNIT_POWER_BAR_HIDE")
			self:UnregisterEvent("UNIT_AURA")
		end
	end
end

function InvenRaidFrames3Member_SetOptionTable(self, optionTable)
	self.optionTable = optionTable
end

function InvenRaidFrames3Base_OnLoad(self)
	self:RegisterForClicks("AnyUp")
	self:RegisterForDrag("LeftButton", "RightButton")
	self.timer, self.health, self.maxHealth, self.lostHealth, self.overAbsorb = 0, 0, 1, 0, 0
	InvenRaidFrames3Member_SetOptionTable(self, noOption)
	self.healthBar:SetScript("OnSizeChanged", updateHealPredictionBarSize)
	if not self.petButton then
		setHorizontal(self.myHealPredictionBar)
		setHorizontal(self.otherHealPredictionBar)
		setHorizontal(self.absorbPredictionBar)
	end
	self:SetFrameStrata("MEDIUM")
	self:SetFrameLevel(self:GetParent():GetFrameLevel())
	self:HookScript("OnAttributeChanged", baseOnAttributeChanged)
	
end

local function isPetGroup(self)
	return self:GetParent() == IRF3.petHeader
end

local function memberOnAttributeChanged(self, key, value)
	if key == "unit" then
		if value then
			key = getUnitPetOrOwner(value)
			self:RegisterUnitEvent("READY_CHECK_CONFIRM", value, key)
			self:RegisterUnitEvent("UNIT_THREAT_SITUATION_UPDATE", value, key)
--			self:RegisterUnitEvent("UNIT_THREAT_LIST_UPDATE", value, key)
			self:RegisterUnitEvent("UNIT_ENTERED_VEHICLE", value, key)
			self:RegisterUnitEvent("UNIT_EXITED_VEHICLE", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_START", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_STOP", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_DELAYED", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", value, key)
			self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", value, key)
			self:RegisterUnitEvent("UNIT_FLAGS", value, key)
		else
			self:UnregisterEvent("READY_CHECK_CONFIRM")
			self:UnregisterEvent("UNIT_THREAT_SITUATION_UPDATE")
--			self:UnregisterEvent("UNIT_THREAT_LIST_UPDATE")			
			self:UnregisterEvent("UNIT_ENTERED_VEHICLE")
			self:UnregisterEvent("UNIT_EXITED_VEHICLE")
			self:UnregisterEvent("UNIT_SPELLCAST_START")
			self:UnregisterEvent("UNIT_SPELLCAST_STOP")
			self:UnregisterEvent("UNIT_SPELLCAST_DELAYED")
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START")
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE")
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
			self:UnregisterEvent("UNIT_FLAGS")
		end
	end
end

function InvenRaidFrames3Member_OnLoad(self)
	InvenRaidFrames3Base_OnLoad(self)
	self.UpdateAll = InvenRaidFrames3Member_UpdateAll
	self.Setup = setupMemberAll
	self.SetupTexture = setupMemberTexture
	self.SetupPowerBar = setupMemberPowerBar
	self.SetupBarOrientation = setupMemberBarOrientation
	self.SetupPowerBarAltPos = InvenRaidFrames3Member_SetupPowerBarAltPos
	self.SetupCastingBarPos = InvenRaidFrames3Member_SetupCastingBarPos
	self.SetupIconPos = InvenRaidFrames3Member_SetupIconPos
	self.SetupOutline = setupMemberOutline
	self.SetupDebuffIcon = setupMemberDebuffIcon
	self:SetID(tonumber(self:GetName():match("UnitButton(%d+)$")))
	self:GetParent().members[self:GetID()] = self
	tinsert(UnitPopupMenus, self.dropDown:GetName())-- tinsert(UnitPopupFrames, self.dropDown:GetName()) --8.0
	CompactUnitFrame_SetMenuFunc(self, CompactUnitFrameDropDown_Initialize)
	self.nameTable = {}
	self.name:SetDrawLayer("OVERLAY", 2)
	self.name:Show()
	self.losttext:SetDrawLayer("OVERLAY", 2)
	self.losttext:Show()
	self.readyCheckIcon:SetParent(self.topLevel)
	self.readyCheckIcon:SetDrawLayer("OVERLAY", 6)
	self.readyCheckIcon:ClearAllPoints()
	self.readyCheckIcon:SetPoint("CENTER", 0, 0)
	self.readyCheckIcon:SetSize(24, 24)
	self.roleIcon:SetSize(0.001, 0.001)
	self.roleIcon:SetDrawLayer("OVERLAY", 1)
	self.leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
	self.leaderIcon:SetSize(0.001, 0.001)
	self.leaderIcon:SetDrawLayer("OVERLAY", 1)
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_ROLES_ASSIGNED")
	self:RegisterEvent("PARTY_LEADER_CHANGED")
	self:RegisterEvent("RAID_TARGET_UPDATE")
	self:RegisterEvent("INCOMING_RESURRECT_CHANGED")
	self:RegisterEvent("UNIT_OTHER_PARTY_CHANGED")
	self:RegisterEvent("UNIT_PHASE")
	self:RegisterEvent("UNIT_PET")
	if self:GetParent().index == 0 and self:GetID() == 1 then
		self:RegisterEvent("PLAYER_FLAGS_CHANGED")
	else
		self:RegisterEvent("GROUP_ROSTER_UPDATE")
	end
	self:HookScript("OnAttributeChanged", memberOnAttributeChanged)
end

function InvenRaidFrames3Member_OnShow(self)
	if IRF3.db then		
		self:SetScript("OnEvent", InvenRaidFrames3Member_OnEvent)
		if not self.ticker then
			self.ticker = C_Timer.NewTicker(0.5, function() InvenRaidFrames3Member_OnUpdate(self) end) --전역 타이머 설정
		end
		self:GetParent().visible = self:GetParent().visible + 1
		InvenRaidFrames3Member_UpdateAll(self)
		if isPetGroup(self) then
			self:GetParent().border:SetAlpha(1)
		else
			IRF3:BorderUpdate()
		end
	end
	IRF3.visibleMembers[self] = true
end

function InvenRaidFrames3Member_OnHide(self)
	if IRF3.db then
		self:SetScript("OnEvent", nil)
		if self.ticker then  -- 레이드 프레임이 보이지 않을 때 타이머 변수 삭제
			self.ticker:Cancel()
			self.ticker = nil
		end
		if self.survivalticker then -- 플레이어가 보이지 않을 때 타이머 변수 삭제
			self.survivalticker:Cancel()
			self.survivalticker = nil
		end
		if self.castingBar.ticker then  --캐스팅 바 타이머 작동 중 파탈 또는 파티 해체 시 타이머 변수 삭제
			self.castingBar.ticker:Cancel()
			self.castingBar.ticker = nil
		end
		if self.bossAura.ticker then --  대상 플레이어가 보이지 않을 때 오라 타이머 삭제
			self.bossAura.ticker:Cancel()
			self.bossAura.ticker = nil
		end
		if self.spellticker then
			self.spellticker:Cancel()
			self.spellticker = nil
		end
		if self.fadeticker then
			self.fadeticker:Cancel()
			self.fadeticker = nil
		end
		self:GetParent().visible = self:GetParent().visible - 1
		InvenRaidFrames3Member_OnDragStop(self)
		if isPetGroup(self) then
			self:GetParent().border:SetAlpha(self:GetParent().visible > 0 and 1 or 0)
		else
			IRF3:BorderUpdate()
		end
		table.wipe(self.nameTable)
		self.lostHealth, self.overAbsorb, self.hasAggro, self.isOffline, self.isAFK, self.color, self.class = 0, 0, nil, nil, nil, nil
		self.unit, self.displayedUnit = nil, nil
	end
	IRF3.visibleMembers[self] = nil
	IRF3:CallbackClearObject(self)
end

-- 
--타이머 작동 중 파티 탈퇴 또는 파티 해체 시 각 플레이어에게 할당된 주문 타이머 변수 삭제
function InvenRaidFrames3Member_OnSpellTimerHide(self)
	if self.spellticker then
		self.spellticker:Cancel()
		self.spellticker = nil
	end
	if self.fadeticker then
		self.fadeticker:Cancel()
		self.fadeticker = nil
	end
end

function InvenRaidFrames3Member_OnDebuffHide(self)
	if self.spellticker then
		self.spellticker:Cancel()
		self.spellticker = nil
	end
	if self.debuffFadeticker then
		self.debuffFadeticker:Cancel()
		self.debuffFadeticker = nil
	end
end

function InvenRaidFrames3Member_OnEnter(self)
	IRF3.onEnter = self
	self.highlight:SetAlpha(IRF3.db.highlightAlpha)
	self.highlight:Show()
	
	if self.displayedUnit and IRF3.tootipState then
		GameTooltip_SetDefaultAnchor(GameTooltip, self)
		GameTooltip:SetUnit(self.displayedUnit)
		GameTooltipTextLeft1:SetTextColor(GameTooltip_UnitColor(self.displayedUnit))
	else
		GameTooltip:Hide()
	end
	
end

function InvenRaidFrames3Member_OnLeave(self)
	IRF3.onEnter = nil
	self.highlight:Hide()
	
	GameTooltip:Hide()
	
end

function InvenRaidFrames3Member_OnDragStart(self)
	if IRF3.db.lockAlt and IsAltKeyDown() or not IRF3.db.lock then
		IRF3.dragging = self
		if isPetGroup(self) or self:GetParent() == InvenRaidFrames3PreviewPet then
			IRF3.petHeader:StartMoving()
		else
			IRF3:StartMoving()
		end
		
		
		
		
		
		
		
	end
end

function InvenRaidFrames3Member_OnDragStop(self)
	if not IsAltKeyDown() or IRF3.dragging then
		IRF3.dragging = nil
		if SetUserPlaced then
			IRF3:SetUserPlaced(nil)
		end
		IRF3:StopMovingOrSizing()
		if SetUserPlaced then
			IRF3.petHeader:SetUserPlaced(nil)
		end
		IRF3.petHeader:StopMovingOrSizing()
		IRF3:SavePosition()
	end
end

function InvenRaidFrames3Member_UpdateHealth(self)
	local health = UnitHealth(self.displayedUnit)
	local maxhealth = UnitHealthMax(self.displayedUnit)
	self.healthBar:SetValue(health)
	self.health = health
	self.maxHealth = maxhealth
	self.lostHealth = maxhealth - health
	self.healthBar:SetMinMaxValues(0, maxhealth)
	self.myHealPredictionBar:SetMinMaxValues(0, maxhealth)
	self.otherHealPredictionBar:SetMinMaxValues(0, maxhealth)
	self.absorbPredictionBar:SetMinMaxValues(0, maxhealth)
end

local function InvenRaidFrames3Member_GetDisplayedPowerID(self)
--	local barType, minPower, startInset, endInset, smooth, hideFromOthers, showOnRaid, opaqueSpark, opaqueFlash, powerName, powerTooltip = UnitAlternatePowerInfo(self.displayedUnit)
	local showOnRaid = false
	
	if not GetUnitPowerBarInfo then	-- classic
		return (UnitPowerType(self.displayedUnit))
	end

	local barInfo = GetUnitPowerBarInfo(self.displayedUnit);
	if barInfo and barInfo.showOnRaid then
		showOnRaid = barInfo.showOnRaid;
	end

	if ( showOnRaid and (UnitInParty(self.unit) or UnitInRaid(self.unit)) ) then
		return ALTERNATE_POWER_INDEX
	else
		return (UnitPowerType(self.displayedUnit))
	end
end

function InvenRaidFrames3Member_UpdateMaxPower(self)
	self.powerBar:SetMinMaxValues(0, UnitPowerMax(self.displayedUnit, InvenRaidFrames3Member_GetDisplayedPowerID(self)))
end

function InvenRaidFrames3Member_UpdatePower(self)
	self.powerBar:SetValue(UnitPower(self.displayedUnit, InvenRaidFrames3Member_GetDisplayedPowerID(self)))
end

function InvenRaidFrames3Member_UpdateHealPrediction(self)
	if IRF3.isClassic then
		InvenRaidFrames3Member_UpdateHealPredictionClassic(self)
		return
	end
	if self.optionTable.displayHealPrediction and not UnitIsDeadOrGhost(self.displayedUnit) then
		local myIncomingHeal = UnitGetIncomingHeals(self.displayedUnit, "player") or 0
		local allIncomingHeal = UnitGetIncomingHeals(self.displayedUnit) or 0
		local otherIncomingHeal = allIncomingHeal - myIncomingHeal
		local totalAbsorb = UnitGetTotalAbsorbs and UnitGetTotalAbsorbs(self.displayedUnit) or 0
		local totalPrediction = allIncomingHeal + totalAbsorb
		local health = self.health
		local maxhealth = self.maxHealth
		local lost = self.lostHealth
		if self.healIcon then
			if self.optionTable.healIcon and myIncomingHeal > 0 then
				self.healIcon:SetVertexColor(self.optionTable.myHealPredictionColor[1], self.optionTable.myHealPredictionColor[2], self.optionTable.myHealPredictionColor[3])
				self.healIcon:SetSize(self.optionTable.healIconSize, self.optionTable.healIconSize)
				self.healIcon:Show()
			elseif self.optionTable.healIconOther and otherIncomingHeal > 0 then
				self.healIcon:SetVertexColor(self.optionTable.otherHealPredictionColor[1], self.optionTable.otherHealPredictionColor[2], self.optionTable.otherHealPredictionColor[3])
				self.healIcon:SetSize(self.optionTable.healIconSize, self.optionTable.healIconSize)
				self.healIcon:Show()
			elseif self.healIcon and self.healIcon:IsShown() then
				self.healIcon:SetSize(0.001, 0.001)
				self.healIcon:Hide()
			end
		end
		if lost > 0 then
			if myIncomingHeal > 0 then
				local value = min(maxhealth, health + myIncomingHeal)
				self.myHealPredictionBar:SetValue(value)
				self.myHealPredictionBar:Show()
			else
				self.myHealPredictionBar:Hide()
			end
			if otherIncomingHeal > 0 then
				local value = min(maxhealth, health + allIncomingHeal)
				self.otherHealPredictionBar:SetValue(value)
				self.otherHealPredictionBar:Show()
			else
				self.otherHealPredictionBar:Hide()
			end
			if totalAbsorb > 0 then
				local value = min(maxhealth, health + totalPrediction)
				self.absorbPredictionBar:SetValue(value)
				self.absorbPredictionBar:Show()
			else
				self.absorbPredictionBar:Hide()
			end
			self.overAbsorbGlow:Hide()
		else
			if totalAbsorb > 0 and totalPrediction >= lost then
				self.overAbsorbGlow:Show()
				self.overAbsorb = totalAbsorb
			else
				self.overAbsorbGlow:Hide()
				self.overAbsorb = 0
			end
			self.myHealPredictionBar:Hide()
			self.otherHealPredictionBar:Hide()
			self.absorbPredictionBar:Hide()
		end
	else
		if self.healIcon and self.healIcon:IsShown() then
			self.healIcon:SetSize(0.001, 0.001)
			self.healIcon:Hide()
		end
		self.overAbsorbGlow:Hide()
		self.myHealPredictionBar:Hide()
		self.otherHealPredictionBar:Hide()
		self.absorbPredictionBar:Hide()
	end
end

function InvenRaidFrames3Member_UpdateHealPredictionClassic(self)
	--	if  not libCHC then
	if not self.optionTable.displayHealPrediction   then
		if self.healIcon and self.healIcon:IsShown() then
			self.healIcon:SetSize(0.001, 0.001)
			self.healIcon:Hide()
		end
		self.myHealPredictionBar:Hide()
		self.otherHealPredictionBar:Hide()
		self.absorbPredictionBar:Hide()	
		self.overAbsorbGlow:Hide()	
		return
	end

	if self.optionTable.displayHealPrediction and not UnitIsDeadOrGhost(self.displayedUnit) then
		local myGUID = UnitGUID("player")
		local targetGUID = UnitGUID(self.displayedUnit)
		local allIncomingHeal,allOverTimeHeal,myIncomingHeal ,otherIncomingHeal ,myOverTimeHeal ,otherOverTimeHeal,totalAbsorb ,totalPrediction  
		----HealComm : HOT 구분
		if IRF3.libCHC then
			allIncomingHeal = (IRF3.libCHC:GetHealAmount(targetGUID, IRF3.libCHC.ALL_HEALS, nil, nil) or 0) * (IRF3.libCHC:GetHealModifier(targetGUID) or 1)
			allOverTimeHeal = (IRF3.libCHC:GetHealAmount(targetGUID, IRF3.libCHC.OVERTIME_AND_BOMB_HEALS, nil, nil) or 0) * (IRF3.libCHC:GetHealModifier(targetGUID) or 1)
			myIncomingHeal = IRF3.libCHC:GetHealAmount(targetGUID, IRF3.libCHC.CASTED_HEALS, nil, myGUID) or 0 --my Direct
			otherIncomingHeal = IRF3.libCHC:GetOthersHealAmount(targetGUID, IRF3.libCHC.CASTED_HEALS, nil) or 0 --other direct
			myOverTimeHeal = IRF3.libCHC:GetHealAmount(targetGUID, IRF3.libCHC.OVERTIME_AND_BOMB_HEALS, nil, myGUID) or 0 --myHOT
			otherOverTimeHeal = IRF3.libCHC:GetOthersHealAmount(targetGUID, IRF3.libCHC.OVERTIME_AND_BOMB_HEALS, nil) or 0 --otherHoT
		else --자체 함수 사용
			myIncomingHeal = UnitGetIncomingHeals(self.displayedUnit, "player") or 0
			allIncomingHeal = UnitGetIncomingHeals(self.displayedUnit) or 0
			otherIncomingHeal = allIncomingHeal - myIncomingHeal
			allOverTimeHeal = 0 --자체함수로 클래식에서 HoT인식안됨
			myOverTimeHeal = 0--자체함수로 클래식에서 HoT인식안됨
			otherOverTimeHeal = 0--자체함수로 클래식에서 HoT인식안됨
		end
		totalAbsorb = 0 --클래식에선 보호막 api없어서 막아둠

		local health = UnitHealth(self.displayedUnit)
		local maxhealth = UnitHealthMax(self.displayedUnit)
		local lost = maxhealth - health
--Heal 아이콘
		if self.healIcon then
			if self.optionTable.healIcon and (myIncomingHeal or 0) > 0 then
				self.healIcon:SetVertexColor(self.optionTable.myHealPredictionColor[1], self.optionTable.myHealPredictionColor[2], self.optionTable.myHealPredictionColor[3])
				self.healIcon:SetSize(self.optionTable.healIconSize, self.optionTable.healIconSize)
				self.healIcon:Show()
			elseif self.optionTable.healIconOther and (otherIncomingHeal or 0)  > 0 then
				self.healIcon:SetVertexColor(self.optionTable.otherHealPredictionColor[1], self.optionTable.otherHealPredictionColor[2], self.optionTable.otherHealPredictionColor[3])
				self.healIcon:SetSize(self.optionTable.healIconSize, self.optionTable.healIconSize)
				self.healIcon:Show()
			elseif self.healIcon and self.healIcon:IsShown() then
				self.healIcon:SetSize(0.001, 0.001)
				self.healIcon:Hide()
			end
		end
--		
		if lost > 0 then
			--바길이/높이 계산을 위한 우선순위
			--(1)myIncomingHeal : 바길이(높이) = health+myIncomingHeal
			--(2)otherIncomingHeal : 바길이(높이) =  health + myIncomingHeal+otherIncomingHeal
			--(3)myOverTimeHeal : 바길이(높이) = health + myIncomingHeal+otherIncomingHeal + myOverTimeHeal
			--(4)otherOverTimeHeal : 바길이(높이) = health + myIncomingHeal+otherIncomingHeal + myOverTimeHeal+otherOverTimeHeal
			local varvalue
			myIncomingHeal = myIncomingHeal or 0
			otherIncomingHeal = otherIncomingHeal or 0
			myOverTimeHeal = myOverTimeHeal or 0
			otherOverTimeHeal = otherOverTimeHeal or 0
			totalAbsorb = totalAbsorb or 0
			if myIncomingHeal > 0 or myOverTimeHeal then
				varvalue = min(maxhealth*2, health + myIncomingHeal + otherIncomingHeal + myOverTimeHeal)
				self.myHealPredictionBar:SetValue(varvalue)
				self.myHealPredictionBar:Show()
			else
				self.myHealPredictionBar:Hide()
			end
			
			if otherIncomingHeal > 0 or otherOverTimeHeal then
				varvalue = min(maxhealth*2, health + myIncomingHeal + otherIncomingHeal + myOverTimeHeal + otherOverTimeHeal)
				self.otherHealPredictionBar:SetValue(varvalue)
				self.otherHealPredictionBar:Show()
			else
				self.otherHealPredictionBar:Hide()
			end

			if totalAbsorb > 0 then
				--lost가 있고 보호막이 있을 경우 
				varvalue = min(maxhealth, health + totalPrediction)
				self.absorbPredictionBar:SetValue(varvalue)
				self.absorbPredictionBar:Show()
			else
				--lost가 있고 보호막이 없을 경우
				self.absorbPredictionBar:Hide()
			end
			self.overAbsorbGlow:Hide()

		else 
--lost가 없고(만피) 보호막이 있을 경우는 glow
	 			if totalAbsorb > 0 and totalPrediction >= lost then
	 				self.overAbsorbGlow:Show()
	 				self.overAbsorb = totalAbsorb

	 			else
 --lost가 없고(만피) 보호막이 없을 경우
	 				self.overAbsorbGlow:Hide()
	 				self.overAbsorb = 0
	 			end

			self.myHealPredictionBar:Hide()
			self.otherHealPredictionBar:Hide()
			self.absorbPredictionBar:Hide()
			self.overAbsorbGlow:Hide()
		end

	else--예측힐을 사용하지않거나 죽은 경우에는 다 hide
		if self.healIcon and self.healIcon:IsShown() then
			self.healIcon:SetSize(0.001, 0.001)
			self.healIcon:Hide()
		end

		self.myHealPredictionBar:Hide()
		self.otherHealPredictionBar:Hide()
		self.absorbPredictionBar:Hide()
		self.overAbsorbGlow:Hide()
	end
end

local colorR, colorG, colorB

function InvenRaidFrames3Member_UpdateState(self)
	_, self.class = UnitClass(self.displayedUnit)
	if UnitIsConnected(self.unit) then
		self.isOffline = nil
		if UnitIsGhost(self.displayedUnit) then
			self.isGhost = true
		elseif UnitIsDead(self.displayedUnit) then
			self.isDead = true
		elseif UnitIsAFK(self.unit) then
			self.isAFK = true
		else
			self.isGhost, self.isOffline, self.isDead, self.isAFK = nil, nil, nil, nil
		end
		if self.isGhost or self.isDead then
			colorR, colorG, colorB = IRF3.db.colors.offline[1], IRF3.db.colors.offline[2], IRF3.db.colors.offline[3]
		elseif self.optionTable.useHarm and UnitCanAttack(self.displayedUnit, "player") then
			colorR, colorG, colorB = IRF3.db.colors.harm[1], IRF3.db.colors.harm[2], IRF3.db.colors.harm[3]
		elseif self.dispelType and IRF3.db.colors[self.dispelType] and self.optionTable.useDispelColor then
		
		
			colorR, colorG, colorB = IRF3.db.colors[self.dispelType][1], IRF3.db.colors[self.dispelType][2], IRF3.db.colors[self.dispelType][3]
			
			
		elseif self.displayedUnit:find("pet") then
			if self.petButton then
				colorR, colorG, colorB = IRF3.db.colors.vehicle[1], IRF3.db.colors.vehicle[2], IRF3.db.colors.vehicle[3]
			else
				colorR, colorG, colorB = IRF3.db.colors.pet[1], IRF3.db.colors.pet[2], IRF3.db.colors.pet[3]
			end
		elseif IRF3.db.units.fadeOutColorFlag then	
			-- 거리 측정 로직
			local prevRange = self.outRange
			if self.isOffline then
				self.outRange = false
			else
				local inRange, checkedRange = UnitInRange(self.displayedUnit)
				self.outRange = checkedRange and not inRange
			end
			-- 거리 측정을 해보니 거리가 바뀌었다면
			if prevRange ~= self.outRange or self.outRange then
				colorR, colorG, colorB = IRF3.db.units.fadeOutColor[1], IRF3.db.units.fadeOutColor[2], IRF3.db.units.fadeOutColor[3]
			elseif self.optionTable.useClassColors and IRF3.db.colors[self.class] then
				colorR, colorG, colorB = IRF3.db.colors[self.class][1], IRF3.db.colors[self.class][2], IRF3.db.colors[self.class][3]
			else
				colorR, colorG, colorB = IRF3.db.colors.help[1], IRF3.db.colors.help[2], IRF3.db.colors.help[3]
			end
		elseif self.optionTable.useClassColors and IRF3.db.colors[self.class] then
			colorR, colorG, colorB = IRF3.db.colors[self.class][1], IRF3.db.colors[self.class][2], IRF3.db.colors[self.class][3]
		else
			colorR, colorG, colorB = IRF3.db.colors.help[1], IRF3.db.colors.help[2], IRF3.db.colors.help[3]
		end
	else
		self.isOffline, self.isGhost, self.isDead, self.isAFK = true, nil, nil, nil
		colorR, colorG, colorB = IRF3.db.colors.offline[1], IRF3.db.colors.offline[2], IRF3.db.colors.offline[3]
	end
	self.healthBar:SetStatusBarColor(colorR, colorG, colorB)
	colorR, colorG, colorB = nil
end

local altR, altG, altB

function InvenRaidFrames3Member_UpdatePowerColor(self)

	local showOnRaid = false
	
	if GetUnitPowerBarInfo then
		local barInfo = GetUnitPowerBarInfo(self.displayedUnit);
		if barInfo and barInfo.showOnRaid then
			showOnRaid = barInfo.showOnRaid;
		end
	end

	if self.isOffline then
		colorR, colorG, colorB = IRF3.db.colors.offline[1], IRF3.db.colors.offline[2], IRF3.db.colors.offline[3]
	elseif showOnRaid then
		colorR, colorG, colorB = 0.7, 0.7, 0.6
	else
		colorR, colorG, altR, altG, altB = UnitPowerType(self.displayedUnit)
		if IRF3.db.colors[colorG] then
			colorR, colorG, colorB = IRF3.db.colors[colorG][1], IRF3.db.colors[colorG][2], IRF3.db.colors[colorG][3]
		elseif PowerBarColor[colorR] then
			colorR, colorG, colorB = PowerBarColor[colorR].r, PowerBarColor[colorR].g, PowerBarColor[colorR].b
		elseif altR then
			colorR, colorG, colorB = altR, altG, altB
		else
			colorR, colorG, colorB = PowerBarColor[0].r, PowerBarColor[0].g, PowerBarColor[0].b
		end
	end
	self.powerBar:SetStatusBarColor(colorR, colorG, colorB)
	colorR, colorG, colorB, altR, altG, altB = nil
end

local roleType

function InvenRaidFrames3Member_UpdateRoleIcon(self)
	if self.optionTable.displayRaidRoleIcon then
		roleType = UnitGroupRolesAssigned(self.unit)
-- Torghast fix
		if roleType == "NONE" then
			local playerClass = select(2, UnitClass(self.unit))	-- "WARRIOR", "DRUID", "PALADIN", "DEATHKNIGHT", "PRIEST", "SHAMAN", "ROGUE", "MAGE", "WARLOCK", "HUNTER", "MONK", "DEMONHUNTER", "EVOKER"		
			if playerClass == "WARLOCK" or playerClass == "MAGE" or playerClass == "ROGUE" or playerClass == "HUNTER" then
				roleType = "DAMAGER"
			else
				if IRF3.prevRole and IRF3.prevRole[UnitName(self.unit)] then	-- torghast None. 토르가스트로 넘어갔을때 같은사람이면 기존 정보로 계속 표시.
					roleType = IRF3.prevRole[UnitName(self.unit)]
				end
			end
		end
-- Torghast fix
		if roleType ~= "NONE" then
			if self.optionTable.roleIcontype == 1 then
				if roleType == "DAMAGER" then
					self.roleIcon:SetTexture("Interface\\AddOns\\InvenRaidFrames3\\Texture\\dps")
					self.roleIcon:SetTexCoord(0, 1, 0, 1)
				else
					self.roleIcon:SetTexture("Interface\\AddOns\\InvenRaidFrames3\\Texture\\RoleIcon_MiirGui")
					if GetTexCoordsForRoleSmallCircle then
						self.roleIcon:SetTexCoord(GetTexCoordsForRoleSmallCircle(roleType))
					else
						self.roleIcon:SetTexCoord(GetTexCoordsForRole(roleType))
						self.roleIcon:SetTexCoord(0, 1, 0, 1)
					end
				end
			else
				self.roleIcon:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES")
				if GetTexCoordsForRoleSmallCircle then
					self.roleIcon:SetTexCoord(GetTexCoordsForRoleSmallCircle(roleType))
				else
					local left, top, right, bottom = GetTexCoordsForRole(roleType);
					self.roleIcon:SetTexCoord(left * 1.146, top * 1.146, right * 1.146, bottom * 1.30) -- DAMAGER
				end
			end
			self.roleIcon:SetSize(self.optionTable.roleIconSize, self.optionTable.roleIconSize)
-- Torghast fix
			IRF3.prevRole[UnitName(self.unit)] = roleType	-- add. torghast
-- Torghast fix
			if self.optionTable.hideDamagerIcon and roleType == "DAMAGER" then
				self.roleIcon:SetSize(0.001, 0.001)
				return self.roleIcon:Hide()
			else
				return self.roleIcon:Show()
			end
		end
	end
	self.roleIcon:SetSize(0.001, 0.001)
	self.roleIcon:Hide()
end

local LeaderFlag

function InvenRaidFrames3Member_UpdateLeaderIcon(self)
	if self.optionTable.useLeaderIcon then
		LeaderFlag = UnitIsGroupLeader(self.unit)
		if LeaderFlag then
			self.leaderIcon:SetTexCoord(0, 1, 0, 1)
			self.leaderIcon:SetSize(self.optionTable.leaderIconSize, self.optionTable.leaderIconSize)
			return self.leaderIcon:Show()
		end
	end
	self.leaderIcon:SetSize(0.001, 0.001)
	self.leaderIcon:Hide()
end

if not UnitInPhase then	-- classic
	UnitInPhase = function(unit)
		--if UnitPhaseReason("player") == UnitPhaseReason(unit) then
		if UnitPhaseReason(unit) == nil then
			return true
		end
		return false
	end
end
--copied from bliz source.
function InvenRaidFrames3Member_UpdateCenterStatusIcon(self)
	if not self.centerStatusIcon then return end
	if self.optionTable.centerStatusIcon and UnitInOtherParty(self.unit) then
		self.centerStatusIcon.texture:SetTexture("Interface\\LFGFrame\\LFG-Eye")
		self.centerStatusIcon.texture:SetTexCoord(0.125, 0.25, 0.25, 0.5)
		self.centerStatusIcon.border:SetTexture("Interface\\Common\\RingBorder")
		self.centerStatusIcon.border:Show()
		self.centerStatusIcon.tooltip = PARTY_IN_PUBLIC_GROUP_MESSAGE
		self.centerStatusIcon:Show()
	elseif self.optionTable.centerStatusIcon and UnitHasIncomingResurrection(self.unit) then
		self.centerStatusIcon.texture:SetTexture("Interface\\RaidFrame\\Raid-Icon-Rez")
		self.centerStatusIcon.texture:SetTexCoord(0, 1, 0, 1)
		self.centerStatusIcon.border:Hide()
		self.centerStatusIcon.tooltip = nil
		self.centerStatusIcon:Show()
		self.resurrectStart = GetTime() * 1000
	elseif self.optionTable.centerStatusIcon and self.inDistance and not UnitInPhase(self.unit) then
		self.centerStatusIcon.texture:SetTexture("Interface\\TargetingFrame\\UI-PhasingIcon")
		self.centerStatusIcon.texture:SetTexCoord(0.15625, 0.84375, 0.15625, 0.84375)
		self.centerStatusIcon.border:Hide()
		self.centerStatusIcon.tooltip = PARTY_PHASED_MESSAGE
		self.centerStatusIcon:Show()
	else
		self.centerStatusIcon:Hide()
	end
	InvenRaidFrames3Member_UpdateResurrection(self)
end

local tooltipUpdate = 0
function InvenRaidFrames3Member_CenterStatusIconOnUpdate(self, elapsed)

	if not IRF3.tootipState then return end
	tooltipUpdate = tooltipUpdate + elapsed
	if tooltipUpdate > 0.1 then
		tooltipUpdate = 0
		if self:IsMouseOver() and self.tooltip then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, true)
			GameTooltip:Show()
		elseif GameTooltip:IsOwned(self) then
			GameTooltip:Hide()
		end
	end
	
end

function InvenRaidFrames3Member_CenterStatusIconOnHide(self)

	if GameTooltip:IsOwned(self) then
		GameTooltip:Hide()
	end
	
end

function InvenRaidFrames3Member_UpdateOutline(self)
	if self.optionTable.outline.type == 1 then
		if self.dispelType and IRF3.db.colors[self.dispelType] then
			self.outline:SetBackdropBorderColor(IRF3.db.colors[self.dispelType][1], IRF3.db.colors[self.dispelType][2], IRF3.db.colors[self.dispelType][3])
			return self.outline:Show()
		end
	elseif self.optionTable.outline.type == 2 then
		if UnitIsUnit(self.displayedUnit, "target") then
			return self.outline:Show()
		end
	elseif self.optionTable.outline.type == 3 then
		if UnitIsUnit(self.displayedUnit, "mouseover") then
			return self.outline:Show()
		end
	elseif self.optionTable.outline.type == 4 then
		if not UnitIsDeadOrGhost(self.displayedUnit) and (self.health / self.maxHealth) <= self.optionTable.outline.lowHealth then
			return self.outline:Show()
		end
	elseif self.optionTable.outline.type == 5 then
		if self.hasAggro then
			return self.outline:Show()
		end
	elseif self.optionTable.outline.type == 6 then
		if self and self.displayedUnit and self.optionTable.outline.raidIcon[GetRaidTargetIndex(self.displayedUnit)] then
			return self.outline:Show()
		end
	elseif self and self.displayedUnit and self.optionTable.outline.type == 7 then
		if not UnitIsDeadOrGhost(self.displayedUnit) and self.maxHealth >= self.optionTable.outline.lowHealth2 and self.health < self.optionTable.outline.lowHealth2 then
			return self.outline:Show()
		end
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	self.outline:Hide()
end

--- 타이머에서 지속적으로 체크하는 거리 측정 함수
function InvenRaidFrames3Member_OnUpdate(self)
	-- 거리 측정 로직
	local prevRange = self.outRange
	if self.isOffline then
		self.outRange = false
	else
		local inRange, checkedRange = UnitInRange(self.displayedUnit)
		self.outRange = checkedRange and not inRange
	end
	-- 거리 측정을 해보니 거리가 바뀌었다면
	if prevRange ~= self.outRange then
		if self.outRange then  --시야 바깥일때는 체력바 업데이트 중지
			self.healthBar:SetAlpha(self.optionTable.fadeOutOfRangeHealth and self.optionTable.fadeOutAlpha or 1)
			self.powerBar:SetAlpha(self.optionTable.fadeOutOfRangePower and self.optionTable.fadeOutAlpha or 1)
			self.myHealPredictionBar:SetAlpha(0)
			self.otherHealPredictionBar:SetAlpha(0)
			self.absorbPredictionBar:SetAlpha(0)
		else --시야 안쪽일때 체력 바랑 기력 바 업데이트 시작
			self.healthBar:SetAlpha(1)
			self.powerBar:SetAlpha(1)
			self.myHealPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
			self.otherHealPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
			self.absorbPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
			InvenRaidFrames3Member_UpdateHealth(self)
			InvenRaidFrames3Member_UpdateMaxPower(self)
			InvenRaidFrames3Member_UpdatePower(self)
			InvenRaidFrames3Member_UpdatePowerColor(self)
		end
			--위치 변경이 될때마다 업데이트 할 항목
		InvenRaidFrames3Member_UpdateBuffs(self)
		InvenRaidFrames3Member_UpdateAura(self)
		InvenRaidFrames3Member_UpdateSpellTimer(self)
 		InvenRaidFrames3Member_UpdateSurvivalSkill(self)
 		InvenRaidFrames3Member_UpdateHealPrediction(self)
 		InvenRaidFrames3Member_UpdateState(self)
 		InvenRaidFrames3Member_UpdateNameColor(self)
 		InvenRaidFrames3Member_UpdateDisplayText(self)
 		InvenRaidFrames3Member_UpdateRaidIconTarget(self)
	end
	--거리 측정과 상관없이 타이머에서 지속적으로 갱신할 것들 (많이 추가하면 CPU 점유율 급증할 위험 있음)
	InvenRaidFrames3Member_UpdateState(self)
 	InvenRaidFrames3Member_UpdateRaidIconTarget(self)
	-- 위상 업데이트
	local distance, checkedDistance = UnitDistanceSquared(self.displayedUnit)	-- 패치 7.1.0 (2016-10-25): 제한된 영역(인스턴스/전장/투기장) 안에 있는 동안 nil을 반환합니다.
	if checkedDistance then
		local inDistance = distance < 250*250
		if inDistance ~= self.inDistance then
			self.inDistance = inDistance
			InvenRaidFrames3Member_UpdateCenterStatusIcon(self)
		end
	end
end

--- 타이머에서 지속적으로 체크하지 않는 거리 측정 함수
function InvenRaidFrames3Member_OnUpdate2(self)
	if self.isOffline then
		self.outRange = false
	else
		local inRange, checkedRange = UnitInRange(self.displayedUnit)
		self.outRange = checkedRange and not inRange
	end
	if self.outRange then
		self.healthBar:SetAlpha(self.optionTable.fadeOutOfRangeHealth and self.optionTable.fadeOutAlpha or 1)
		self.powerBar:SetAlpha(self.optionTable.fadeOutOfRangePower and self.optionTable.fadeOutAlpha or 1)
		self.myHealPredictionBar:SetAlpha(0)
		self.otherHealPredictionBar:SetAlpha(0)
		self.absorbPredictionBar:SetAlpha(0)
	else
		self.healthBar:SetAlpha(1)
		self.powerBar:SetAlpha(1)
		self.myHealPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
		self.otherHealPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
		self.absorbPredictionBar:SetAlpha(IRF3.db.units.healPredictionAlpha)
	end
end

function InvenRaidFrames3Member_OnEvent(self, event, ...)
	eventHandler[event](self, ...)
end

-- 대부분의 인자를 즉시 업데이트 함
function InvenRaidFrames3Member_UpdateAll(self)
	if IRF3.db then
		InvenRaidFrames3Member_UpdatePlayerAurasFull(self)
		InvenRaidFrames3Member_UpdateInVehicle(self)
		if UnitExists(self.displayedUnit or "") then
			InvenRaidFrames3Member_UpdateName(self)
			InvenRaidFrames3Member_UpdateState(self)
			InvenRaidFrames3Member_UpdateNameColor(self)
			InvenRaidFrames3Member_UpdateHealth(self)
			InvenRaidFrames3Member_UpdateHealPrediction(self)
			InvenRaidFrames3Member_UpdateMaxPower(self)
			InvenRaidFrames3Member_UpdatePower(self)
			InvenRaidFrames3Member_UpdatePowerColor(self)
			InvenRaidFrames3Member_UpdateCastingBar(self)
			InvenRaidFrames3Member_UpdatePowerBarAlt(self)
			InvenRaidFrames3Member_UpdateThreat(self)
			InvenRaidFrames3Member_UpdateRoleIcon(self)
			InvenRaidFrames3Member_UpdateLeaderIcon(self)
			InvenRaidFrames3Member_UpdateRaidIcon(self)
			InvenRaidFrames3Member_UpdateBuffs(self)
			InvenRaidFrames3Member_UpdateAura(self)
			InvenRaidFrames3Member_UpdateSpellTimer(self)
			InvenRaidFrames3Member_UpdateSurvivalSkill(self)
			InvenRaidFrames3Member_UpdateOutline(self)
			InvenRaidFrames3Member_OnUpdate2(self)
			InvenRaidFrames3Member_UpdateRaidIconTarget(self)
			InvenRaidFrames3Member_UpdateDisplayText(self)
			InvenRaidFrames3Member_UpdateCenterStatusIcon(self)
		end
	end
end

function InvenRaidFrames3Member_UpdateInVehicle(self)
	self.unit = SecureButton_GetUnit(self)
	self.displayedUnit = self.unit and (SecureButton_GetModifiedUnit(self) or self.unit) or nil
	if self.petButton then
		if UnitExists(SecureButton_GetModifiedUnit(self.petButton) or "") then
			InvenRaidFrames3Pet_OnShow(self.petButton)
		else
			InvenRaidFrames3Pet_OnHide(self.petButton)
		end
	end
	if IRF3.onEnter == self then
		InvenRaidFrames3Member_OnEnter(self)
	end
end

function InvenRaidFrames3Member_OnAttributeChanged(self, name, value)
	if name == "unit" then
		InvenRaidFrames3Member_UpdateAll(self)
	end
end

-- 이벤트가 발생하면 해당 함수를 실행하도록 함
eventHandler.PLAYER_ENTERING_WORLD = InvenRaidFrames3Member_UpdateAll
eventHandler.GROUP_ROSTER_UPDATE = InvenRaidFrames3Member_UpdateAll
eventHandler.PLAYER_ROLES_ASSIGNED = InvenRaidFrames3Member_UpdateRoleIcon
eventHandler.PARTY_LEADER_CHANGED = InvenRaidFrames3Member_UpdateLeaderIcon
eventHandler.RAID_TARGET_UPDATE = function(self)
	InvenRaidFrames3Member_UpdateRaidIcon(self)
	if self.optionTable.outline.type == 6 then
		InvenRaidFrames3Member_UpdateOutline(self)
	end
end
eventHandler.UNIT_NAME_UPDATE = function(self, unit)
	if (unit == self.unit or unit == self.displayedUnit) then
		InvenRaidFrames3Member_UpdateName(self)
		InvenRaidFrames3Member_UpdateNameColor(self)
		InvenRaidFrames3Member_UpdateDisplayText(self)
	end
end
eventHandler.UNIT_CONNECTION = function(self, unit)
	if (unit == self.unit or unit == self.displayedUnit) then
		InvenRaidFrames3Member_UpdateName(self)
		InvenRaidFrames3Member_UpdateNameColor(self)
		InvenRaidFrames3Member_UpdateDisplayText(self)
		InvenRaidFrames3Member_UpdatePowerColor(self)
	end
end
eventHandler.UNIT_FLAGS = function(self, unit)
	if (unit == self.unit or unit == self.displayedUnit) then
		InvenRaidFrames3Member_UpdateHealth(self)
		InvenRaidFrames3Member_UpdateLostHealth(self)
		InvenRaidFrames3Member_UpdateState(self)
		InvenRaidFrames3Member_UpdateNameColor(self)
		InvenRaidFrames3Member_UpdateDisplayText(self)
		InvenRaidFrames3Member_UpdateBuffs(self)	-- 공대 버프 갱신
	end
end
eventHandler.PLAYER_FLAGS_CHANGED = eventHandler.UNIT_FLAGS
eventHandler.UNIT_HEALTH = function(self, unit)
	if unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateHealth(self)
		InvenRaidFrames3Member_UpdateLostHealth(self)
		InvenRaidFrames3Member_UpdateHealPrediction(self)
		InvenRaidFrames3Member_UpdateState(self)
		if self.optionTable.outline.type == 4 or self.optionTable.outline.type == 7 then
			InvenRaidFrames3Member_UpdateOutline(self)
		end
	end
end
eventHandler.UNIT_MAXHEALTH = eventHandler.UNIT_HEALTH

eventHandler.UNIT_HEALTH_FREQUENT = function(self, unit)
	if unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateHealth(self)
		InvenRaidFrames3Member_UpdateLostHealth(self)
	end
end

eventHandler.UNIT_MAXPOWER = function(self, unit, powerType)
	if unit == self.displayedUnit then
		if powerType == "ALTERNATE" then
			InvenRaidFrames3Member_UpdatePowerBarAlt(self)
		else
			InvenRaidFrames3Member_UpdateMaxPower(self)
			InvenRaidFrames3Member_UpdatePower(self)
		end
	end
end
eventHandler.UNIT_POWER_UPDATE = function(self, unit, powerType)
	if unit == self.displayedUnit then
		if powerType == "ALTERNATE" then
			InvenRaidFrames3Member_UpdatePowerBarAlt(self)
		else
			InvenRaidFrames3Member_UpdatePower(self)
		end
	end
end
eventHandler.UNIT_DISPLAYPOWER = function(self, unit)
	if unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateMaxPower(self)
		InvenRaidFrames3Member_UpdatePower(self)
		InvenRaidFrames3Member_UpdatePowerColor(self)
		InvenRaidFrames3Member_UpdatePowerBarAlt(self)
	end
end
eventHandler.UNIT_POWER_BAR_SHOW = eventHandler.UNIT_DISPLAYPOWER
eventHandler.UNIT_POWER_BAR_HIDE = eventHandler.UNIT_DISPLAYPOWER
eventHandler.UNIT_HEAL_PREDICTION = function(self, unit)
	if unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateHealth(self)
		InvenRaidFrames3Member_UpdateHealPrediction(self)
	end
end
eventHandler.UNIT_ABSORB_AMOUNT_CHANGED = eventHandler.UNIT_HEAL_PREDICTION

eventHandler.UNIT_THREAT_SITUATION_UPDATE = function(self, unit)
	if unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateThreat(self)
		InvenRaidFrames3Member_UpdateDisplayText(self)
		if self.optionTable.outline.type == 5 then
			InvenRaidFrames3Member_UpdateOutline(self)
		end
	end
end
eventHandler.READY_CHECK_CONFIRM = function(self, unit)
	if unit == self.unit then
		InvenRaidFrames3Member_UpdateReadyCheck(self)
	end
end
eventHandler.UNIT_ENTERED_VEHICLE = function(self, unit)
	if unit == self.unit then
		InvenRaidFrames3Member_UpdateAll(self)
	end
end
eventHandler.UNIT_EXITED_VEHICLE = function(self, unit)
	if unit == self.unit then
		InvenRaidFrames3Member_UpdateAll(self)
		C_Timer.After(1, function()
			if UnitExists(self.unit) then
				InvenRaidFrames3Member_UpdateHealth(self)
				InvenRaidFrames3Member_UpdateLostHealth(self)
			end
		end)
	end
end
eventHandler.UNIT_PET = eventHandler.UNIT_ENTERED_VEHICLE
eventHandler.UNIT_SPELLCAST_START = function(self, unit)
	if IRF3.db.units.useCastingBar and unit == self.displayedUnit then
		InvenRaidFrames3Member_UpdateCastingBar(self)
	end
end
eventHandler.UNIT_SPELLCAST_STOP = eventHandler.UNIT_SPELLCAST_START
eventHandler.UNIT_SPELLCAST_DELAYED = eventHandler.UNIT_SPELLCAST_START
eventHandler.UNIT_SPELLCAST_CHANNEL_START = eventHandler.UNIT_SPELLCAST_START
eventHandler.UNIT_SPELLCAST_CHANNEL_UPDATE = eventHandler.UNIT_SPELLCAST_START
eventHandler.UNIT_SPELLCAST_CHANNEL_STOP = eventHandler.UNIT_SPELLCAST_START
eventHandler.PLAYER_TARGET_CHANGED = InvenRaidFrames3Member_UpdateOutline
eventHandler.UPDATE_MOUSEOVER_UNIT = InvenRaidFrames3Member_UpdateOutline
eventHandler.INCOMING_RESURRECT_CHANGED = function(self)
	InvenRaidFrames3Member_UpdateCenterStatusIcon(self)
end
eventHandler.UNIT_OTHER_PARTY_CHANGED = eventHandler.INCOMING_RESURRECT_CHANGED
eventHandler.UNIT_PHASE = eventHandler.INCOMING_RESURRECT_CHANGED

if IRF3.isClassic and IRF3.libCHC then
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_HealStarted", "HealComm_HealUpdated")
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_HealStopped", "HealComm_HealUpdated")
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_HealDelayed", "HealComm_HealUpdated")
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_HealUpdated", "HealComm_HealUpdated")
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_ModifierChanged", "HealComm_HealModifier")
	IRF3.libCHC.RegisterCallback(IRF3, "HealComm_GUIDDisappeared", "HealComm_HealModifier") 
end

function InvenRaidFrames3Member_UpdatePlayerAurasFull(self)
	if IRF3.isClassic then
		return
	end
    self.PlayerAuras = {}

    local function HandleAura(aura)
        self.PlayerAuras[aura.auraInstanceID] = aura
    end

    local batchCount = nil
    local usePackedAura = true
	if self.displayedUnit then
		AuraUtil.ForEachAura(self.displayedUnit, "HELPFUL", batchCount, HandleAura, usePackedAura)
		AuraUtil.ForEachAura(self.displayedUnit, "HARMFUL", batchCount, HandleAura, usePackedAura)
	end
end

local function UpdatePlayerAurasIncremental(self, unitAuraUpdateInfo)
    if unitAuraUpdateInfo.addedAuras ~= nil then
        for _, aura in pairs(unitAuraUpdateInfo.addedAuras) do
            self.PlayerAuras[aura.auraInstanceID] = aura
            -- Perform any setup tasks for this aura here.
        end
    end

    if unitAuraUpdateInfo.updatedAuraInstanceIDs ~= nil then
        for _, auraInstanceID in pairs(unitAuraUpdateInfo.updatedAuraInstanceIDs) do
            self.PlayerAuras[auraInstanceID] = C_UnitAuras.GetAuraDataByAuraInstanceID(self.displayedUnit, auraInstanceID)
            -- Perform any update tasks for this aura here.
        end
    end

    if unitAuraUpdateInfo.removedAuraInstanceIDs ~= nil then
        for _, auraInstanceID in pairs(unitAuraUpdateInfo.removedAuraInstanceIDs) do
            self.PlayerAuras[auraInstanceID] = nil
            -- Perform any cleanup tasks for this aura here.
        end
    end
end

local function OnUnitAurasUpdated(self, unitAuraUpdateInfo)
    if unitAuraUpdateInfo == nil or unitAuraUpdateInfo.isFullUpdate then
        InvenRaidFrames3Member_UpdatePlayerAurasFull(self)
    else
        UpdatePlayerAurasIncremental(self, unitAuraUpdateInfo)
    end
end

eventHandler.UNIT_AURA = function(self, unit, unitAuraUpdateInfo)
-- canApplyAura, debuffType, isBossAura, isFromPlayerOrPlayerPet, isHarmful, isHelpful, isNameplateOnly, isRaid, name, nameplateShowAll, sourceUnit, spellId
	
	if (unit == self.unit or unit == self.displayedUnit) then	
		if not IRF3.isClassic then
			OnUnitAurasUpdated(self, unitAuraUpdateInfo)
		end		
		InvenRaidFrames3Member_UpdateBuffs(self)
		InvenRaidFrames3Member_UpdateAura(self)
		InvenRaidFrames3Member_UpdateSpellTimer(self)
		InvenRaidFrames3Member_UpdateSurvivalSkill(self)

		if self.optionTable.outline.type == 1 then
			InvenRaidFrames3Member_UpdateOutline(self)
		end
		if self.optionTable.useDispelColor then
			InvenRaidFrames3Member_UpdateState(self)
		end
	end
end

function InvenRaidFrames3Member_NewUnitAura(self, spell, filter)
	for auraInstanceID, aura in pairs(self.PlayerAuras) do
		if (aura.name == spell) or (type(spell) == "number" and aura.spellId == spell) then
			if aura.isHelpful and (filter == "HELPFUL" or filter == "PLAYER") then
				return true
			elseif aura.isHarmful and (filter == "HARMFUL") then
				return true
			end
		end
	end
	return false
end