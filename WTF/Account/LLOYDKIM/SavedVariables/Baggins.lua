
BagginsDB = {
	["char"] = {
		["회색빛의샤먼 - 아즈샤라"] = {
			["lastNumItemButtons"] = 104,
		},
	},
	["profileKeys"] = {
		["회색빛의샤먼 - 아즈샤라"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["skin"] = "oSkin",
			["ranMigrations"] = {
				["0001_ItemTypes_7.0.3"] = true,
			},
			["categories"] = {
				["응급치료"] = {
					{
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 7,
					}, -- [1]
					["name"] = "응급치료",
				},
				["무기"] = {
					{
						["itype"] = 2,
						["type"] = "ItemType",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = 4,
						["isubtype"] = 6,
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = 2,
						["isubtype"] = 14,
					}, -- [3]
					["name"] = "무기",
				},
				["Recipes"] = {
					{
						["itype"] = 9,
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "Recipes",
				},
				["기타"] = {
					{
						["type"] = "Other",
					}, -- [1]
					["name"] = "기타",
				},
				["Tools"] = {
					{
						["setname"] = "Tradeskill.Tool",
						["type"] = "PTSet",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool.Fishing",
					}, -- [2]
					["name"] = "Tools",
				},
				["가방"] = {
					{
						["bagid"] = 1,
						["type"] = "Bag",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 2,
					}, -- [2]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 3,
					}, -- [3]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 4,
					}, -- [4]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 0,
					}, -- [5]
					["name"] = "가방",
				},
				["Elemental"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 10,
					}, -- [1]
					["name"] = "Elemental",
				},
				["Fishing"] = {
					{
						["setname"] = "Tradeskill.Tool.Fishing",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "Fishing",
				},
				["퀘스트"] = {
					{
						["itype"] = 12,
						["type"] = "ItemType",
					}, -- [1]
					{
						["text"] = "ITEM_BIND_QUEST",
						["type"] = "Tooltip",
					}, -- [2]
					["name"] = "퀘스트",
				},
				["천"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 5,
					}, -- [1]
					["name"] = "천",
				},
				["In Use"] = {
					{
						["anyset"] = true,
						["type"] = "EquipmentSet",
					}, -- [1]
					["name"] = "In Use",
				},
				["쓰레기 아이템"] = {
					{
						["itype"] = 4,
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "ItemType",
						["itype"] = 2,
					}, -- [2]
					{
						["operation"] = "AND",
						["type"] = "Quality",
						["comp"] = "<=",
						["quality"] = 1,
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = 12,
					}, -- [5]
					["name"] = "쓰레기 아이템",
				},
				["기계공학"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 1,
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 0,
					}, -- [2]
					["name"] = "부품",
				},
				["요리"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 8,
					}, -- [1]
					["name"] = "요리",
				},
				["Jewelcrafting"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 4,
					}, -- [1]
					["name"] = "Jewelcrafting",
				},
				["기타 소비 용품"] = {
					{
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 8,
					}, -- [1]
					["name"] = "기타 소비 용품",
				},
				["Item Enhancements"] = {
					{
						["itype"] = 8,
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "Item Enhancements",
				},
				["Flasks & Elixirs"] = {
					{
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 3,
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 2,
					}, -- [2]
					["name"] = "Flasks & Elixirs",
				},
				["가죽"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 6,
					}, -- [1]
					["name"] = "가죽",
				},
				["물약"] = {
					{
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 1,
					}, -- [1]
					["name"] = "물약",
				},
				["방어구"] = {
					{
						["itype"] = 4,
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = 4,
						["isubtype"] = 6,
					}, -- [2]
					["name"] = "방어구",
				},
				["신규"] = {
					{
						["name"] = "신규",
						["type"] = "NewItems",
					}, -- [1]
				},
				["쓰레기"] = {
					{
						["type"] = "Quality",
						["comp"] = "<=",
						["quality"] = 0,
					}, -- [1]
					["name"] = "쓰레기",
				},
				["소비 용품"] = {
					{
						["itype"] = 0,
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "소비 용품",
				},
				["Misc Trade Goods"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 11,
					}, -- [1]
					["name"] = "기타",
				},
				["전문기술 재료"] = {
					{
						["itype"] = 7,
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "전문기술 재료",
				},
				["Item Enchantment"] = {
					{
						["itype"] = 8,
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "Item Enchantment",
				},
				["Inscription"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 16,
					}, -- [1]
					["name"] = "Inscription",
				},
				["공란"] = {
					{
						["type"] = "Empty",
					}, -- [1]
					["name"] = "공란",
				},
				["은행가방"] = {
					{
						["bagid"] = -1,
						["type"] = "Bag",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 5,
					}, -- [2]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 6,
					}, -- [3]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 7,
					}, -- [4]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 8,
					}, -- [5]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 9,
					}, -- [6]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 10,
					}, -- [7]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 11,
					}, -- [8]
					["name"] = "은행가방",
				},
				["마법부여"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 12,
					}, -- [1]
					["name"] = "마법부여",
				},
				["Food & Drink"] = {
					{
						["type"] = "ItemType",
						["itype"] = 0,
						["isubtype"] = 5,
					}, -- [1]
					["name"] = "Food & Drink",
				},
				["Metal & Stone"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 7,
					}, -- [1]
					["name"] = "Metal & Stone",
				},
				["Herb"] = {
					{
						["type"] = "ItemType",
						["itype"] = 7,
						["isubtype"] = 9,
					}, -- [1]
					["name"] = "Herb",
				},
			},
			["bags"] = {
				{
					["y"] = 261.1200332260123,
					["x"] = 1195.733410773275,
					["name"] = "기타",
					["sections"] = {
						{
							["cats"] = {
								"신규", -- [1]
							},
							["name"] = "신규",
							["allowdupes"] = true,
						}, -- [1]
						{
							["name"] = "기타",
							["cats"] = {
								"기타", -- [1]
							},
						}, -- [2]
						{
							["name"] = "쓰레기",
							["cats"] = {
								"쓰레기", -- [1]
								"쓰레기 아이템", -- [2]
							},
						}, -- [3]
						{
							["name"] = "공란",
							["cats"] = {
								"공란", -- [1]
							},
						}, -- [4]
					},
					["openWithAll"] = true,
				}, -- [1]
				{
					["y"] = 545.9200659227354,
					["x"] = 1195.733410773275,
					["name"] = "착용 아이템",
					["sections"] = {
						{
							["name"] = "In Use",
							["cats"] = {
								"In Use", -- [1]
							},
						}, -- [1]
						{
							["name"] = "방어구",
							["cats"] = {
								"방어구", -- [1]
							},
						}, -- [2]
						{
							["name"] = "무기",
							["cats"] = {
								"무기", -- [1]
							},
						}, -- [3]
					},
					["openWithAll"] = true,
				}, -- [2]
				{
					["y"] = 606.7200255012503,
					["x"] = 1246.577862761813,
					["name"] = "퀘스트",
					["sections"] = {
						{
							["name"] = "퀘스트 아이템",
							["cats"] = {
								"퀘스트", -- [1]
							},
						}, -- [1]
					},
					["openWithAll"] = true,
				}, -- [3]
				{
					["y"] = 266.2399745178227,
					["x"] = 1058.133491973873,
					["name"] = "소비 용품",
					["sections"] = {
						{
							["name"] = "Food & Drink",
							["cats"] = {
								"Food & Drink", -- [1]
							},
						}, -- [1]
						{
							["name"] = "응급치료",
							["cats"] = {
								"응급치료", -- [1]
							},
						}, -- [2]
						{
							["name"] = "물약",
							["cats"] = {
								"물약", -- [1]
							},
						}, -- [3]
						{
							["name"] = "Flasks & Elixirs",
							["cats"] = {
								"Flasks & Elixirs", -- [1]
							},
						}, -- [4]
						{
							["name"] = "Item Enhancements",
							["cats"] = {
								"Item Enhancements", -- [1]
							},
						}, -- [5]
						{
							["name"] = "기타",
							["cats"] = {
								"기타 소비 용품", -- [1]
							},
						}, -- [6]
					},
					["openWithAll"] = true,
				}, -- [4]
				{
					["y"] = 475.5199893712997,
					["x"] = 1058.133491973873,
					["name"] = "직업 용품",
					["sections"] = {
						{
							["name"] = "Elemental",
							["cats"] = {
								"Elemental", -- [1]
							},
						}, -- [1]
						{
							["name"] = "천",
							["cats"] = {
								"천", -- [1]
							},
						}, -- [2]
						{
							["name"] = "가죽",
							["cats"] = {
								"가죽", -- [1]
							},
						}, -- [3]
						{
							["name"] = "Metal & Stone",
							["cats"] = {
								"Metal & Stone", -- [1]
							},
						}, -- [4]
						{
							["name"] = "요리",
							["cats"] = {
								"요리", -- [1]
							},
						}, -- [5]
						{
							["name"] = "Herb",
							["cats"] = {
								"Herb", -- [1]
							},
						}, -- [6]
						{
							["name"] = "마법부여",
							["cats"] = {
								"마법부여", -- [1]
							},
						}, -- [7]
						{
							["name"] = "Jewelcrafting",
							["cats"] = {
								"Jewelcrafting", -- [1]
							},
						}, -- [8]
						{
							["name"] = "기계공학",
							["cats"] = {
								"기계공학", -- [1]
							},
						}, -- [9]
						{
							["name"] = "Inscription",
							["cats"] = {
								"Inscription", -- [1]
							},
						}, -- [10]
						{
							["name"] = "Misc Trade Goods",
							["cats"] = {
								"Misc Trade Goods", -- [1]
							},
						}, -- [11]
						{
							["name"] = "Item Enchantment",
							["cats"] = {
								"Item Enchantment", -- [1]
							},
						}, -- [12]
						{
							["name"] = "Recipes",
							["cats"] = {
								"Recipes", -- [1]
							},
						}, -- [13]
					},
					["openWithAll"] = true,
				}, -- [5]
				{
					["y"] = 502.3999497079858,
					["x"] = 1081.244507082301,
					["name"] = "Professions",
					["sections"] = {
						{
							["name"] = "Fishing",
							["cats"] = {
								"Fishing", -- [1]
							},
						}, -- [1]
						{
							["name"] = "Tools",
							["cats"] = {
								"Tools", -- [1]
							},
						}, -- [2]
					},
					["openWithAll"] = true,
				}, -- [6]
				{
					["sections"] = {
						{
							["name"] = "방어구",
							["cats"] = {
								"방어구", -- [1]
							},
						}, -- [1]
						{
							["name"] = "무기",
							["cats"] = {
								"무기", -- [1]
							},
						}, -- [2]
					},
					["openWithAll"] = true,
					["name"] = "은행 착용장비",
					["isBank"] = true,
				}, -- [7]
				{
					["sections"] = {
						{
							["name"] = "퀘스트 아이템",
							["cats"] = {
								"퀘스트", -- [1]
							},
						}, -- [1]
					},
					["openWithAll"] = true,
					["name"] = "은행 퀘스트아이템",
					["isBank"] = true,
				}, -- [8]
				{
					["sections"] = {
						{
							["name"] = "Food & Drink",
							["cats"] = {
								"Food & Drink", -- [1]
							},
						}, -- [1]
						{
							["name"] = "응급치료",
							["cats"] = {
								"응급치료", -- [1]
							},
						}, -- [2]
						{
							["name"] = "물약",
							["cats"] = {
								"물약", -- [1]
							},
						}, -- [3]
						{
							["name"] = "Flasks & Elixirs",
							["cats"] = {
								"Flasks & Elixirs", -- [1]
							},
						}, -- [4]
						{
							["name"] = "Item Enhancements",
							["cats"] = {
								"Item Enhancements", -- [1]
							},
						}, -- [5]
						{
							["name"] = "기타",
							["cats"] = {
								"기타 소비 용품", -- [1]
							},
						}, -- [6]
					},
					["openWithAll"] = true,
					["name"] = "은행 소비용품",
					["isBank"] = true,
				}, -- [9]
				{
					["sections"] = {
						{
							["name"] = "Elemental",
							["cats"] = {
								"Elemental", -- [1]
							},
						}, -- [1]
						{
							["name"] = "천",
							["cats"] = {
								"천", -- [1]
							},
						}, -- [2]
						{
							["name"] = "가죽",
							["cats"] = {
								"가죽", -- [1]
							},
						}, -- [3]
						{
							["name"] = "Metal & Stone",
							["cats"] = {
								"Metal & Stone", -- [1]
							},
						}, -- [4]
						{
							["name"] = "요리",
							["cats"] = {
								"요리", -- [1]
							},
						}, -- [5]
						{
							["name"] = "Herb",
							["cats"] = {
								"Herb", -- [1]
							},
						}, -- [6]
						{
							["name"] = "마법부여",
							["cats"] = {
								"마법부여", -- [1]
							},
						}, -- [7]
						{
							["name"] = "Jewelcrafting",
							["cats"] = {
								"Jewelcrafting", -- [1]
							},
						}, -- [8]
						{
							["name"] = "기계공학",
							["cats"] = {
								"기계공학", -- [1]
							},
						}, -- [9]
						{
							["name"] = "Inscription",
							["cats"] = {
								"Inscription", -- [1]
							},
						}, -- [10]
						{
							["name"] = "Misc Trade Goods",
							["cats"] = {
								"Misc Trade Goods", -- [1]
							},
						}, -- [11]
						{
							["name"] = "Item Enchantment",
							["cats"] = {
								"Item Enchantment", -- [1]
							},
						}, -- [12]
						{
							["name"] = "Recipes",
							["cats"] = {
								"Recipes", -- [1]
							},
						}, -- [13]
					},
					["openWithAll"] = true,
					["name"] = "은행 전문기술용품",
					["isBank"] = true,
				}, -- [10]
				{
					["sections"] = {
						{
							["name"] = "기타",
							["cats"] = {
								"기타", -- [1]
							},
						}, -- [1]
						{
							["name"] = "쓰레기",
							["cats"] = {
								"쓰레기", -- [1]
								"쓰레기 아이템", -- [2]
							},
						}, -- [2]
						{
							["name"] = "공란",
							["cats"] = {
								"공란", -- [1]
							},
						}, -- [3]
					},
					["openWithAll"] = true,
					["name"] = "은행 기타품목",
					["isBank"] = true,
				}, -- [11]
			},
		},
	},
}
