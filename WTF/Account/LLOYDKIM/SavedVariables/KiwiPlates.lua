
KiwiPlatesDb = {
	["profileChars"] = {
		["Wagerssi - 아즈샤라"] = {
			"default", -- [1]
			"default", -- [2]
			"default", -- [3]
		},
		["회색빛의도사 - 아즈샤라"] = {
			"default", -- [1]
			"default", -- [2]
			"default", -- [3]
		},
		["회색빛의악마 - 아즈샤라"] = {
			"TEST", -- [1]
			"default", -- [2]
		},
	},
	["global"] = {
		["classicBorders"] = true,
	},
	["profiles"] = {
		["Wagerssi - 아즈샤라"] = {
			["rules"] = {
				{
					"and", -- [1]
				}, -- [1]
			},
			["version"] = 4,
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
					},
				},
				["widgets"] = {
				},
				["colorsOther"] = {
					{
						0.35, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [1]
					{
						1, -- [1]
						0.4, -- [2]
						0, -- [3]
					}, -- [2]
					{
						1, -- [1]
						0, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.85, -- [1]
						1, -- [2]
						0, -- [3]
					},
				},
			},
			["skins"] = {
				{
					["kHealthText_enabled"] = true,
					["kAttackers_enabled"] = false,
					["kLevelText_enabled"] = true,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["kIcon_enabled"] = true,
					["kCastBar_enabled"] = true,
					["kHealthBar_enabled"] = true,
					["RaidTargetFrame_enabled"] = true,
					["__skinName"] = "Default",
					["kTargetClass_enabled"] = false,
				}, -- [1]
			},
			["minimapIcon"] = {
			},
			["general"] = {
				["reactionColor"] = {
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
				},
				["healthColor"] = {
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["threshold2"] = 0.3,
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["highlight"] = true,
				["classColor"] = {
				},
			},
			["auras"] = {
				["enabled"] = "custom",
				["buffsCentered"] = true,
			},
		},
		["회색빛의도사 - 아즈샤라"] = {
			["minimapIcon"] = {
			},
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
					},
				},
				["widgets"] = {
				},
				["colorsOther"] = {
					{
						0.35, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [1]
					{
						1, -- [1]
						0.4, -- [2]
						0, -- [3]
					}, -- [2]
					{
						1, -- [1]
						0, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.85, -- [1]
						1, -- [2]
						0, -- [3]
					},
				},
			},
			["general"] = {
				["reactionColor"] = {
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
				},
				["healthColor"] = {
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["threshold2"] = 0.3,
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["highlight"] = true,
				["classColor"] = {
				},
			},
			["combo"] = {
			},
			["skins"] = {
				{
					["kHealthText_enabled"] = true,
					["kAttackers_enabled"] = false,
					["kLevelText_enabled"] = true,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["kIcon_enabled"] = true,
					["kCastBar_enabled"] = true,
					["kHealthBar_enabled"] = true,
					["RaidTargetFrame_enabled"] = true,
					["__skinName"] = "Default",
					["kTargetClass_enabled"] = false,
				}, -- [1]
			},
			["version"] = 4,
			["rules"] = {
				{
					"and", -- [1]
				}, -- [1]
			},
			["auras"] = {
				["enabled"] = "custom",
				["buffsCentered"] = true,
			},
		},
		["default"] = {
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0.0392156862745098, -- [2]
						0, -- [3]
					},
				},
				["soloThreat"] = true,
				["alwaysEnabled"] = true,
				["playerRole"] = "DAMAGER",
				["colorsOther"] = {
					{
						1, -- [1]
						0.07450980392156863, -- [2]
						0, -- [3]
					}, -- [1]
					{
						0.9215686274509803, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.972549019607843, -- [1]
						0.984313725490196, -- [2]
						1, -- [3]
					},
				},
				["widgets"] = {
					"kHealthBar", -- [1]
				},
			},
			["playerCastBar"] = {
				["enabled"] = true,
				["iconOffsetY"] = -1,
				["iconOffsetX"] = -2,
				["borderTexture"] = "Bliz CastingBar Small",
				["iconSize"] = 32,
				["offsetY"] = 408,
				["barHeight"] = 16,
				["borderColor"] = {
					0.06274509803921569, -- [1]
					0.06274509803921569, -- [2]
					0.06274509803921569, -- [3]
					1, -- [4]
				},
			},
			["RealMobHealth"] = true,
			["combo"] = {
			},
			["auras"] = {
				["enabled"] = "custom",
				["buffsDisplayStealable"] = true,
				["buffsOffsetY"] = -170,
				["buffsCentered"] = true,
			},
			["targetCastBar"] = {
				["enabled"] = true,
				["iconOffsetY"] = 26,
				["iconEnabled"] = true,
				["barHeight"] = 16,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["offsetY"] = 456,
				["iconOffsetX"] = 167,
				["borderSize"] = 0,
				["offsetX"] = 0,
				["borderTexture"] = "Bliz CastingBar Small",
				["iconSize"] = 47,
				["barFontSize"] = 12,
				["barTexture"] = "Blizzard NamePlate",
				["barWidth"] = 301,
			},
			["minimapIcon"] = {
				["minimapPos"] = 303.663938155253,
			},
			["version"] = 4,
			["skins"] = {
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["castBarBorderSize"] = 3,
					["healthMaskValue"] = "$h / $p",
					["levelFontFile"] = "kor_2",
					["kLevelText_enabled"] = true,
					["ClassificationFrame_enabled"] = true,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 15,
					["castBarIconEnabled"] = true,
					["classIconOffsetX"] = 2,
					["levelOffsetY"] = -10,
					["attackersIconSize"] = 18,
					["attackersOffsetY"] = -10,
					["nameFontSize"] = 15,
					["kHealthBar_color_status"] = "reaction",
					["buffsWidth"] = 35,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["__skinName"] = "Target",
					["kTargetClass_enabled"] = false,
					["kHealthBar_enabled"] = true,
					["healthTextOffsetY"] = -10,
					["buffsHeight"] = 25,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 10,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["castBarIconSize"] = 60,
					["healthTextFontFile"] = "kor_2",
					["borderTexture"] = "Bliz White",
					["castBarIconOffsetY"] = -4,
					["castBarHidden"] = false,
					["healthBarHeight"] = 27,
					["kHealthBorder_color_default"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["attackersOffsetX"] = -38,
					["castBarIconOffsetX"] = -7,
					["kAttackers_enabled"] = true,
					["nameFontFile"] = "Roboto Condensed Bold",
					["buffsOffsetY"] = 24,
					["healthTextOffsetX"] = 125,
					["levelFontSize"] = 15,
					["raidTargetOffsetX"] = 135,
					["kHealthText_enabled"] = true,
					["levelOffsetX"] = -120,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["RaidTargetFrame_enabled"] = true,
					["classIconSize"] = 24,
					["healthBarWidth"] = 260,
					["castBarHeight"] = 20,
				}, -- [1]
				{
					["castBarBorderTexture"] = "Bliz White",
					["buffsOffsetY"] = 15,
					["raidTargetOffsetY"] = 36,
					["kLevelText_enabled"] = false,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["kNameText_color_status"] = "reaction",
					["castBarFontSize"] = 11,
					["levelOffsetY"] = 0,
					["castBarHeight"] = 10,
					["nameFormat"] = "$t|cFFffffff\n$g$p",
					["plateOffsetY"] = 0,
					["nameFontSize"] = 15,
					["healthBarHeight"] = 8,
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = false,
					["__skinName"] = "Friends",
					["castBarTexture"] = "Minimalist",
					["kNameText_enabled"] = true,
					["castBarHidden"] = true,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = -3,
					["kHealthBar_color_status"] = "blizzard",
					["healthTextOffsetX"] = 48,
					["kHealthBar_enabled"] = false,
					["raidTargetOffsetX"] = 72,
					["raidTargetSize"] = 24,
					["levelOffsetX"] = -8,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["RaidTargetFrame_enabled"] = true,
					["kHealthText_enabled"] = false,
					["healthBarWidth"] = 120,
					["kHealthBorder_enabled"] = false,
				}, -- [2]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["healthMaskValue"] = "$h",
					["raidTargetOffsetY"] = -3,
					["kLevelText_enabled"] = true,
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 11,
					["levelOffsetY"] = -5,
					["castBarHeight"] = 14,
					["attackersOffsetY"] = -5,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["kHealthBar_color_status"] = "blizzard",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["kHealthText_enabled"] = true,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 7,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["healthBarHeight"] = 10,
					["nameFontSize"] = 13,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						1, -- [2]
						0.1803921568627451, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["kAttackers_enabled"] = false,
					["kHealthBar_enabled"] = true,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["castBarHidden"] = true,
					["levelFontFile"] = "Kor_1",
					["healthTextOffsetX"] = 90,
					["__skinName"] = "!Combat",
					["raidTargetOffsetX"] = 100,
					["buffsOffsetY"] = 20,
					["levelOffsetX"] = -85,
					["healthTextOffsetY"] = -5,
					["RaidTargetFrame_enabled"] = true,
					["healthTextFontFile"] = "Kor_1",
					["healthBarWidth"] = 180,
					["plateOffsetY"] = 5,
				}, -- [3]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["buffsOffsetY"] = 20,
					["levelFontFile"] = "Kor_1",
					["kLevelText_enabled"] = true,
					["castBarIconOffsetX"] = -5,
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 13,
					["castBarIconEnabled"] = true,
					["levelOffsetY"] = -7,
					["kAttackers_enabled"] = true,
					["attackersOffsetY"] = -6,
					["nameFontSize"] = 14,
					["kHealthBar_color_status"] = "reaction",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["__skinName"] = "Default",
					["levelFontSize"] = 16,
					["castBarHeight"] = 16,
					["classIconSize"] = 20,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 10,
					["kNameText_enabled"] = true,
					["castBarHidden"] = false,
					["castBarIconSize"] = 37,
					["RaidTargetFrame_enabled"] = true,
					["borderTexture"] = "Bliz White",
					["castBarFontFile"] = "Roboto Condensed Bold",
					["kHealthBorder_enabled"] = true,
					["healthTextFontSize"] = 15,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["kHealthText_enabled"] = true,
					["attackersOffsetX"] = -26,
					["healthBarHeight"] = 16,
					["healthTextFontFile"] = "Kor_1",
					["healthMaskValue"] = "$h",
					["healthTextOffsetX"] = 100,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["raidTargetOffsetX"] = 110,
					["raidTargetSize"] = 18,
					["levelOffsetX"] = -95,
					["healthTextOffsetY"] = -7,
					["kHealthBar_enabled"] = true,
					["castBarIconOffsetY"] = -2,
					["healthBarWidth"] = 200,
					["attackersIconSize"] = 17,
				}, -- [4]
			},
			["castBarIconEnabled"] = true,
			["defaultSkin"] = 4,
			["rules"] = {
				{
					"and", -- [1]
					{
						"@target", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [3]
				}, -- [1]
				{
					"and", -- [1]
					{
						"@reaction", -- [1]
						"~=", -- [2]
						"hostile", -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [2]
				{
					"and", -- [1]
					{
						"combat", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@combat", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [3]
				{
					"and", -- [1]
				}, -- [4]
			},
			["general"] = {
				["classColor"] = {
				},
				["nameplateShowFriends"] = 0,
				["highlight"] = true,
				["reactionColor"] = {
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.9450980392156862, -- [1]
						0.06274509803921569, -- [2]
						0.1254901960784314, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
				},
				["healthColor"] = {
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["threshold2"] = 0.3,
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["alpha2"] = 0.65,
				["nameplateMaxDistanceClassic"] = "6e1",
				["classColorFriendlyPlayers"] = true,
			},
		},
		["TEST"] = {
			["rules"] = {
				{
					"and", -- [1]
				}, -- [1]
				{
					"and", -- [1]
					{
						"@target", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [3]
				}, -- [2]
				{
					"and", -- [1]
					{
						"@reaction", -- [1]
						"~=", -- [2]
						"hostile", -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [3]
				{
					"and", -- [1]
					{
						"combat", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@combat", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [4]
				{
					"or", -- [1]
					{
						"@type", -- [1]
						"==", -- [2]
						"GameObject", -- [3]
					}, -- [2]
				}, -- [5]
			},
			["general"] = {
				["classColor"] = {
				},
				["nameplateShowFriends"] = 0,
				["highlight"] = true,
				["reactionColor"] = {
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.9450980392156862, -- [1]
						0.06274509803921569, -- [2]
						0.1254901960784314, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
				},
				["healthColor"] = {
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["threshold2"] = 0.3,
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["alpha2"] = 0.65,
				["nameplateMaxDistanceClassic"] = "6e1",
				["classColorFriendlyPlayers"] = true,
			},
			["RealMobHealth"] = true,
			["auras"] = {
				["enabled"] = "custom",
				["buffsDisplayStealable"] = true,
				["buffsOffsetY"] = -170,
				["buffsCentered"] = true,
			},
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0.0392156862745098, -- [2]
						0, -- [3]
					},
				},
				["soloThreat"] = true,
				["alwaysEnabled"] = true,
				["playerRole"] = "DAMAGER",
				["colorsOther"] = {
					{
						1, -- [1]
						0.07450980392156863, -- [2]
						0, -- [3]
					}, -- [1]
					{
						0.9215686274509803, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.972549019607843, -- [1]
						0.984313725490196, -- [2]
						1, -- [3]
					},
				},
				["widgets"] = {
					"kHealthBar", -- [1]
				},
			},
			["playerCastBar"] = {
				["enabled"] = true,
				["iconOffsetY"] = -1,
				["iconOffsetX"] = -2,
				["borderTexture"] = "Bliz CastingBar Small",
				["iconSize"] = 32,
				["offsetY"] = 408,
				["barHeight"] = 16,
				["borderColor"] = {
					0.06274509803921569, -- [1]
					0.06274509803921569, -- [2]
					0.06274509803921569, -- [3]
					1, -- [4]
				},
			},
			["version"] = 4,
			["skins"] = {
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["buffsOffsetY"] = 20,
					["levelFontFile"] = "Kor_1",
					["kLevelText_enabled"] = true,
					["castBarIconOffsetX"] = -5,
					["castBarIconOffsetY"] = -2,
					["castBarFontSize"] = 13,
					["castBarIconEnabled"] = true,
					["levelOffsetY"] = -7,
					["kAttackers_enabled"] = true,
					["attackersOffsetY"] = -6,
					["nameFontSize"] = 14,
					["kHealthBar_color_status"] = "reaction",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["kHealthText_enabled"] = true,
					["kTargetClass_enabled"] = false,
					["kIcon_enabled"] = true,
					["castBarHeight"] = 16,
					["RaidTargetFrame_enabled"] = true,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 13,
					["kNameText_enabled"] = true,
					["castBarHidden"] = false,
					["castBarIconSize"] = 37,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["borderTexture"] = "Bliz White",
					["__skinName"] = "Default",
					["kHealthBorder_enabled"] = true,
					["healthTextFontSize"] = 15,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["levelFontSize"] = 16,
					["attackersOffsetX"] = -26,
					["healthBarHeight"] = 16,
					["healthTextFontFile"] = "Kor_1",
					["healthMaskValue"] = "$h",
					["healthTextOffsetX"] = 100,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["raidTargetOffsetX"] = 110,
					["raidTargetSize"] = 18,
					["levelOffsetX"] = -95,
					["healthTextOffsetY"] = -7,
					["kHealthBar_enabled"] = true,
					["classIconSize"] = 20,
					["healthBarWidth"] = 200,
					["attackersIconSize"] = 17,
				}, -- [1]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["castBarBorderSize"] = 3,
					["healthMaskValue"] = "$h / $p",
					["levelFontFile"] = "kor_2",
					["kLevelText_enabled"] = true,
					["ClassificationFrame_enabled"] = true,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["classIconSize"] = 24,
					["castBarFontSize"] = 15,
					["castBarIconEnabled"] = true,
					["classIconOffsetX"] = 2,
					["levelOffsetY"] = -10,
					["attackersIconSize"] = 18,
					["attackersOffsetY"] = -10,
					["nameFontSize"] = 15,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["kHealthBar_color_status"] = "reaction",
					["kHealthText_enabled"] = true,
					["healthBarTexture"] = "Minimalist",
					["kTargetClass_enabled"] = false,
					["__skinName"] = "Target",
					["kCastBar_enabled"] = true,
					["kHealthBar_enabled"] = true,
					["healthTextOffsetY"] = -10,
					["kIcon_enabled"] = true,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 10,
					["healthTextFontFile"] = "kor_2",
					["kHealthBorder_enabled"] = true,
					["castBarIconSize"] = 60,
					["buffsWidth"] = 35,
					["borderTexture"] = "Bliz White",
					["castBarIconOffsetY"] = -4,
					["castBarHidden"] = false,
					["healthBarHeight"] = 27,
					["kHealthBorder_color_default"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["attackersOffsetX"] = -38,
					["castBarIconOffsetX"] = -7,
					["kAttackers_enabled"] = true,
					["nameFontFile"] = "Roboto Condensed Bold",
					["buffsOffsetY"] = 24,
					["healthTextOffsetX"] = 125,
					["levelFontSize"] = 15,
					["raidTargetOffsetX"] = 135,
					["kNameText_enabled"] = true,
					["levelOffsetX"] = -120,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["RaidTargetFrame_enabled"] = true,
					["buffsHeight"] = 25,
					["healthBarWidth"] = 260,
					["castBarHeight"] = 20,
				}, -- [2]
				{
					["castBarBorderTexture"] = "Bliz White",
					["buffsOffsetY"] = 15,
					["raidTargetOffsetY"] = 36,
					["kLevelText_enabled"] = false,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["kNameText_color_status"] = "reaction",
					["castBarFontSize"] = 11,
					["levelOffsetY"] = 0,
					["castBarHeight"] = 10,
					["nameFormat"] = "$t|cFFffffff\n$g$p",
					["plateOffsetY"] = 0,
					["nameFontSize"] = 15,
					["healthBarHeight"] = 8,
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = false,
					["__skinName"] = "Friends",
					["castBarTexture"] = "Minimalist",
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = false,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = -3,
					["kHealthBar_color_status"] = "blizzard",
					["healthTextOffsetX"] = 48,
					["RaidTargetFrame_enabled"] = true,
					["raidTargetOffsetX"] = 72,
					["raidTargetSize"] = 24,
					["levelOffsetX"] = -8,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["kHealthBar_enabled"] = false,
					["kHealthText_enabled"] = false,
					["healthBarWidth"] = 120,
					["castBarHidden"] = true,
				}, -- [3]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["buffsOffsetY"] = 20,
					["raidTargetOffsetY"] = -3,
					["kLevelText_enabled"] = true,
					["castBarBorderColor"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 11,
					["castBarIconEnabled"] = true,
					["levelOffsetY"] = -5,
					["castBarHeight"] = 14,
					["plateOffsetY"] = 5,
					["nameFontSize"] = 13,
					["kHealthBar_color_status"] = "blizzard",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["kHealthText_enabled"] = true,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 11,
					["healthTextFontFile"] = "Kor_1",
					["castBarHidden"] = true,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["kAttackers_enabled"] = false,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						1, -- [2]
						0.1803921568627451, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["healthBarHeight"] = 10,
					["kHealthBar_enabled"] = true,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["levelFontFile"] = "Kor_1",
					["kHealthBorder_enabled"] = true,
					["healthTextOffsetX"] = 90,
					["__skinName"] = "!Combat",
					["raidTargetOffsetX"] = 100,
					["healthMaskValue"] = "$h",
					["levelOffsetX"] = -85,
					["healthTextOffsetY"] = -5,
					["RaidTargetFrame_enabled"] = true,
					["kNameText_enabled"] = true,
					["healthBarWidth"] = 180,
					["attackersOffsetY"] = -5,
				}, -- [4]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["buffsOffsetY"] = 20,
					["levelFontFile"] = "Kor_1",
					["kLevelText_enabled"] = true,
					["castBarIconOffsetX"] = -5,
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 13,
					["castBarIconEnabled"] = true,
					["levelOffsetY"] = -7,
					["castBarHeight"] = 16,
					["attackersOffsetY"] = -6,
					["nameFontSize"] = 14,
					["kHealthBar_color_status"] = "color",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["__skinName"] = "TEST",
					["attackersIconSize"] = 17,
					["castBarIconOffsetY"] = -2,
					["classIconSize"] = 20,
					["kHealthBar_enabled"] = true,
					["kHealthBar_color_default"] = {
						1, -- [1]
						0.1019607843137255, -- [2]
						0.8352941176470589, -- [3]
						1, -- [4]
					},
					["castBarGap"] = 10,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["castBarIconSize"] = 37,
					["healthTextOffsetY"] = -7,
					["borderTexture"] = "Bliz White",
					["castBarTexture"] = "Minimalist",
					["levelFontSize"] = 16,
					["healthTextFontSize"] = 15,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["kHealthText_enabled"] = true,
					["attackersOffsetX"] = -26,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["healthTextFontFile"] = "Kor_1",
					["healthMaskValue"] = "$h",
					["healthTextOffsetX"] = 100,
					["healthBarHeight"] = 16,
					["raidTargetOffsetX"] = 110,
					["raidTargetSize"] = 18,
					["levelOffsetX"] = -95,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["RaidTargetFrame_enabled"] = true,
					["castBarHidden"] = false,
					["healthBarWidth"] = 200,
					["kAttackers_enabled"] = true,
				}, -- [5]
			},
			["castBarIconEnabled"] = true,
			["defaultSkin"] = 1,
			["minimapIcon"] = {
				["minimapPos"] = 303.663938155253,
			},
			["targetCastBar"] = {
				["enabled"] = true,
				["iconOffsetY"] = 26,
				["barTexture"] = "Blizzard NamePlate",
				["barHeight"] = 16,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["offsetY"] = 456,
				["iconOffsetX"] = 167,
				["borderSize"] = 0,
				["offsetX"] = 0,
				["borderTexture"] = "Bliz CastingBar Small",
				["iconSize"] = 47,
				["barFontSize"] = 12,
				["iconEnabled"] = true,
				["barWidth"] = 301,
			},
		},
		["와우하는아저씨"] = {
			["minimapIcon"] = {
				["minimapPos"] = 303.663938155253,
			},
			["targetCastBar"] = {
				["enabled"] = true,
				["iconOffsetY"] = 26,
				["barHeight"] = 16,
				["iconEnabled"] = true,
				["barTexture"] = "Blizzard NamePlate",
				["barFontSize"] = 12,
				["iconSize"] = 47,
				["borderSize"] = 0,
				["offsetX"] = 0,
				["borderTexture"] = "Bliz CastingBar Small",
				["iconOffsetX"] = 167,
				["offsetY"] = 456,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["barWidth"] = 301,
			},
			["RealMobHealth"] = true,
			["auras"] = {
				["enabled"] = "custom",
				["buffsDisplayStealable"] = true,
				["buffsOffsetY"] = -170,
				["buffsCentered"] = true,
			},
			["general"] = {
				["classColor"] = {
				},
				["nameplateShowFriends"] = 5,
				["highlight"] = true,
				["healthColor"] = {
					["threshold2"] = 0.3,
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["classColorFriendlyPlayers"] = true,
				["nameplateMaxDistanceClassic"] = "6e1",
				["alpha2"] = 0.65,
				["reactionColor"] = {
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.9450980392156862, -- [1]
						0.06274509803921569, -- [2]
						0.1254901960784314, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
				},
			},
			["rules"] = {
				{
					"and", -- [1]
					{
						"@target", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [3]
				}, -- [1]
				{
					"and", -- [1]
					{
						"@reaction", -- [1]
						"~=", -- [2]
						"hostile", -- [3]
					}, -- [2]
					{
						"@attackable", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [2]
				{
					"and", -- [1]
					{
						"combat", -- [1]
						"==", -- [2]
						true, -- [3]
					}, -- [2]
					{
						"@combat", -- [1]
						"==", -- [2]
						false, -- [3]
					}, -- [3]
				}, -- [3]
				{
					"and", -- [1]
				}, -- [4]
			},
			["version"] = 4,
			["castBarIconEnabled"] = true,
			["skins"] = {
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["castBarBorderSize"] = 3,
					["healthMaskValue"] = "$h / $p",
					["levelFontFile"] = "kor_2",
					["kLevelText_enabled"] = true,
					["ClassificationFrame_enabled"] = true,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 15,
					["castBarIconEnabled"] = true,
					["classIconOffsetX"] = 2,
					["levelOffsetY"] = -10,
					["buffsHeight"] = 25,
					["attackersOffsetY"] = -10,
					["nameFontSize"] = 15,
					["castBarHeight"] = 20,
					["kHealthBar_color_status"] = "reaction",
					["kHealthText_enabled"] = true,
					["healthBarTexture"] = "Minimalist",
					["kTargetClass_enabled"] = false,
					["__skinName"] = "Target",
					["attackersIconSize"] = 18,
					["RaidTargetFrame_enabled"] = true,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["classIconSize"] = 24,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 10,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["castBarIconSize"] = 60,
					["healthTextFontFile"] = "kor_2",
					["borderTexture"] = "Bliz White",
					["castBarIconOffsetY"] = -4,
					["levelFontSize"] = 15,
					["healthBarHeight"] = 27,
					["kHealthBorder_color_default"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["buffsOffsetY"] = 24,
					["nameFontFile"] = "Roboto Condensed Bold",
					["kAttackers_enabled"] = true,
					["castBarIconOffsetX"] = -7,
					["attackersOffsetX"] = -38,
					["healthTextOffsetX"] = 125,
					["castBarHidden"] = false,
					["raidTargetOffsetX"] = 135,
					["buffsWidth"] = 35,
					["levelOffsetX"] = -120,
					["healthTextOffsetY"] = -10,
					["kHealthBar_enabled"] = true,
					["kCastBar_enabled"] = true,
					["healthBarWidth"] = 260,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
				}, -- [1]
				{
					["castBarBorderTexture"] = "Bliz White",
					["buffsOffsetY"] = 15,
					["raidTargetOffsetY"] = 36,
					["kLevelText_enabled"] = false,
					["castBarBorderColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["kNameText_color_status"] = "reaction",
					["castBarFontSize"] = 11,
					["levelOffsetY"] = 0,
					["castBarHeight"] = 10,
					["nameFormat"] = "$t|cFFffffff\n$g$p",
					["plateOffsetY"] = 0,
					["nameFontSize"] = 15,
					["healthBarHeight"] = 8,
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = false,
					["kHealthText_enabled"] = false,
					["castBarTexture"] = "Minimalist",
					["kNameText_enabled"] = true,
					["castBarHidden"] = true,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = -3,
					["kHealthBorder_enabled"] = false,
					["healthTextOffsetX"] = 48,
					["RaidTargetFrame_enabled"] = true,
					["raidTargetOffsetX"] = 72,
					["raidTargetSize"] = 24,
					["levelOffsetX"] = -8,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["kHealthBar_enabled"] = false,
					["__skinName"] = "Friends",
					["healthBarWidth"] = 120,
					["kHealthBar_color_status"] = "blizzard",
				}, -- [2]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["healthMaskValue"] = "$h",
					["levelFontFile"] = "Kor_1",
					["kLevelText_enabled"] = true,
					["kIcon_enabled"] = true,
					["castBarFontSize"] = 11,
					["levelOffsetY"] = -5,
					["kAttackers_enabled"] = false,
					["attackersOffsetY"] = -5,
					["nameFontSize"] = 13,
					["kHealthBar_color_status"] = "blizzard",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["__skinName"] = "!Combat",
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 7,
					["kNameText_enabled"] = true,
					["castBarHidden"] = true,
					["borderSize"] = 3,
					["borderTexture"] = "Bliz White",
					["plateOffsetY"] = 5,
					["castBarHeight"] = 14,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						1, -- [2]
						0.1803921568627451, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["healthTextFontFile"] = "Kor_1",
					["RaidTargetFrame_enabled"] = true,
					["healthTextOffsetY"] = -5,
					["raidTargetOffsetY"] = -3,
					["buffsOffsetY"] = 20,
					["healthTextOffsetX"] = 90,
					["kHealthText_enabled"] = true,
					["raidTargetOffsetX"] = 100,
					["kHealthBorder_enabled"] = true,
					["levelOffsetX"] = -85,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["kHealthBar_enabled"] = true,
					["healthBarHeight"] = 10,
					["healthBarWidth"] = 180,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
				}, -- [3]
				{
					["castBarBorderTexture"] = "Bliz CastingBar Small",
					["buffsOffsetY"] = 20,
					["levelFontFile"] = "Kor_1",
					["kLevelText_enabled"] = true,
					["castBarIconOffsetX"] = -5,
					["classIconSize"] = 20,
					["castBarFontSize"] = 13,
					["castBarIconEnabled"] = true,
					["levelOffsetY"] = -7,
					["castBarHeight"] = 16,
					["attackersOffsetY"] = -6,
					["nameFontSize"] = 14,
					["kHealthBar_color_status"] = "reaction",
					["healthBarTexture"] = "Minimalist",
					["kCastBar_enabled"] = true,
					["kHealthText_enabled"] = true,
					["attackersIconSize"] = 17,
					["kAttackers_enabled"] = true,
					["castBarIconOffsetY"] = -2,
					["castBarTexture"] = "Minimalist",
					["castBarGap"] = 10,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["castBarIconSize"] = 37,
					["kHealthBar_enabled"] = true,
					["borderTexture"] = "Bliz White",
					["healthTextOffsetY"] = -7,
					["castBarHidden"] = false,
					["healthTextFontSize"] = 15,
					["kHealthBorder_color_default"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["nameOffsetY"] = 3,
					["levelFontSize"] = 16,
					["attackersOffsetX"] = -26,
					["classIconTexture"] = "Interface\\Addons\\KiwiPlates\\media\\classifcw",
					["healthTextFontFile"] = "Kor_1",
					["healthMaskValue"] = "$h",
					["healthTextOffsetX"] = 100,
					["healthBarHeight"] = 16,
					["raidTargetOffsetX"] = 110,
					["raidTargetSize"] = 18,
					["levelOffsetX"] = -95,
					["castBarFontFile"] = "Roboto Condensed Bold",
					["RaidTargetFrame_enabled"] = true,
					["__skinName"] = "Default",
					["healthBarWidth"] = 200,
					["kIcon_enabled"] = true,
				}, -- [4]
			},
			["defaultSkin"] = 4,
			["playerCastBar"] = {
				["enabled"] = true,
				["borderTexture"] = "Bliz CastingBar Small",
				["offsetY"] = 408,
				["borderColor"] = {
					0.06274509803921569, -- [1]
					0.06274509803921569, -- [2]
					0.06274509803921569, -- [3]
					1, -- [4]
				},
				["iconSize"] = 32,
				["barHeight"] = 16,
				["iconOffsetX"] = -2,
				["iconOffsetY"] = -1,
			},
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0.0392156862745098, -- [2]
						0, -- [3]
					},
				},
				["soloThreat"] = true,
				["widgets"] = {
					"kHealthBar", -- [1]
				},
				["colorsOther"] = {
					{
						1, -- [1]
						0.07450980392156863, -- [2]
						0, -- [3]
					}, -- [1]
					{
						0.9215686274509803, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.972549019607843, -- [1]
						0.984313725490196, -- [2]
						1, -- [3]
					},
				},
				["playerRole"] = "DAMAGER",
				["alwaysEnabled"] = true,
			},
		},
		["회색빛의악마 - 아즈샤라"] = {
			["rules"] = {
				{
					"and", -- [1]
				}, -- [1]
			},
			["version"] = 4,
			["threat"] = {
				["colorsTank"] = {
					{
						0, -- [1]
						0, -- [2]
						1, -- [3]
					}, -- [1]
					{
						1, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [2]
					{
						0, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
					},
				},
				["widgets"] = {
				},
				["colorsOther"] = {
					{
						0.35, -- [1]
						1, -- [2]
						0, -- [3]
					}, -- [1]
					{
						1, -- [1]
						0.4, -- [2]
						0, -- [3]
					}, -- [2]
					{
						1, -- [1]
						0, -- [2]
						0, -- [3]
					}, -- [3]
					[0] = {
						0.85, -- [1]
						1, -- [2]
						0, -- [3]
					},
				},
			},
			["skins"] = {
				{
					["kHealthText_enabled"] = true,
					["kAttackers_enabled"] = false,
					["kLevelText_enabled"] = true,
					["kNameText_enabled"] = true,
					["kHealthBorder_enabled"] = true,
					["kIcon_enabled"] = true,
					["kCastBar_enabled"] = true,
					["kHealthBar_enabled"] = true,
					["RaidTargetFrame_enabled"] = true,
					["__skinName"] = "Default",
					["kTargetClass_enabled"] = false,
				}, -- [1]
			},
			["minimapIcon"] = {
			},
			["general"] = {
				["reactionColor"] = {
					["playerhostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["hostile"] = {
						0.7, -- [1]
						0.2, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["neutral"] = {
						1, -- [1]
						0.8, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["playerfriendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.2, -- [1]
						0.6, -- [2]
						0.1, -- [3]
						1, -- [4]
					},
					["tapped"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						1, -- [4]
					},
				},
				["healthColor"] = {
					["color2"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["color3"] = {
						1, -- [1]
						0.4, -- [2]
						0.3, -- [3]
						1, -- [4]
					},
					["threshold2"] = 0.3,
					["threshold1"] = 0.9,
					["color1"] = {
						0.6, -- [1]
						1, -- [2]
						0.8, -- [3]
						1, -- [4]
					},
				},
				["highlight"] = true,
				["classColor"] = {
				},
			},
			["auras"] = {
				["enabled"] = "custom",
				["buffsCentered"] = true,
			},
		},
	},
}
