local IRF3 = InvenRaidFrames3
local Option = IRF3.optionFrame
local LBO = LibStub("LibBlueOption-1.0")

function Option:CreateAdvancedMenu(menu, parent)
	self.CreateAdvancedMenu = nil
	local addonsLinkList = { "사용 안함", "Grid2", "Lime", "Plexus" }
	menu.addonsLink = LBO:CreateWidget("DropDown", parent, "연동", "OmniCD 와 비슷한 기능의 애드온과 연동하기 위해 애드온 이름을 추가합니다.(해당 애드온이 꺼져 있어야 합니다.) 설정 후 수동으로 UI Load 가 필요합니다. 채팅창에 /reload 를 쳐주세요.", nil, nil, true,
		function() return not IRF3:GetAddonlinkDB() and 1 or IRF3:GetAddonlinkDB() == 0 and 1 or IRF3:GetAddonlinkDB(), addonsLinkList end,
		function(v)
			IRF3:SetAddonlinkDB(v)
		end
	)
	menu.addonsLink:SetPoint("TOPLEFT", 5, -5)
	
	
	menu.addonsLinkText = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	menu.addonsLinkText:SetPoint("TOPLEFT", 175, -30)
	menu.addonsLinkText:SetText("|cffffffff( 변경 후 채팅창에 ".. ORANGE_FONT_COLOR_CODE.."/reload|cffffffff를 입력하세요. )")
	

	menu.enableFadeIn = LBO:CreateWidget("CheckBox", parent, "Enable FADE IN", "주문 타이머와 약화 효과의 점점 커지는 연출을 활성화 합니다.", nil, nil, true,
		function() return IRF3.db.enableFadeIn end,
		function(v)
			IRF3.db.enableFadeIn = v
		end
	)
	menu.enableFadeIn:SetPoint("TOP", menu.addonsLink, "BOTTOM", 0, 0)

	menu.enableSpellTimerType1 = LBO:CreateWidget("CheckBox", parent, "Enable 주문 타이머 폰트 위치 변경", "주문 타이머의 아이콘과 타이머 폰트의 위치를 겹치게 합니다.", nil, nil, true,
		function() return IRF3.db.enableSpellTimerType1 end,
		function(v)
			IRF3.db.enableSpellTimerType1 = v
			IRF3:UpdateSpellTimerFont()
			IRF3:UpdateSpellTimerWidth()
		end
	)
	menu.enableSpellTimerType1:SetPoint("TOP", menu.enableFadeIn, "BOTTOM", 0, 0)

 	if not InvenRaidFrames3DB.CPUUsage then InvenRaidFrames3DB.CPUUsage = false end
 	menu.CPUUsage = LBO:CreateWidget("CheckBox", parent, "CPU사용량 표시", "좌클릭: 라이브러리 사용/해제 , 우클릭: 감추기/열기", nil, nil, true,
 		function() return InvenRaidFrames3DB.CPUUsage end,
 		function(v)
 			InvenRaidFrames3DB.CPUUsage = v
 			InvenRaidFrames3CPUUsage_Toggle()
 		end
 	)
 	menu.CPUUsage:SetPoint("TOP", menu.enableSpellTimerType1, "BOTTOM", 0, -10)

 	if not IRF3.db.disableLibAuras then IRF3.db.disableLibAuras = false end
 	menu.disableLibAuras = LBO:CreateWidget("CheckBox", parent, "LibAuras 비활성화", "체크시 라이브러리 해제", nil, nil, true,
 		function() return IRF3.db.disableLibAuras end,
 		function(v)
 			InvenRaidFrames3CPUUsage_Click()
 		end
 	)
 	menu.disableLibAuras:SetPoint("TOP", menu.CPUUsage, "BOTTOM", 0, 10)
end