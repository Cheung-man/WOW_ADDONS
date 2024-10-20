
OmniCDDB = {
	["profileKeys"] = {
		["애드온배포용 - 아즈샤라"] = "Default",
		["애드온설정방법 - 아즈샤라"] = "와우하는아저씨",
		["애똔테스 - 아즈샤라"] = "와우하는아저씨",
		["쩐쩐 - 아즈샤라"] = "와우하는아저씨",
		["회색빛의전사 - 아즈샤라"] = "와우하는아저씨",
		["애똔테스트 - 아즈샤라"] = "와우하는아저씨",
		["프로필테스트용 - 아즈샤라"] = "Default",
		["옷가지테스트중 - 아즈샤라"] = "와우하는아저씨",
		["첫번째테스트 - 아즈샤라"] = "Default",
		["애돈떼스트 - 아즈샤라"] = "와우하는아저씨",
		["Wazerssii - 아즈샤라"] = "와우하는아저씨",
		["애드온테스트함 - 아즈샤라"] = "Default",
		["Wagerssi - 하이잘"] = "와우하는아저씨",
		["신이내린저주 - 아즈샤라"] = "Default",
		["테스트용아이디용 - 아즈샤라"] = "와우하는아저씨",
		["십일월테스트용 - 아즈샤라"] = "와우하는아저씨",
		["Wagerssi - 아즈샤라"] = "와우하는아저씨",
		["와저씨테스트중임 - 아즈샤라"] = "와우하는아저씨",
		["회색빛의법사 - 아즈샤라"] = "와우하는아저씨",
		["Wazerssi - 아즈샤라"] = "와우하는아저씨",
		["테스트다용용 - 아즈샤라"] = "와우하는아저씨",
		["펀펀 - 아즈샤라"] = "와우하는아저씨",
		["회색빛의악마 - 아즈샤라"] = "와우하는아저씨",
		["채널와저씨 - 하이잘"] = "와우하는아저씨",
		["두번째테스트 - 아즈샤라"] = "와우하는아저씨",
		["건건 - 아즈샤라"] = "와우하는아저씨",
		["미스터와저 - 아즈샤라"] = "와저씨21:9",
		["테스티애돈 - 아즈샤라"] = "와우하는아저씨",
		["회색빛의절망 - 하이잘"] = "Default",
		["애드온테스트중임 - 아즈샤라"] = "와우하는아저씨",
		["애드온최종테스트 - 아즈샤라"] = "와우하는아저씨",
		["와우하는아저씌 - 하이잘"] = "와우하는아저씨",
		["회색빛의폭스 - 아즈샤라"] = "와우하는아저씨",
		["와저씨애돈테스트 - 아즈샤라"] = "와우하는아저씨",
		["네번째테스트 - 아즈샤라"] = "와우하는아저씨",
		["일곱번째테스트 - 아즈샤라"] = "와우하는아저씨",
		["Wagerssii - 아즈샤라"] = "와우하는아저씨",
		["회색빛의도사 - 아즈샤라"] = "와우하는아저씨",
		["Wagersi - 아즈샤라"] = "와우하는아저씨",
		["회색빛의보스 - 아즈샤라"] = "와우하는아저씨",
		["와저씌 - 하이잘"] = "와우하는아저씨",
		["여섯번째테스트 - 아즈샤라"] = "와우하는아저씨",
		["회색빛의희망 - 하이잘"] = "Default",
		["던던 - 아즈샤라"] = "힐러용",
	},
	["global"] = {
		["disableElvMsg"] = true,
		["oodChk"] = 210705,
		["oodVer"] = 2610,
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
			["char"] = {
				["던던 - 아즈샤라"] = {
					"힐러용", -- [1]
					"힐러용", -- [2]
					"Default", -- [3]
					["enabled"] = true,
				},
			},
		},
	},
	["cooldowns"] = {
		[323764] = {
			["type"] = "covenant",
			["buff"] = 323764,
			["duration"] = {
				["default"] = 120,
			},
			["name"] = "영혼 소집",
			["charges"] = {
				["default"] = 1,
			},
			["class"] = "DRUID",
			["spec"] = {
				321077, -- [1]
			},
			["icon"] = 3636839,
			["spellID"] = 323764,
		},
		[328231] = {
			["type"] = "covenant",
			["buff"] = 328231,
			["duration"] = {
				["default"] = 120,
			},
			["name"] = "야생 영혼",
			["charges"] = {
				["default"] = 1,
			},
			["class"] = "HUNTER",
			["spec"] = {
				321077, -- [1]
			},
			["icon"] = 3636840,
			["spellID"] = 328231,
		},
		[324724] = {
			["type"] = "covenant",
			["buff"] = 324724,
			["duration"] = {
				["default"] = 60,
			},
			["name"] = "부정한 폭발",
			["charges"] = {
				["default"] = 1,
			},
			["class"] = "PRIEST",
			["spec"] = {
				321078, -- [1]
			},
			["icon"] = 3578229,
			["spellID"] = 324724,
		},
	},
	["version"] = 2.51,
	["profiles"] = {
		["Default"] = {
			["General"] = {
				["textures"] = {
					["statusBar"] = {
						["BG"] = "Glamour7",
						["bar"] = "Glamour",
					},
				},
				["fonts"] = {
					["statusBar"] = {
						["flag"] = "OUTLINE",
						["font"] = "[WoW] 데미지 글꼴",
						["size"] = 18,
					},
					["icon"] = {
						["size"] = 19,
						["font"] = "[WoW] 데미지 글꼴",
					},
					["anchor"] = {
						["flag"] = "OUTLINE",
						["font"] = "[WoW] 기본 글꼴",
					},
				},
			},
			["Party"] = {
				["visibility"] = {
					["none"] = true,
					["finder"] = true,
				},
				["party"] = {
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 74.9864631676719,
							["x"] = 531.5911599930114,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 213.6545460056987,
							["x"] = 1054.256695185526,
						},
					},
					["extraBars"] = {
						["interruptBar"] = {
							["growUpward"] = true,
							["reverseFill"] = false,
							["scale"] = 0.79,
							["paddingY"] = 1,
							["locked"] = true,
							["statusBarWidth"] = 220,
						},
					},
					["general"] = {
						["showPlayerEx"] = false,
						["showPlayer"] = true,
					},
					["position"] = {
						["locked"] = true,
						["offsetY"] = 2,
						["columns"] = 8,
						["paddingX"] = 1,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["anchor"] = "TOPRIGHT",
						["offsetX"] = 6,
					},
					["spells"] = {
						["326059"] = false,
						["325886"] = false,
						["317320"] = false,
						["328923"] = false,
						["320674"] = false,
						["308491"] = true,
						["310143"] = false,
						["328231"] = true,
						["324631"] = false,
						["325028"] = false,
						["324724"] = true,
						["323673"] = true,
						["300728"] = false,
						["323436"] = false,
						["324149"] = false,
						["327661"] = true,
						["323764"] = true,
						["324386"] = false,
						["325013"] = true,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["icons"] = {
						["borderPixels"] = 2,
						["counterScale"] = 0.8,
						["chargeScale"] = 1,
						["showTooltip"] = true,
						["scale"] = 0.9000000000000001,
					},
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
				},
				["noneZoneSetting"] = "party",
				["arena"] = {
					["general"] = {
						["showPlayerEx"] = false,
						["showPlayer"] = true,
						["zoneSelected"] = "party",
					},
					["extraBars"] = {
						["interruptBar"] = {
							["enabled"] = true,
							["growUpward"] = true,
							["reverseFill"] = false,
							["scale"] = 0.8,
							["paddingY"] = 1,
							["locked"] = true,
							["statusBarWidth"] = 230,
						},
					},
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
					["position"] = {
						["columns"] = 8,
						["offsetY"] = 1,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["anchor"] = "TOPRIGHT",
						["uf"] = "ElvUI",
					},
					["spells"] = {
						["326059"] = false,
						["325886"] = false,
						["317320"] = false,
						["324724"] = true,
						["320674"] = false,
						["308491"] = true,
						["310143"] = false,
						["323764"] = true,
						["327661"] = true,
						["325028"] = false,
						["328923"] = false,
						["300728"] = false,
						["323436"] = false,
						["323673"] = true,
						["324149"] = false,
						["324631"] = false,
						["325013"] = true,
						["324386"] = false,
						["328231"] = true,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["icons"] = {
						["borderPixels"] = 2,
						["counterScale"] = 0.8,
						["chargeScale"] = 1,
						["showTooltip"] = true,
						["scale"] = 0.9000000000000001,
					},
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 206.5421828834224,
							["x"] = 1027.235055164507,
						},
					},
				},
			},
		},
		["MyProfile"] = {
			["Party"] = {
				["party"] = {
					["manualPos"] = {
						["interruptBar"] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
						["raidCDBar"] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
					},
				},
			},
		},
		["와저씨21:9"] = {
			["General"] = {
				["textures"] = {
					["statusBar"] = {
						["BG"] = "Glamour7",
						["bar"] = "Glamour",
					},
				},
				["fonts"] = {
					["statusBar"] = {
						["flag"] = "OUTLINE",
						["font"] = "[WoW] 데미지 글꼴",
						["size"] = 18,
					},
					["icon"] = {
						["size"] = 19,
						["font"] = "[WoW] 데미지 글꼴",
					},
					["anchor"] = {
						["flag"] = "OUTLINE",
						["font"] = "[WoW] 기본 글꼴",
					},
				},
			},
			["Party"] = {
				["visibility"] = {
					["none"] = true,
					["finder"] = true,
				},
				["party"] = {
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
					["extraBars"] = {
						["interruptBar"] = {
							["growUpward"] = true,
							["reverseFill"] = false,
							["scale"] = 0.79,
							["paddingY"] = 1,
							["locked"] = true,
							["statusBarWidth"] = 220,
						},
						["raidCDBar"] = {
							["enabled"] = false,
						},
					},
					["general"] = {
						["showPlayerEx"] = false,
						["showPlayer"] = true,
					},
					["position"] = {
						["locked"] = true,
						["offsetY"] = 2,
						["columns"] = 8,
						["paddingX"] = 1,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["anchor"] = "TOPRIGHT",
						["offsetX"] = 6,
					},
					["spells"] = {
						["326059"] = false,
						["325886"] = false,
						["317320"] = false,
						["324724"] = true,
						["320674"] = false,
						["308491"] = true,
						["310143"] = false,
						["323764"] = true,
						["324631"] = false,
						["325028"] = false,
						["328923"] = false,
						["327661"] = true,
						["300728"] = false,
						["323436"] = false,
						["324149"] = false,
						["323673"] = true,
						["325013"] = true,
						["324386"] = false,
						["328231"] = true,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["icons"] = {
						["borderPixels"] = 2,
						["counterScale"] = 0.8,
						["chargeScale"] = 1,
						["showTooltip"] = true,
						["scale"] = 1.05,
					},
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 74.9864631676719,
							["x"] = 531.5911599930114,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 501.83202003318,
							["x"] = 187.8049762709816,
						},
					},
				},
				["noneZoneSetting"] = "party",
				["arena"] = {
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 206.5421828834224,
							["x"] = 1027.235055164507,
						},
					},
					["extraBars"] = {
						["interruptBar"] = {
							["enabled"] = true,
							["growUpward"] = true,
							["reverseFill"] = false,
							["scale"] = 0.8,
							["paddingY"] = 1,
							["locked"] = true,
							["statusBarWidth"] = 230,
						},
					},
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
					["position"] = {
						["columns"] = 8,
						["offsetY"] = 1,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["anchor"] = "TOPRIGHT",
						["uf"] = "ElvUI",
					},
					["spells"] = {
						["326059"] = false,
						["323673"] = true,
						["317320"] = false,
						["324724"] = true,
						["320674"] = false,
						["308491"] = true,
						["310143"] = false,
						["323764"] = true,
						["327661"] = true,
						["325028"] = false,
						["328923"] = false,
						["325886"] = false,
						["325013"] = true,
						["328231"] = true,
						["324149"] = false,
						["300728"] = false,
						["323436"] = false,
						["324386"] = false,
						["324631"] = false,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["icons"] = {
						["borderPixels"] = 2,
						["counterScale"] = 0.8,
						["chargeScale"] = 1,
						["showTooltip"] = true,
						["scale"] = 0.9000000000000001,
					},
					["general"] = {
						["zoneSelected"] = "party",
						["showPlayer"] = true,
						["showPlayerEx"] = false,
					},
				},
			},
		},
		["힐러용"] = {
			["General"] = {
				["textures"] = {
					["statusBar"] = {
						["BG"] = "Simpy7",
						["bar"] = "Simpy7",
					},
				},
				["fonts"] = {
					["statusBar"] = {
						["flag"] = "OUTLINE",
						["font"] = "데미지 글꼴",
						["size"] = 20,
					},
					["icon"] = {
						["font"] = "데미지 글꼴",
					},
				},
			},
			["Party"] = {
				["party"] = {
					["extraBars"] = {
						["interruptBar"] = {
							["scale"] = 0.8,
							["locked"] = true,
							["statusBarWidth"] = 220,
						},
					},
					["manualPos"] = {
						{
							["y"] = 164.5864416337063,
							["x"] = 634.7020561258032,
						}, -- [1]
						{
							["y"] = 164.5868517899471,
							["x"] = 833.1025595037063,
						}, -- [2]
						{
							["y"] = 163.8755432120961,
							["x"] = 535.857956772641,
						}, -- [3]
						{
							["y"] = 163.1647131498594,
							["x"] = 437.7247167785899,
						}, -- [4]
						{
							["y"] = 162.4533166813853,
							["x"] = 734.9684991971735,
						}, -- [5]
						["interruptBar"] = {
							["y"] = 220.7646630342752,
							["x"] = 1032.92349253736,
						},
						["raidCDBar"] = {
							["y"] = 537.2088942424452,
							["x"] = 0,
						},
					},
					["position"] = {
						["attachMore"] = "BOTTOMRIGHT",
						["offsetX"] = 0,
						["growUpward"] = true,
						["locked"] = true,
						["columns"] = 4,
						["uf"] = "ElvUI",
						["detached"] = true,
					},
				},
			},
		},
		["와우하는아저씨"] = {
			["Party"] = {
				["party"] = {
					["extraBars"] = {
						["interruptBar"] = {
							["scale"] = 0.6100000000000001,
							["statusBarWidth"] = 296,
							["growUpward"] = true,
							["paddingY"] = 1,
							["reverseFill"] = false,
						},
					},
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
					["spells"] = {
						["326059"] = false,
						["216331"] = false,
						["8143"] = false,
						["33891"] = false,
						["22812"] = false,
						["212295"] = false,
						["8122"] = false,
						["235219"] = false,
						["6940"] = true,
						["328923"] = false,
						["104773"] = false,
						["59752"] = false,
						["114052"] = false,
						["15286"] = true,
						["210918"] = false,
						["213602"] = false,
						["205636"] = true,
						["108968"] = false,
						["109964"] = false,
						["53480"] = false,
						["231895"] = false,
						["210256"] = false,
						["323436"] = false,
						["265202"] = true,
						["236320"] = false,
						["204336"] = false,
						["34477"] = true,
						["79206"] = false,
						["327661"] = false,
						["324386"] = false,
						["207399"] = false,
						["198838"] = false,
						["31884"] = false,
						["106839"] = false,
						["324724"] = false,
						["215982"] = false,
						["64044"] = false,
						["79140"] = false,
						["325013"] = false,
						["197268"] = false,
						["323673"] = false,
						["30884"] = false,
						["325028"] = false,
						["29166"] = true,
						["47536"] = false,
						["64843"] = true,
						["86949"] = false,
						["324149"] = false,
						["740"] = true,
						["310143"] = false,
						["328231"] = false,
						["324631"] = false,
						["325886"] = false,
						["48020"] = false,
						["20711"] = false,
						["5246"] = false,
						["323764"] = false,
						["300728"] = false,
						["192058"] = true,
						["47585"] = false,
						["317320"] = false,
						["320674"] = false,
						["108238"] = false,
						["308491"] = false,
						["204018"] = true,
						["108280"] = true,
						["19236"] = false,
					},
					["icons"] = {
						["counterScale"] = 0.8,
						["scale"] = 1.1,
						["borderPixels"] = 2,
						["showTooltip"] = true,
						["chargeScale"] = 1,
					},
					["position"] = {
						["anchor"] = "TOPRIGHT",
						["columns"] = 8,
						["paddingX"] = 1,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["offsetX"] = 6,
						["locked"] = true,
						["offsetY"] = 2,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["general"] = {
						["showPlayerEx"] = false,
						["showPlayer"] = true,
					},
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 74.9864631676719,
							["x"] = 531.5911599930114,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 541.121081655001,
							["x"] = 191.5391363437666,
						},
					},
				},
				["noneZoneSetting"] = "party",
				["arena"] = {
					["extraBars"] = {
						["interruptBar"] = {
							["scale"] = 0.8,
							["statusBarWidth"] = 230,
							["growUpward"] = true,
							["locked"] = true,
							["paddingY"] = 1,
							["enabled"] = true,
							["reverseFill"] = false,
						},
					},
					["manualPos"] = {
						{
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						}, -- [1]
						[5] = {
							["y"] = 384.3199914097786,
							["x"] = 682.3467034983623,
						},
						["raidCDBar"] = {
							["y"] = 660.9421727267909,
							["x"] = 0,
						},
						["interruptBar"] = {
							["y"] = 206.5421828834224,
							["x"] = 1027.235055164507,
						},
					},
					["spells"] = {
						["326059"] = false,
						["327661"] = true,
						["328231"] = true,
						["324631"] = false,
						["323436"] = false,
						["325886"] = false,
						["324724"] = true,
						["320674"] = false,
						["325013"] = true,
						["310143"] = false,
						["323673"] = true,
						["317320"] = false,
						["325028"] = false,
						["324149"] = false,
						["308491"] = true,
						["323764"] = true,
						["300728"] = false,
						["328923"] = false,
						["324386"] = false,
					},
					["icons"] = {
						["counterScale"] = 0.8,
						["chargeScale"] = 1,
						["scale"] = 0.9000000000000001,
						["borderPixels"] = 2,
						["showTooltip"] = true,
					},
					["position"] = {
						["columns"] = 8,
						["attach"] = "TOPLEFT",
						["preset"] = "TOPLEFT",
						["uf"] = "ElvUI",
						["anchor"] = "TOPRIGHT",
						["offsetY"] = 1,
					},
					["priority"] = {
						["covenant"] = 20,
					},
					["highlight"] = {
						["glowColor"] = "bags-glow-purple",
					},
					["general"] = {
						["showPlayerEx"] = false,
						["showPlayer"] = true,
						["zoneSelected"] = "party",
					},
				},
				["visibility"] = {
					["none"] = true,
				},
			},
			["General"] = {
				["fonts"] = {
					["statusBar"] = {
						["font"] = "[WoW] 데미지 글꼴",
						["flag"] = "OUTLINE",
						["size"] = 18,
					},
					["anchor"] = {
						["font"] = "[WoW] 기본 글꼴",
						["flag"] = "OUTLINE",
					},
					["icon"] = {
						["font"] = "[WoW] 데미지 글꼴",
						["size"] = 19,
					},
				},
				["textures"] = {
					["statusBar"] = {
						["BG"] = "Glamour7",
						["bar"] = "Glamour",
					},
				},
			},
		},
	},
}
