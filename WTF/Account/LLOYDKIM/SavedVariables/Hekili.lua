
HekiliDB = {
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profileKeys"] = {
		["Wagerssi - 아즈샤라"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["runOnce"] = {
				["resetPotionsToDefaults_20190717"] = true,
				["autoconvertDelaySweepToExtend_20190729"] = true,
				["autoconvertGlowsForCustomGlow_20190326"] = true,
				["resetAllPotions_20201209"] = true,
				["resetRogueMfDOption_20200226"] = true,
				["enableAllOfTheThings_20180820"] = true,
				["forceEnableEnhancedRecheckBoomkin_20210712"] = true,
				["autoconvertDisplayToggle_20190621_1"] = true,
				["resetGlobalCooldownSync_20210403"] = true,
				["resetAberrantPackageDates_20190728_1"] = true,
			},
			["displays"] = {
				["Interrupts"] = {
					["rel"] = "CENTER",
					["y"] = 95.833251953125,
					["x"] = -665.8334350585938,
				},
				["Cooldowns"] = {
					["rel"] = "CENTER",
					["y"] = 152.5001983642578,
					["x"] = -501.6663513183594,
				},
				["Primary"] = {
					["rel"] = "CENTER",
					["y"] = 40.00018310546875,
					["x"] = -610.8336791992188,
				},
				["AOE"] = {
					["rel"] = "CENTER",
					["y"] = 95.83358764648438,
					["x"] = -610.833740234375,
				},
				["Defensives"] = {
					["rel"] = "CENTER",
					["y"] = 40.00012588500977,
					["x"] = -665.8331909179688,
				},
			},
			["packs"] = {
				["Marksmanship"] = {
					["source"] = "# https://github.com/simulationcraft/simc/",
					["builtIn"] = true,
					["date"] = 20210723,
					["author"] = "SimC",
					["desc"] = "Marksmanship Hunter\nJuly 20, 2021\n\nChanges:\n- Newfound Resolve is not a mechanic the addon can/will manage.\n- Resynced addon priority with SimC APL.",
					["lists"] = {
						["trickshots"] = {
							{
								["enabled"] = true,
								["criteria"] = "talent.steady_focus.enabled & in_flight & buff.steady_focus.remains < 5",
								["action"] = "steady_shot",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.pouch_of_razor_fragments.enabled & buff.flayers_mark.up",
								["action"] = "kill_shot",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.pouch_of_razor_fragments.enabled",
								["action"] = "flayed_shot",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "( covenant.kyrian & cooldown.resonating_arrow.remains < gcd || ! covenant.kyrian & ! covenant.night_fae || covenant.night_fae & ( cooldown.wild_spirits.remains < gcd || cooldown.wild_spirits.remains > 30 ) || target.time_to_die < 10 || cooldown.resonating_arrow.remains > 10 & active_enemies > 3 ) & ( ! raid_event.adds.exists || raid_event.adds.remains > 9 || ! covenant.kyrian )",
								["action"] = "double_tap",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled & tar_trap.remains < gcd & cooldown.flare.remains < gcd",
								["action"] = "tar_trap",
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "tar_trap.up & runeforge.soulforge_embers.enabled",
								["action"] = "flare",
								["line_cd"] = "25",
							}, -- [6]
							{
								["action"] = "explosive_shot",
								["enabled"] = true,
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || raid_event.adds.remains > 10 || active_enemies >= raid_event.adds.count * 2",
								["action"] = "wild_spirits",
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.resonating_arrow.remains < gcd & ( ! talent.explosive_shot.enabled || buff.bloodlust.up ) || ! covenant.kyrian || cooldown.resonating_arrow.remains > 10 || boss & fight_remains < 5",
								["action"] = "wailing_arrow",
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "( cooldown.volley.remains < gcd || ! talent.volley.enabled || target.time_to_die < 12 ) & ( ! raid_event.adds.exists || raid_event.adds.remains > 9 || active_enemies >= raid_event.adds.count * 2 )",
								["action"] = "resonating_arrow",
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "buff.resonating_arrow.up || ! covenant.kyrian",
								["action"] = "volley",
							}, -- [11]
							{
								["action"] = "barrage",
								["enabled"] = true,
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "buff.resonating_arrow.up || cooldown.resonating_arrow.remains > 10 || ! covenant.kyrian || boss & fight_remains < 20",
								["action"] = "trueshot",
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.surging_shots.enabled & ( cooldown.resonating_arrow.remains > 10 || ! covenant.kyrian || ! talent.double_tap.enabled ) & buff.trick_shots.remains >= execute_time",
								["action"] = "rapid_fire",
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "buff.trick_shots.remains >= execute_time & ( buff.precise_shots.down || full_recharge_time < cast_time + gcd || buff.trueshot.up )",
								["action"] = "aimed_shot",
								["cycle_targets"] = 1,
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [16]
							{
								["enabled"] = true,
								["criteria"] = "( cooldown.resonating_arrow.remains > 10 & runeforge.surging_shots.enabled || ! covenant.kyrian || ! runeforge.surging_shots.enabled || ! talent.double_tap.enabled ) & buff.trick_shots.remains >= execute_time",
								["action"] = "rapid_fire",
							}, -- [17]
							{
								["enabled"] = true,
								["criteria"] = "buff.trick_shots.down || buff.precise_shots.up & focus > cost + action.aimed_shot.cost & ( ! talent.chimaera_shot.enabled || active_enemies > 3 )",
								["action"] = "multishot",
							}, -- [18]
							{
								["enabled"] = true,
								["criteria"] = "buff.precise_shots.up & focus > cost + action.aimed_shot.cost & active_enemies < 4",
								["action"] = "chimaera_shot",
							}, -- [19]
							{
								["enabled"] = true,
								["criteria"] = "buff.dead_eye.down",
								["action"] = "kill_shot",
							}, -- [20]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [21]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "refreshable",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "focus > cost + action.aimed_shot.cost & ( cooldown.resonating_arrow.remains > 5 || ! covenant.kyrian )",
								["action"] = "multishot",
							}, -- [24]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "tar_trap",
							}, -- [25]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "freezing_trap",
							}, -- [26]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.down",
								["action"] = "bag_of_tricks",
							}, -- [27]
							{
								["enabled"] = true,
								["criteria"] = "soulbind.pustule_eruption.enabled & buff.trueshot.down",
								["action"] = "fleshcraft",
							}, -- [28]
							{
								["action"] = "steady_shot",
								["enabled"] = true,
							}, -- [29]
						},
						["default"] = {
							{
								["action"] = "counter_shot",
								["enabled"] = true,
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.sephuzs_proclamation.enabled || soulbind.niyas_tools_poison.enabled || ( conduit.reversal_of_fortune.enabled & ! runeforge.sephuzs_proclamation.enabled )",
								["action"] = "counter_shot",
								["line_cd"] = "30",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "! target.is_player",
								["action"] = "tranquilizing_shot",
								["description"] = "Go ahead and Tranquilize NPC enemies, we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.",
							}, -- [3]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "covenant.kyrian & cooldown.trueshot.remains & cooldown.resonating_arrow.remains || ! covenant.kyrian & cooldown.trueshot.remains",
								["list_name"] = "trinkets",
							}, -- [4]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["list_name"] = "cds",
							}, -- [5]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies < 3",
								["list_name"] = "st",
							}, -- [6]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies > 2",
								["list_name"] = "trickshots",
							}, -- [7]
						},
						["precombat"] = {
							{
								["action"] = "bottled_flayedwing_toxin",
								["enabled"] = true,
							}, -- [1]
							{
								["action"] = "fleshcraft",
								["enabled"] = true,
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled",
								["action"] = "tar_trap",
							}, -- [3]
							{
								["enabled"] = true,
								["precast_time"] = "10",
								["action"] = "double_tap",
								["criteria"] = "active_enemies > 1 || ! covenant.kyrian & ! talent.volley.enabled",
							}, -- [4]
							{
								["enabled"] = true,
								["op"] = "set",
								["action"] = "variable",
								["value"] = "legendary.eagletalons_true_focus.enabled & settings.eagletalon_swap.enabled",
								["var_name"] = "etf_precast",
								["description"] = "Change to 1 to simulate ETF/SSF gearswap Trueshot precast.",
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "variable.etf_precast",
								["action"] = "trueshot",
							}, -- [6]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies < 3 & ( ! covenant.kyrian & ! talent.volley.enabled || active_enemies < 2 ) & ! variable.etf_precast",
								["action"] = "aimed_shot",
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies > 2 || ( covenant.kyrian || talent.volley.enabled ) & active_enemies = 2 || variable.etf_precast",
								["action"] = "steady_shot",
							}, -- [8]
						},
						["cds"] = {
							{
								["enabled"] = true,
								["criteria"] = "( buff.trueshot.up & buff.resonating_arrow.up & covenant.kyrian ) || ( buff.trueshot.up & buff.wild_spirits.up & covenant.night_fae ) || ( covenant.venthyr || covenant.necrolord ) & buff.trueshot.up || boss & fight_remains < 13 || ( covenant.kyrian & buff.resonating_arrow.up & fight_remains < 73 )",
								["action"] = "berserking",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.up || cooldown.trueshot.remains > 30 || boss & fight_remains < 16",
								["action"] = "blood_fury",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.up || cooldown.trueshot.remains > 30 || boss & fight_remains < 16",
								["action"] = "ancestral_call",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.up || cooldown.trueshot.remains > 30 || boss & fight_remains < 9",
								["action"] = "fireblood",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.down",
								["action"] = "lights_judgment",
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.up & ( buff.bloodlust.up || target.health.pct < 20 ) || boss & fight_remains < 26 || ( covenant.kyrian & buff.resonating_arrow.up & fight_remains < 72 )",
								["action"] = "potion",
							}, -- [6]
						},
						["st"] = {
							{
								["enabled"] = true,
								["criteria"] = "talent.steady_focus.enabled & ( prev_gcd.1.steady_shot & buff.steady_focus.remains < 5 || buff.steady_focus.down ) & ( buff.resonating_arrow.down || ! covenant.kyrian )",
								["action"] = "steady_shot",
							}, -- [1]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "( covenant.kyrian & ( cooldown.resonating_arrow.remains < gcd ) || ! covenant.kyrian & ! covenant.night_fae || covenant.night_fae & ( cooldown.wild_spirits.remains < gcd || cooldown.wild_spirits.remains > 30 ) || fight_remains < 15 ) & ( ! raid_event.adds.exists || raid_event.adds.up & ( raid_event.adds.in < 10 & raid_event.adds.remains < 3 || raid_event.adds.in > action_cooldown || active_enemies > 1 ) || ! raid_event.adds.up & ( raid_event.adds.count = 1 || raid_event.adds.in > action_cooldown ) )",
								["action"] = "double_tap",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "tar_trap.up & runeforge.soulforge_embers.enabled",
								["action"] = "flare",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled & tar_trap.remains < gcd & cooldown.flare.remains < gcd",
								["action"] = "tar_trap",
							}, -- [5]
							{
								["action"] = "explosive_shot",
								["enabled"] = true,
							}, -- [6]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || ! raid_event.adds.up & raid_event.adds.duration + raid_event.adds.in < 20 || raid_event.adds.up & raid_event.adds.remains > 19 || active_enemies > 1",
								["action"] = "wild_spirits",
							}, -- [7]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [9]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.resonating_arrow.remains < gcd & ( ! talent.explosive_shot.enabled || buff.bloodlust.up ) || ! covenant.kyrian || cooldown.resonating_arrow.remains || boss & fight_remains < 5",
								["action"] = "wailing_arrow",
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "( buff.double_tap.up || ! talent.double_tap.enabled || boss & fight_remains < 12 ) & ( ! raid_event.adds.exists || ! raid_event.adds.up & ( raid_event.adds.duration + raid_event.adds.in < 10 || raid_event.adds.count = 1 ) || raid_event.adds.up & raid_event.adds.remains > 9 || active_enemies > 1 )",
								["action"] = "resonating_arrow",
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "buff.resonating_arrow.up || ! covenant.kyrian & ( buff.precise_shots.down || ! talent.chimaera_shot.enabled || active_enemies < 2 )",
								["action"] = "volley",
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "covenant.kyrian & focus + cast_regen < focus.max & ( ( cooldown.resonating_arrow.remains < gcd * 3 & ( ! soulbind.effusive_anima_accelerator.enabled || ! talent.double_tap.enabled ) ) || talent.double_tap.enabled & cooldown.double_tap.remains < 3 )",
								["action"] = "steady_shot",
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "buff.precise_shots.down & ( covenant.venthyr || covenant.necrolord || talent.calling_the_shots.enabled ) || buff.resonating_arrow.up || buff.wild_spirits.up || buff.volley.up & active_enemies > 1 || boss & fight_remains < 25",
								["action"] = "trueshot",
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.surging_shots.enabled & talent.streamline.enabled & ( cooldown.resonating_arrow.remains > 10 || ! covenant.kyrian || ! talent.double_tap.enabled || soulbind.effusive_anima_accelerator.enabled )",
								["action"] = "rapid_fire",
							}, -- [16]
							{
								["enabled"] = true,
								["criteria"] = "buff.precise_shots.down || ( buff.trueshot.up || full_recharge_time < gcd + cast_time ) & ( ! talent.chimaera_shot.enabled || active_enemies < 2 ) || buff.trick_shots.remains > execute_time & active_enemies > 1",
								["action"] = "aimed_shot",
								["cycle_targets"] = 1,
							}, -- [17]
							{
								["enabled"] = true,
								["criteria"] = "( cooldown.resonating_arrow.remains > 10 || ! covenant.kyrian || ! talent.double_tap.enabled || soulbind.effusive_anima_accelerator.enabled ) & focus + cast_regen < focus.max & ( buff.double_tap.down || talent.streamline.enabled )",
								["action"] = "rapid_fire",
							}, -- [18]
							{
								["enabled"] = true,
								["criteria"] = "buff.precise_shots.up || focus > cost + action.aimed_shot.cost",
								["action"] = "chimaera_shot",
							}, -- [19]
							{
								["enabled"] = true,
								["criteria"] = "buff.precise_shots.up || focus > cost + action.aimed_shot.cost",
								["action"] = "arcane_shot",
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "refreshable & target.time_to_die > duration",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [21]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies > 1",
								["action"] = "barrage",
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "( cooldown.resonating_arrow.remains > 10 & runeforge.surging_shots.enabled || ! covenant.kyrian || ! talent.double_tap.enabled || soulbind.effusive_anima_accelerator.enabled ) & focus + cast_regen < focus.max & ( buff.double_tap.down || talent.streamline.enabled )",
								["action"] = "rapid_fire",
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "buff.trueshot.down",
								["action"] = "bag_of_tricks",
							}, -- [24]
							{
								["enabled"] = true,
								["criteria"] = "soulbind.pustule_eruption.enabled & buff.trueshot.down",
								["action"] = "fleshcraft",
							}, -- [25]
							{
								["action"] = "steady_shot",
								["enabled"] = true,
							}, -- [26]
						},
						["trinkets"] = {
							{
								["enabled"] = true,
								["op"] = "set",
								["action"] = "variable",
								["value"] = "buff.resonating_arrow.up || buff.trueshot.up",
								["var_name"] = "sync_up",
							}, -- [1]
							{
								["enabled"] = true,
								["op"] = "set",
								["action"] = "variable",
								["value"] = "covenant.kyrian & buff.resonating_arrow.up & buff.trueshot.up || ! covenant.kyrian & buff.trueshot.up",
								["var_name"] = "strong_sync_up",
							}, -- [2]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "strong_sync_remains",
								["value"] = "cooldown.resonating_arrow.remains <? cooldown.trueshot.remains",
								["value_else"] = "cooldown.trueshot.remains",
								["criteria"] = "buff.trueshot.down & covenant.kyrian",
							}, -- [3]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "strong_sync_remains",
								["value"] = "cooldown.resonating_arrow.remains",
								["value_else"] = "cooldown.trueshot.remains",
								["criteria"] = "buff.trueshot.up & covenant.kyrian",
							}, -- [4]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "sync_remains",
								["value"] = "cooldown.resonating_arrow.remains >? cooldown.trueshot.remains",
								["value_else"] = "cooldown.trueshot.remains",
								["criteria"] = "covenant.kyrian",
							}, -- [5]
							{
								["enabled"] = true,
								["slots"] = "trinket1",
								["action"] = "trinket1",
								["criteria"] = "( trinket.t1.has_use_buff || covenant.kyrian & trinket.t1.has_cooldown ) & ( variable.strong_sync_up & ( ! covenant.kyrian & ! trinket.t2.has_use_buff || covenant.kyrian & ! trinket.t2.has_cooldown || trinket.t2.cooldown.remains || trinket.t1.has_use_buff & ( ! trinket.t2.has_use_buff || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) || trinket.t1.has_cooldown & ! trinket.t2.has_use_buff & trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) || ! variable.strong_sync_up & ( ! trinket.t2.has_use_buff & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 ) || trinket.t2.has_use_buff & ( trinket.t1.has_use_buff & trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 ) || ( ! trinket.t1.has_use_buff || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) & ( trinket.t2.cooldown.ready & trinket.t2.cooldown.duration - 5 > variable.sync_remains & variable.sync_remains < trinket.t2.cooldown.duration / 2 || ! trinket.t2.cooldown.ready & ( trinket.t2.cooldown.remains - 5 < variable.strong_sync_remains & variable.strong_sync_remains > 20 & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || trinket.t2.cooldown.remains - 5 < variable.sync_remains & trinket.t2.cooldown.duration - 10 + variable.sync_remains < variable.strong_sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 || variable.sync_up ) || trinket.t2.cooldown.remains - 5 > variable.strong_sync_remains & ( trinket.t1.cooldown.duration - 5 < variable.strong_sync_remains || ! trinket.t1.has_use_buff & ( variable.sync_remains > trinket.t1.cooldown.duration / 2 || variable.sync_up ) ) ) ) ) ) || boss & fight_remains < variable.sync_remains ) || ! trinket.t1.has_use_buff & ! covenant.kyrian & ( trinket.t2.has_use_buff & ( ( ! variable.sync_up || trinket.t2.cooldown.remains > 5 ) & ( variable.sync_remains > 20 || trinket.t2.cooldown.remains - 5 > variable.sync_remains ) ) || ! trinket.t2.has_use_buff & ( ! trinket.t2.has_cooldown || trinket.t2.cooldown.remains || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) )",
							}, -- [6]
							{
								["enabled"] = true,
								["slots"] = "trinket2",
								["action"] = "trinket2",
								["criteria"] = "( trinket.t2.has_use_buff || covenant.kyrian & trinket.t2.has_cooldown ) & ( variable.strong_sync_up & ( ! covenant.kyrian & ! trinket.t1.has_use_buff || covenant.kyrian & ! trinket.t1.has_cooldown || trinket.t1.cooldown.remains || trinket.t2.has_use_buff & ( ! trinket.t1.has_use_buff || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) || trinket.t2.has_cooldown & ! trinket.t1.has_use_buff & trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) || ! variable.strong_sync_up & ( ! trinket.t1.has_use_buff & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 ) || trinket.t1.has_use_buff & ( trinket.t2.has_use_buff & trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 ) || ( ! trinket.t2.has_use_buff || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) & ( trinket.t1.cooldown.ready & trinket.t1.cooldown.duration - 5 > variable.sync_remains & variable.sync_remains < trinket.t1.cooldown.duration / 2 || ! trinket.t1.cooldown.ready & ( trinket.t1.cooldown.remains - 5 < variable.strong_sync_remains & variable.strong_sync_remains > 20 & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || trinket.t1.cooldown.remains - 5 < variable.sync_remains & trinket.t1.cooldown.duration - 10 + variable.sync_remains < variable.strong_sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 || variable.sync_up ) || trinket.t1.cooldown.remains - 5 > variable.strong_sync_remains & ( trinket.t2.cooldown.duration - 5 < variable.strong_sync_remains || ! trinket.t2.has_use_buff & ( variable.sync_remains > trinket.t2.cooldown.duration / 2 || variable.sync_up ) ) ) ) ) ) || boss & fight_remains < variable.sync_remains ) || ! trinket.t2.has_use_buff & ! covenant.kyrian & ( trinket.t1.has_use_buff & ( ( ! variable.sync_up || trinket.t1.cooldown.remains > 5 ) & ( variable.sync_remains > 20 || trinket.t1.cooldown.remains - 5 > variable.sync_remains ) ) || ! trinket.t1.has_use_buff & ( ! trinket.t1.has_cooldown || trinket.t1.cooldown.remains || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) )",
							}, -- [7]
						},
					},
					["version"] = 20210723,
					["warnings"] = "WARNING:  The import for 'trickshots' required some automated changes.\nLine 1: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 2: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 3: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 5: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 6: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 9: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 10: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 14: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 14: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 17: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 17: Converted 'runeforge.X' to 'runeforge.X.enabled' (2x).\nLine 18: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 25: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 26: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 28: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\n\nWARNING:  The import for 'default' required some automated changes.\nLine 2: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 2: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 2: Converted 'conduit.X' to 'conduit.X.enabled' (1x).\nLine 2: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\n\nWARNING:  The import for 'precombat' required some automated changes.\nLine 3: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 4: Converted 'talent.X' to 'talent.X.enabled' at EOL (1x).\nLine 7: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 8: Converted 'talent.X' to 'talent.X.enabled' (1x).\n\nWARNING:  The import for 'st' required some automated changes.\nLine 1: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 4: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 5: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 11: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 12: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 13: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 14: Converted 'talent.X' to 'talent.X.enabled' (2x).\nLine 14: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\nLine 15: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 16: Converted 'talent.X' to 'talent.X.enabled' (2x).\nLine 16: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 16: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\nLine 17: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 18: Converted 'talent.X' to 'talent.X.enabled' (2x).\nLine 18: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\nLine 23: Converted 'talent.X' to 'talent.X.enabled' (2x).\nLine 23: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 23: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\nLine 25: Converted 'soulbind.X' to 'soulbind.X.enabled' (1x).\n\nWARNING:  The import for 'trinkets' required some automated changes.\nLine 6: Converted SimC syntax % to Lua division operator (/) (5x).\nLine 6: Converted 'trinket.1.X' to 'trinket.t1.X' (21x).\nLine 6: Converted 'trinket.2.X' to 'trinket.t2.X' (26x).\nLine 7: Converted SimC syntax % to Lua division operator (/) (5x).\nLine 7: Converted 'trinket.1.X' to 'trinket.t1.X' (26x).\nLine 7: Converted 'trinket.2.X' to 'trinket.t2.X' (21x).\n\nThe 'use_items' action was not found in this import.\nImported 6 action lists.\n",
					["spec"] = 254,
					["profile"] = "## Marksmanship Hunter\n## July 20, 2021\n\n## Changes:\n## - Newfound Resolve is not a mechanic the addon can/will manage.\n## - Resynced addon priority with SimC APL.\n\nactions.precombat+=/bottled_flayedwing_toxin\nactions.precombat+=/fleshcraft\nactions.precombat+=/tar_trap,if=runeforge.soulforge_embers\nactions.precombat+=/double_tap,precast_time=10,if=active_enemies>1||!covenant.kyrian&!talent.volley\n# Change to 1 to simulate ETF/SSF gearswap Trueshot precast.\nactions.precombat+=/variable,name=etf_precast,value=legendary.eagletalons_true_focus.enabled&settings.eagletalon_swap.enabled\nactions.precombat+=/trueshot,if=variable.etf_precast\nactions.precombat+=/aimed_shot,if=active_enemies<3&(!covenant.kyrian&!talent.volley||active_enemies<2)&!variable.etf_precast\nactions.precombat+=/steady_shot,if=active_enemies>2||(covenant.kyrian||talent.volley)&active_enemies=2||variable.etf_precast\n\nactions+=/counter_shot\nactions+=/counter_shot,line_cd=30,if=runeforge.sephuzs_proclamation||soulbind.niyas_tools_poison||(conduit.reversal_of_fortune&!runeforge.sephuzs_proclamation)\n# Go ahead and Tranquilize NPC enemies; we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.\nactions+=/tranquilizing_shot,if=!target.is_player\nactions+=/call_action_list,name=trinkets,if=covenant.kyrian&cooldown.trueshot.remains&cooldown.resonating_arrow.remains||!covenant.kyrian&cooldown.trueshot.remains\n## Delay facing your doubt until you have put Resonating Arrow down, or if the cooldown is too long to delay facing your Doubt. If none of these conditions are able to met within the 10 seconds leeway, the sim faces your Doubt automatically.\n## actions+=/newfound_resolve,if=soulbind.newfound_resolve&(buff.resonating_arrow.up||cooldown.resonating_arrow.remains>10||fight_remains<16)\nactions+=/call_action_list,name=cds\nactions+=/call_action_list,name=st,if=active_enemies<3\nactions+=/call_action_list,name=trickshots,if=active_enemies>2\n\nactions.cds=berserking,if=(buff.trueshot.up&buff.resonating_arrow.up&covenant.kyrian)||(buff.trueshot.up&buff.wild_spirits.up&covenant.night_fae)||(covenant.venthyr||covenant.necrolord)&buff.trueshot.up||boss&fight_remains<13||(covenant.kyrian&buff.resonating_arrow.up&fight_remains<73)\nactions.cds+=/blood_fury,if=buff.trueshot.up||cooldown.trueshot.remains>30||boss&fight_remains<16\nactions.cds+=/ancestral_call,if=buff.trueshot.up||cooldown.trueshot.remains>30||boss&fight_remains<16\nactions.cds+=/fireblood,if=buff.trueshot.up||cooldown.trueshot.remains>30||boss&fight_remains<9\nactions.cds+=/lights_judgment,if=buff.trueshot.down\nactions.cds+=/potion,if=buff.trueshot.up&(buff.bloodlust.up||target.health.pct<20)||boss&fight_remains<26||(covenant.kyrian&buff.resonating_arrow.up&fight_remains<72)\n\nactions.st=steady_shot,if=talent.steady_focus&(prev_gcd.1.steady_shot&buff.steady_focus.remains<5||buff.steady_focus.down)&(buff.resonating_arrow.down||!covenant.kyrian)\nactions.st+=/kill_shot\nactions.st+=/double_tap,if=(covenant.kyrian&(cooldown.resonating_arrow.remains<gcd)||!covenant.kyrian&!covenant.night_fae||covenant.night_fae&(cooldown.wild_spirits.remains<gcd||cooldown.wild_spirits.remains>30)||fight_remains<15)&(!raid_event.adds.exists||raid_event.adds.up&(raid_event.adds.in<10&raid_event.adds.remains<3||raid_event.adds.in>cooldown||active_enemies>1)||!raid_event.adds.up&(raid_event.adds.count=1||raid_event.adds.in>cooldown))\nactions.st+=/flare,if=tar_trap.up&runeforge.soulforge_embers\nactions.st+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd\nactions.st+=/explosive_shot\nactions.st+=/wild_spirits,if=!raid_event.adds.exists||!raid_event.adds.up&raid_event.adds.duration+raid_event.adds.in<20||raid_event.adds.up&raid_event.adds.remains>19||active_enemies>1\nactions.st+=/flayed_shot\nactions.st+=/death_chakram,if=focus+cast_regen<focus.max\nactions.st+=/a_murder_of_crows\nactions.st+=/wailing_arrow,if=cooldown.resonating_arrow.remains<gcd&(!talent.explosive_shot||buff.bloodlust.up)||!covenant.kyrian||cooldown.resonating_arrow.remains||boss&fight_remains<5\nactions.st+=/resonating_arrow,if=(buff.double_tap.up||!talent.double_tap||boss&fight_remains<12)&(!raid_event.adds.exists||!raid_event.adds.up&(raid_event.adds.duration+raid_event.adds.in<10||raid_event.adds.count=1)||raid_event.adds.up&raid_event.adds.remains>9||active_enemies>1)\nactions.st+=/volley,if=buff.resonating_arrow.up||!covenant.kyrian&(buff.precise_shots.down||!talent.chimaera_shot||active_enemies<2)\nactions.st+=/steady_shot,if=covenant.kyrian&focus+cast_regen<focus.max&((cooldown.resonating_arrow.remains<gcd*3&(!soulbind.effusive_anima_accelerator||!talent.double_tap))||talent.double_tap&cooldown.double_tap.remains<3)\nactions.st+=/trueshot,if=buff.precise_shots.down&(covenant.venthyr||covenant.necrolord||talent.calling_the_shots)||buff.resonating_arrow.up||buff.wild_spirits.up||buff.volley.up&active_enemies>1||boss&fight_remains<25\nactions.st+=/rapid_fire,if=runeforge.surging_shots&talent.streamline&(cooldown.resonating_arrow.remains>10||!covenant.kyrian||!talent.double_tap||soulbind.effusive_anima_accelerator)\nactions.st+=/aimed_shot,cycle_targets=1,if=buff.precise_shots.down||(buff.trueshot.up||full_recharge_time<gcd+cast_time)&(!talent.chimaera_shot||active_enemies<2)||buff.trick_shots.remains>execute_time&active_enemies>1\nactions.st+=/rapid_fire,if=(cooldown.resonating_arrow.remains>10||!covenant.kyrian||!talent.double_tap||soulbind.effusive_anima_accelerator)&focus+cast_regen<focus.max&(buff.double_tap.down||talent.streamline)\nactions.st+=/chimaera_shot,if=buff.precise_shots.up||focus>cost+action.aimed_shot.cost\nactions.st+=/arcane_shot,if=buff.precise_shots.up||focus>cost+action.aimed_shot.cost\nactions.st+=/serpent_sting,cycle_targets=1,if=refreshable&target.time_to_die>duration\nactions.st+=/barrage,if=active_enemies>1\nactions.st+=/rapid_fire,if=(cooldown.resonating_arrow.remains>10&runeforge.surging_shots||!covenant.kyrian||!talent.double_tap||soulbind.effusive_anima_accelerator)&focus+cast_regen<focus.max&(buff.double_tap.down||talent.streamline)\nactions.st+=/bag_of_tricks,if=buff.trueshot.down\nactions.st+=/fleshcraft,if=soulbind.pustule_eruption&buff.trueshot.down\nactions.st+=/steady_shot\n\nactions.trickshots=steady_shot,if=talent.steady_focus&in_flight&buff.steady_focus.remains<5\nactions.trickshots+=/kill_shot,if=runeforge.pouch_of_razor_fragments&buff.flayers_mark.up\nactions.trickshots+=/flayed_shot,if=runeforge.pouch_of_razor_fragments\nactions.trickshots+=/double_tap,if=(covenant.kyrian&cooldown.resonating_arrow.remains<gcd||!covenant.kyrian&!covenant.night_fae||covenant.night_fae&(cooldown.wild_spirits.remains<gcd||cooldown.wild_spirits.remains>30)||target.time_to_die<10||cooldown.resonating_arrow.remains>10&active_enemies>3)&(!raid_event.adds.exists||raid_event.adds.remains>9||!covenant.kyrian)\nactions.trickshots+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd\nactions.trickshots+=/flare,line_cd=25,if=tar_trap.up&runeforge.soulforge_embers\nactions.trickshots+=/explosive_shot\nactions.trickshots+=/wild_spirits,if=!raid_event.adds.exists||raid_event.adds.remains>10||active_enemies>=raid_event.adds.count*2\nactions.trickshots+=/wailing_arrow,if=cooldown.resonating_arrow.remains<gcd&(!talent.explosive_shot||buff.bloodlust.up)||!covenant.kyrian||cooldown.resonating_arrow.remains>10||boss&fight_remains<5\nactions.trickshots+=/resonating_arrow,if=(cooldown.volley.remains<gcd||!talent.volley||target.time_to_die<12)&(!raid_event.adds.exists||raid_event.adds.remains>9||active_enemies>=raid_event.adds.count*2)\nactions.trickshots+=/volley,if=buff.resonating_arrow.up||!covenant.kyrian\nactions.trickshots+=/barrage\nactions.trickshots+=/trueshot,if=buff.resonating_arrow.up||cooldown.resonating_arrow.remains>10||!covenant.kyrian||boss&fight_remains<20\nactions.trickshots+=/rapid_fire,if=runeforge.surging_shots&(cooldown.resonating_arrow.remains>10||!covenant.kyrian||!talent.double_tap)&buff.trick_shots.remains>=execute_time\nactions.trickshots+=/aimed_shot,cycle_targets=1,if=buff.trick_shots.remains>=execute_time&(buff.precise_shots.down||full_recharge_time<cast_time+gcd||buff.trueshot.up)\nactions.trickshots+=/death_chakram,if=focus+cast_regen<focus.max\nactions.trickshots+=/rapid_fire,if=(cooldown.resonating_arrow.remains>10&runeforge.surging_shots||!covenant.kyrian||!runeforge.surging_shots||!talent.double_tap)&buff.trick_shots.remains>=execute_time\nactions.trickshots+=/multishot,if=buff.trick_shots.down||buff.precise_shots.up&focus>cost+action.aimed_shot.cost&(!talent.chimaera_shot||active_enemies>3)\nactions.trickshots+=/chimaera_shot,if=buff.precise_shots.up&focus>cost+action.aimed_shot.cost&active_enemies<4\nactions.trickshots+=/kill_shot,if=buff.dead_eye.down\nactions.trickshots+=/a_murder_of_crows\nactions.trickshots+=/flayed_shot\nactions.trickshots+=/serpent_sting,cycle_targets=1,if=refreshable\nactions.trickshots+=/multishot,if=focus>cost+action.aimed_shot.cost&(cooldown.resonating_arrow.remains>5||!covenant.kyrian)\nactions.trickshots+=/tar_trap,if=runeforge.nessingwarys_trapping_apparatus\nactions.trickshots+=/freezing_trap,if=runeforge.nessingwarys_trapping_apparatus\nactions.trickshots+=/bag_of_tricks,if=buff.trueshot.down\nactions.trickshots+=/fleshcraft,if=soulbind.pustule_eruption&buff.trueshot.down\nactions.trickshots+=/steady_shot\n\nactions.trinkets=variable,name=sync_up,value=buff.resonating_arrow.up||buff.trueshot.up\nactions.trinkets+=/variable,name=strong_sync_up,value=covenant.kyrian&buff.resonating_arrow.up&buff.trueshot.up||!covenant.kyrian&buff.trueshot.up\nactions.trinkets+=/variable,name=strong_sync_remains,op=setif,value=cooldown.resonating_arrow.remains<?cooldown.trueshot.remains,value_else=cooldown.trueshot.remains,if=buff.trueshot.down&covenant.kyrian\nactions.trinkets+=/variable,name=strong_sync_remains,op=setif,value=cooldown.resonating_arrow.remains,value_else=cooldown.trueshot.remains,if=buff.trueshot.up&covenant.kyrian\nactions.trinkets+=/variable,name=sync_remains,op=setif,if=covenant.kyrian,value=cooldown.resonating_arrow.remains>?cooldown.trueshot.remains,value_else=cooldown.trueshot.remains\nactions.trinkets+=/use_items,slots=trinket1,if=(trinket.1.has_use_buff||covenant.kyrian&trinket.1.has_cooldown)&(variable.strong_sync_up&(!covenant.kyrian&!trinket.2.has_use_buff||covenant.kyrian&!trinket.2.has_cooldown||trinket.2.cooldown.remains||trinket.1.has_use_buff&(!trinket.2.has_use_buff||trinket.1.cooldown.duration>=trinket.2.cooldown.duration)||trinket.1.has_cooldown&!trinket.2.has_use_buff&trinket.1.cooldown.duration>=trinket.2.cooldown.duration)||!variable.strong_sync_up&(!trinket.2.has_use_buff&(trinket.1.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2)||trinket.2.has_use_buff&(trinket.1.has_use_buff&trinket.1.cooldown.duration>=trinket.2.cooldown.duration&(trinket.1.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2)||(!trinket.1.has_use_buff||trinket.2.cooldown.duration>=trinket.1.cooldown.duration)&(trinket.2.cooldown.ready&trinket.2.cooldown.duration-5>variable.sync_remains&variable.sync_remains<trinket.2.cooldown.duration%2||!trinket.2.cooldown.ready&(trinket.2.cooldown.remains-5<variable.strong_sync_remains&variable.strong_sync_remains>20&(trinket.1.cooldown.duration-5<variable.sync_remains||trinket.2.cooldown.remains-5<variable.sync_remains&trinket.2.cooldown.duration-10+variable.sync_remains<variable.strong_sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2||variable.sync_up)||trinket.2.cooldown.remains-5>variable.strong_sync_remains&(trinket.1.cooldown.duration-5<variable.strong_sync_remains||!trinket.1.has_use_buff&(variable.sync_remains>trinket.1.cooldown.duration%2||variable.sync_up))))))||boss&fight_remains<variable.sync_remains)||!trinket.1.has_use_buff&!covenant.kyrian&(trinket.2.has_use_buff&((!variable.sync_up||trinket.2.cooldown.remains>5)&(variable.sync_remains>20||trinket.2.cooldown.remains-5>variable.sync_remains))||!trinket.2.has_use_buff&(!trinket.2.has_cooldown||trinket.2.cooldown.remains||trinket.2.cooldown.duration>=trinket.1.cooldown.duration))\nactions.trinkets+=/use_items,slots=trinket2,if=(trinket.2.has_use_buff||covenant.kyrian&trinket.2.has_cooldown)&(variable.strong_sync_up&(!covenant.kyrian&!trinket.1.has_use_buff||covenant.kyrian&!trinket.1.has_cooldown||trinket.1.cooldown.remains||trinket.2.has_use_buff&(!trinket.1.has_use_buff||trinket.2.cooldown.duration>=trinket.1.cooldown.duration)||trinket.2.has_cooldown&!trinket.1.has_use_buff&trinket.2.cooldown.duration>=trinket.1.cooldown.duration)||!variable.strong_sync_up&(!trinket.1.has_use_buff&(trinket.2.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2)||trinket.1.has_use_buff&(trinket.2.has_use_buff&trinket.2.cooldown.duration>=trinket.1.cooldown.duration&(trinket.2.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2)||(!trinket.2.has_use_buff||trinket.1.cooldown.duration>=trinket.2.cooldown.duration)&(trinket.1.cooldown.ready&trinket.1.cooldown.duration-5>variable.sync_remains&variable.sync_remains<trinket.1.cooldown.duration%2||!trinket.1.cooldown.ready&(trinket.1.cooldown.remains-5<variable.strong_sync_remains&variable.strong_sync_remains>20&(trinket.2.cooldown.duration-5<variable.sync_remains||trinket.1.cooldown.remains-5<variable.sync_remains&trinket.1.cooldown.duration-10+variable.sync_remains<variable.strong_sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2||variable.sync_up)||trinket.1.cooldown.remains-5>variable.strong_sync_remains&(trinket.2.cooldown.duration-5<variable.strong_sync_remains||!trinket.2.has_use_buff&(variable.sync_remains>trinket.2.cooldown.duration%2||variable.sync_up))))))||boss&fight_remains<variable.sync_remains)||!trinket.2.has_use_buff&!covenant.kyrian&(trinket.1.has_use_buff&((!variable.sync_up||trinket.1.cooldown.remains>5)&(variable.sync_remains>20||trinket.1.cooldown.remains-5>variable.sync_remains))||!trinket.1.has_use_buff&(!trinket.1.has_cooldown||trinket.1.cooldown.remains||trinket.1.cooldown.duration>=trinket.2.cooldown.duration))",
				},
				["Beast Mastery"] = {
					["source"] = "https://github.com/simulationcraft/simc/",
					["builtIn"] = true,
					["date"] = 20210715,
					["author"] = "SimC",
					["desc"] = "Beast Mastery Hunter\nJuly 15, 2021",
					["lists"] = {
						["default"] = {
							{
								["action"] = "counter_shot",
								["enabled"] = true,
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "! target.is_player",
								["action"] = "tranquilizing_shot",
								["description"] = "Go ahead and Tranquilize NPC enemies, we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.",
							}, -- [2]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "covenant.kyrian & cooldown.aspect_of_the_wild.remains & cooldown.resonating_arrow.remains || ! covenant.kyrian & cooldown.aspect_of_the_wild.remains",
								["list_name"] = "trinkets",
							}, -- [3]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["list_name"] = "cds",
							}, -- [4]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies < 2",
								["list_name"] = "st",
							}, -- [5]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies > 1",
								["list_name"] = "cleave",
							}, -- [6]
						},
						["precombat"] = {
							{
								["action"] = "summon_pet",
								["enabled"] = true,
							}, -- [1]
							{
								["action"] = "bottled_flayedwing_toxin",
								["enabled"] = true,
							}, -- [2]
							{
								["action"] = "fleshcraft",
								["enabled"] = true,
							}, -- [3]
							{
								["enabled"] = true,
								["name"] = "azsharas_font_of_power",
								["action"] = "azsharas_font_of_power",
							}, -- [4]
							{
								["enabled"] = true,
								["precast_time"] = "1.5",
								["action"] = "tar_trap",
								["criteria"] = "runeforge.soulforge_embers.enabled || runeforge.nessingwarys_trapping_apparatus.enabled",
							}, -- [5]
							{
								["enabled"] = true,
								["precast_time"] = "1.5",
								["action"] = "bestial_wrath",
								["criteria"] = "! talent.scent_of_blood.enabled & ! runeforge.soulforge_embers.enabled",
							}, -- [6]
							{
								["enabled"] = true,
								["precast_time"] = "1.3",
								["action"] = "aspect_of_the_wild",
								["criteria"] = "! azerite.primal_instincts.enabled & ! essence.essence_of_the_focusing_iris.major & ( equipped.azsharas_font_of_power || ! equipped.cyclotronic_blast )",
								["description"] = "Adjusts the duration and cooldown of Aspect of the Wild and Primal Instincts by the duration of an unhasted GCD when they're used precombat. Because Aspect of the Wild reduces GCD by 200ms, this is 1.3 seconds.",
							}, -- [7]
							{
								["enabled"] = true,
								["precast_time"] = "1.5",
								["action"] = "bestial_wrath",
								["criteria"] = "azerite.primal_instincts.enabled & ! essence.essence_of_the_focusing_iris.major & ( equipped.azsharas_font_of_power || ! equipped.cyclotronic_blast )",
								["description"] = "Adjusts the duration and cooldown of Bestial Wrath and Haze of Rage by the duration of an unhasted GCD when they're used precombat.",
							}, -- [8]
						},
						["trinkets"] = {
							{
								["enabled"] = true,
								["op"] = "set",
								["action"] = "variable",
								["value"] = "buff.resonating_arrow.up || buff.aspect_of_the_wild.up",
								["var_name"] = "sync_up",
							}, -- [1]
							{
								["enabled"] = true,
								["op"] = "set",
								["action"] = "variable",
								["value"] = "covenant.kyrian & buff.resonating_arrow.up & buff.aspect_of_the_wild.up || ! covenant.kyrian & buff.aspect_of_the_wild.up",
								["var_name"] = "strong_sync_up",
							}, -- [2]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "strong_sync_remains",
								["value"] = "cooldown.resonating_arrow.remains <? cooldown.aspect_of_the_wild.remains",
								["value_else"] = "cooldown.aspect_of_the_wild.remains",
								["criteria"] = "buff.aspect_of_the_wild.down",
							}, -- [3]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "strong_sync_remains",
								["value"] = "cooldown.resonating_arrow.remains",
								["value_else"] = "cooldown.aspect_of_the_wild.remains",
								["criteria"] = "buff.aspect_of_the_wild.up",
							}, -- [4]
							{
								["enabled"] = true,
								["op"] = "setif",
								["action"] = "variable",
								["var_name"] = "sync_remains",
								["value"] = "cooldown.resonating_arrow.remains >? cooldown.aspect_of_the_wild.remains",
								["value_else"] = "cooldown.aspect_of_the_wild.remains",
								["criteria"] = "covenant.kyrian",
							}, -- [5]
							{
								["enabled"] = true,
								["slots"] = "trinket1",
								["action"] = "trinket1",
								["criteria"] = "( trinket.t1.has_use_buff || covenant.kyrian & trinket.t1.has_cooldown ) & ( variable.strong_sync_up & ( ! covenant.kyrian & ! trinket.t2.has_use_buff || covenant.kyrian & ! trinket.t2.has_cooldown || trinket.t2.cooldown.remains || trinket.t1.has_use_buff & ( ! trinket.t2.has_use_buff || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) || trinket.t1.has_cooldown & ! trinket.t2.has_use_buff & trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) || ! variable.strong_sync_up & ( ! trinket.t2.has_use_buff & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 ) || trinket.t2.has_use_buff & ( trinket.t1.has_use_buff & trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 ) || ( ! trinket.t1.has_use_buff || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) & ( trinket.t2.cooldown.ready & trinket.t2.cooldown.duration - 5 > variable.sync_remains & variable.sync_remains < trinket.t2.cooldown.duration / 2 || ! trinket.t2.cooldown.ready & ( trinket.t2.cooldown.remains - 5 < variable.strong_sync_remains & variable.strong_sync_remains > 20 & ( trinket.t1.cooldown.duration - 5 < variable.sync_remains || trinket.t2.cooldown.remains - 5 < variable.sync_remains & trinket.t2.cooldown.duration - 10 + variable.sync_remains < variable.strong_sync_remains || variable.sync_remains > trinket.t1.cooldown.duration / 2 || variable.sync_up ) || trinket.t2.cooldown.remains - 5 > variable.strong_sync_remains & ( trinket.t1.cooldown.duration - 5 < variable.strong_sync_remains || ! trinket.t1.has_use_buff & ( variable.sync_remains > trinket.t1.cooldown.duration / 2 || variable.sync_up ) ) ) ) ) ) || target.time_to_die < variable.sync_remains ) || ! trinket.t1.has_use_buff & ! covenant.kyrian & ( trinket.t2.has_use_buff & ( ( ! variable.sync_up || trinket.t2.cooldown.remains > 5 ) & ( variable.sync_remains > 20 || trinket.t2.cooldown.remains - 5 > variable.sync_remains ) ) || ! trinket.t2.has_use_buff & ( ! trinket.t2.has_cooldown || trinket.t2.cooldown.remains || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) )",
							}, -- [6]
							{
								["enabled"] = true,
								["slots"] = "trinket2",
								["action"] = "trinket2",
								["criteria"] = "( trinket.t2.has_use_buff || covenant.kyrian & trinket.t2.has_cooldown ) & ( variable.strong_sync_up & ( ! covenant.kyrian & ! trinket.t1.has_use_buff || covenant.kyrian & ! trinket.t1.has_cooldown || trinket.t1.cooldown.remains || trinket.t2.has_use_buff & ( ! trinket.t1.has_use_buff || trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) || trinket.t2.has_cooldown & ! trinket.t1.has_use_buff & trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration ) || ! variable.strong_sync_up & ( ! trinket.t1.has_use_buff & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 ) || trinket.t1.has_use_buff & ( trinket.t2.has_use_buff & trinket.t2.cooldown.duration >= trinket.t1.cooldown.duration & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 ) || ( ! trinket.t2.has_use_buff || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) & ( trinket.t1.cooldown.ready & trinket.t1.cooldown.duration - 5 > variable.sync_remains & variable.sync_remains < trinket.t1.cooldown.duration / 2 || ! trinket.t1.cooldown.ready & ( trinket.t1.cooldown.remains - 5 < variable.strong_sync_remains & variable.strong_sync_remains > 20 & ( trinket.t2.cooldown.duration - 5 < variable.sync_remains || trinket.t1.cooldown.remains - 5 < variable.sync_remains & trinket.t1.cooldown.duration - 10 + variable.sync_remains < variable.strong_sync_remains || variable.sync_remains > trinket.t2.cooldown.duration / 2 || variable.sync_up ) || trinket.t1.cooldown.remains - 5 > variable.strong_sync_remains & ( trinket.t2.cooldown.duration - 5 < variable.strong_sync_remains || ! trinket.t2.has_use_buff & ( variable.sync_remains > trinket.t2.cooldown.duration / 2 || variable.sync_up ) ) ) ) ) ) || target.time_to_die < variable.sync_remains ) || ! trinket.t2.has_use_buff & ! covenant.kyrian & ( trinket.t1.has_use_buff & ( ( ! variable.sync_up || trinket.t1.cooldown.remains > 5 ) & ( variable.sync_remains > 20 || trinket.t1.cooldown.remains - 5 > variable.sync_remains ) ) || ! trinket.t1.has_use_buff & ( ! trinket.t1.has_cooldown || trinket.t1.cooldown.remains || trinket.t1.cooldown.duration >= trinket.t2.cooldown.duration ) )",
							}, -- [7]
						},
						["cds"] = {
							{
								["enabled"] = true,
								["criteria"] = "cooldown.bestial_wrath.remains > 30",
								["action"] = "ancestral_call",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.bestial_wrath.remains > 30",
								["action"] = "fireblood",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "( buff.wild_spirits.up || ! covenant.night_fae & buff.aspect_of_the_wild.up & buff.bestial_wrath.up ) & ( fight_remains > cooldown.berserking.duration + duration || ( target.health.pct < 35 || ! talent.killer_instinct.enabled ) ) || boss & fight_remains < 13",
								["action"] = "berserking",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "( buff.wild_spirits.up || ! covenant.night_fae & buff.aspect_of_the_wild.up & buff.bestial_wrath.up ) & ( fight_remains > cooldown.blood_fury.duration + duration || ( target.health.pct < 35 || ! talent.killer_instinct.enabled ) ) || boss & fight_remains < 16",
								["action"] = "blood_fury",
							}, -- [4]
							{
								["action"] = "lights_judgment",
								["enabled"] = true,
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "buff.aspect_of_the_wild.up || fight_remains < 26",
								["action"] = "potion",
							}, -- [6]
						},
						["st"] = {
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || ! raid_event.adds.up & ( raid_event.adds.duration + raid_event.adds.in < 20 || ( raid_event.adds.count = 1 & covenant.kyrian ) ) || raid_event.adds.up & raid_event.adds.remains > 19",
								["action"] = "aspect_of_the_wild",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "buff.frenzy.up & buff.frenzy.remains <= gcd || buff.wild_spirits.up & charges_fractional > 1.4 & runeforge.fragments_of_the_elder_antlers.enabled",
								["action"] = "barbed_shot",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled & tar_trap.remains < gcd & cooldown.flare.remains < gcd",
								["action"] = "tar_trap",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "tar_trap.up & runeforge.soulforge_embers.enabled",
								["action"] = "flare",
								["line_cd"] = "25",
							}, -- [4]
							{
								["action"] = "bloodshed",
								["enabled"] = true,
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || ! raid_event.adds.up & raid_event.adds.duration + raid_event.adds.in < 20 || raid_event.adds.up & raid_event.adds.remains > 19",
								["action"] = "wild_spirits",
							}, -- [6]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [7]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.resonating_arrow.remains < gcd & ( ! talent.explosive_shot.enabled || buff.bloodlust.up ) || ! covenant.kyrian || cooldown.resonating_arrow.remains || target.time_to_die < 5",
								["action"] = "wailing_arrow",
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.bestial_wrath.remains < 12 * charges_fractional + gcd & talent.scent_of_blood.enabled || full_recharge_time < gcd & cooldown.bestial_wrath.remains || target.time_to_die < 9",
								["action"] = "barbed_shot",
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "buff.aspect_of_the_wild.up || target.time_to_die < 15",
								["action"] = "stampede",
							}, -- [12]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "( buff.bestial_wrath.up || target.time_to_die < 10 ) & ( ! raid_event.adds.exists || ! raid_event.adds.up & ( raid_event.adds.duration + raid_event.adds.in < 20 || raid_event.adds.count = 1 ) || raid_event.adds.up & raid_event.adds.remains > 19 )",
								["action"] = "resonating_arrow",
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "( cooldown.wild_spirits.remains > 15 || covenant.kyrian & ( cooldown.resonating_arrow.remains < 5 || cooldown.resonating_arrow.remains > 20 ) || target.time_to_die < 15 || ( ! covenant.night_fae & ! covenant.kyrian ) ) & ( ! raid_event.adds.exists || ! raid_event.adds.up & ( raid_event.adds.duration + raid_event.adds.in < 20 || raid_event.adds.count = 1 ) || raid_event.adds.up & raid_event.adds.remains > 19 )",
								["action"] = "bestial_wrath",
							}, -- [15]
							{
								["action"] = "chimaera_shot",
								["enabled"] = true,
							}, -- [16]
							{
								["action"] = "kill_command",
								["enabled"] = true,
							}, -- [17]
							{
								["enabled"] = true,
								["criteria"] = "buff.bestial_wrath.down || boss & fight_remains < 5",
								["action"] = "bag_of_tricks",
							}, -- [18]
							{
								["action"] = "dire_beast",
								["enabled"] = true,
							}, -- [19]
							{
								["enabled"] = true,
								["criteria"] = "( focus - cost + focus.regen * ( cooldown.kill_command.remains - 1 ) > action.kill_command.cost || cooldown.kill_command.remains > 1 + gcd ) || ( buff.bestial_wrath.up || buff.nessingwarys_trapping_apparatus.up ) & ! runeforge.qapla_eredun_war_order.enabled || boss & fight_remains < 3",
								["action"] = "cobra_shot",
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "buff.wild_spirits.up || charges_fractional > 1.2 & conduit.bloodletting.enabled",
								["action"] = "barbed_shot",
							}, -- [21]
							{
								["enabled"] = true,
								["criteria"] = "buff.bestial_wrath.down || boss & fight_remains < 5",
								["action"] = "arcane_pulse",
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled || runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "tar_trap",
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "freezing_trap",
							}, -- [24]
							{
								["enabled"] = true,
								["criteria"] = "( focus + focus.regen + 15 ) < focus.max",
								["action"] = "arcane_torrent",
							}, -- [25]
						},
						["cleave"] = {
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || raid_event.adds.remains >= 10 || active_enemies >= raid_event.adds.count * 2",
								["action"] = "aspect_of_the_wild",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "buff.frenzy.up & buff.frenzy.remains <= gcd || buff.wild_spirits.up & charges_fractional > 1.4 & runeforge.fragments_of_the_elder_antlers.enabled",
								["action"] = "barbed_shot",
								["cycle_targets"] = 1,
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "gcd - buff.beast_cleave.remains > 0.25",
								["action"] = "multishot",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.pouch_of_razor_fragments.enabled & buff.flayers_mark.up",
								["action"] = "kill_shot",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.pouch_of_razor_fragments.enabled",
								["action"] = "flayed_shot",
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled & tar_trap.remains < gcd & cooldown.flare.remains < gcd",
								["action"] = "tar_trap",
							}, -- [6]
							{
								["enabled"] = true,
								["criteria"] = "tar_trap.up & runeforge.soulforge_embers.enabled",
								["action"] = "flare",
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || raid_event.adds.remains >= 10 || active_enemies >= raid_event.adds.count * 2",
								["action"] = "wild_spirits",
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "full_recharge_time < gcd & cooldown.bestial_wrath.remains || cooldown.bestial_wrath.remains < 12 + gcd & talent.scent_of_blood.enabled",
								["action"] = "barbed_shot",
								["cycle_targets"] = 1,
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || raid_event.adds.remains >= 5 || active_enemies >= raid_event.adds.count * 2",
								["action"] = "bestial_wrath",
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "! raid_event.adds.exists || raid_event.adds.remains >= 5 || active_enemies >= raid_event.adds.count * 2",
								["action"] = "resonating_arrow",
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "buff.aspect_of_the_wild.up || boss & fight_remains < 15",
								["action"] = "stampede",
							}, -- [13]
							{
								["action"] = "wailing_arrow",
								["enabled"] = true,
							}, -- [14]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [15]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [16]
							{
								["action"] = "chimaera_shot",
								["enabled"] = true,
							}, -- [17]
							{
								["action"] = "bloodshed",
								["enabled"] = true,
							}, -- [18]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [19]
							{
								["enabled"] = true,
								["criteria"] = "buff.frenzy.remains > execute_time",
								["action"] = "barrage",
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "focus > cost + action.multishot.cost",
								["action"] = "kill_command",
							}, -- [21]
							{
								["enabled"] = true,
								["criteria"] = "buff.bestial_wrath.down || boss & fight_remains < 5",
								["action"] = "bag_of_tricks",
							}, -- [22]
							{
								["action"] = "dire_beast",
								["enabled"] = true,
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "target.time_to_die < 9 || charges_fractional > 1.2 & conduit.bloodletting.enabled",
								["action"] = "barbed_shot",
								["cycle_targets"] = 1,
							}, -- [24]
							{
								["enabled"] = true,
								["criteria"] = "focus.time_to_max < gcd * 2",
								["action"] = "cobra_shot",
							}, -- [25]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.enabled || runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "tar_trap",
							}, -- [26]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.nessingwarys_trapping_apparatus.enabled",
								["action"] = "freezing_trap",
							}, -- [27]
							{
								["enabled"] = true,
								["criteria"] = "( focus + focus.regen + 30 ) < focus.max",
								["action"] = "arcane_torrent",
							}, -- [28]
						},
					},
					["version"] = 20210715,
					["warnings"] = "WARNING:  The import for 'precombat' required some automated changes.\nLine 5: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 5: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 6: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 6: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\n\nWARNING:  The import for 'trinkets' required some automated changes.\nLine 6: Converted SimC syntax % to Lua division operator (/) (5x).\nLine 6: Converted 'trinket.1.X' to 'trinket.t1.X' (21x).\nLine 6: Converted 'trinket.2.X' to 'trinket.t2.X' (26x).\nLine 7: Converted SimC syntax % to Lua division operator (/) (5x).\nLine 7: Converted 'trinket.1.X' to 'trinket.t1.X' (26x).\nLine 7: Converted 'trinket.2.X' to 'trinket.t2.X' (21x).\n\nWARNING:  The import for 'cds' required some automated changes.\nLine 3: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 4: Converted 'talent.X' to 'talent.X.enabled' (1x).\n\nWARNING:  The import for 'st' required some automated changes.\nLine 2: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 2: Converted 'pet.X.Y...' to 'Y...' (2x).\nLine 3: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 4: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 9: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 10: Converted 'talent.X' to 'talent.X.enabled' (1x).\nLine 20: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 21: Converted 'conduit.X' to 'conduit.X.enabled' at EOL (1x).\nLine 23: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 23: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 24: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\n\nWARNING:  The import for 'cleave' required some automated changes.\nLine 2: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 2: Converted 'pet.X.Y...' to 'Y...' (2x).\nLine 3: Converted 'pet.X.Y...' to 'Y...' (1x).\nLine 4: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 5: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 6: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 7: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 10: Converted 'talent.X' to 'talent.X.enabled' at EOL (1x).\nLine 20: Converted 'pet.X.Y...' to 'Y...' (1x).\nLine 24: Converted 'conduit.X' to 'conduit.X.enabled' at EOL (1x).\nLine 26: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\nLine 26: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 27: Converted 'runeforge.X' to 'runeforge.X.enabled' at EOL (1x).\n\nThe 'use_items' action was not found in this import.\nImported 6 action lists.\n",
					["spec"] = 253,
					["profile"] = "## Beast Mastery Hunter\n## July 15, 2021\n\nactions.precombat=summon_pet\nactions.precombat+=/bottled_flayedwing_toxin\nactions.precombat+=/fleshcraft\nactions.precombat+=/use_item,name=azsharas_font_of_power\nactions.precombat+=/tar_trap,precast_time=1.5,if=runeforge.soulforge_embers||runeforge.nessingwarys_trapping_apparatus\nactions.precombat+=/bestial_wrath,precast_time=1.5,if=!talent.scent_of_blood&!runeforge.soulforge_embers\n# Adjusts the duration and cooldown of Aspect of the Wild and Primal Instincts by the duration of an unhasted GCD when they're used precombat. Because Aspect of the Wild reduces GCD by 200ms, this is 1.3 seconds.\nactions.precombat+=/aspect_of_the_wild,precast_time=1.3,if=!azerite.primal_instincts.enabled&!essence.essence_of_the_focusing_iris.major&(equipped.azsharas_font_of_power||!equipped.cyclotronic_blast)\n# Adjusts the duration and cooldown of Bestial Wrath and Haze of Rage by the duration of an unhasted GCD when they're used precombat.\nactions.precombat+=/bestial_wrath,precast_time=1.5,if=azerite.primal_instincts.enabled&!essence.essence_of_the_focusing_iris.major&(equipped.azsharas_font_of_power||!equipped.cyclotronic_blast)\n\nactions+=/counter_shot\n# Go ahead and Tranquilize NPC enemies; we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.\nactions+=/tranquilizing_shot,if=!target.is_player\n## Delay facing your doubt until you have put Resonating Arrow down, or if the cooldown is too long to delay facing your Doubt. If none of these conditions are able to met within the 10 seconds leeway, the sim faces your Doubt automatically.\n## actions+=/newfound_resolve,if=soulbind.newfound_resolve&(buff.resonating_arrow.up||cooldown.resonating_arrow.remains>10||target.time_to_die<16)\nactions+=/call_action_list,name=trinkets,if=covenant.kyrian&cooldown.aspect_of_the_wild.remains&cooldown.resonating_arrow.remains||!covenant.kyrian&cooldown.aspect_of_the_wild.remains\nactions+=/call_action_list,name=cds\nactions+=/call_action_list,name=st,if=active_enemies<2\nactions+=/call_action_list,name=cleave,if=active_enemies>1\n\nactions.cds=ancestral_call,if=cooldown.bestial_wrath.remains>30\nactions.cds+=/fireblood,if=cooldown.bestial_wrath.remains>30\nactions.cds+=/berserking,if=(buff.wild_spirits.up||!covenant.night_fae&buff.aspect_of_the_wild.up&buff.bestial_wrath.up)&(fight_remains>cooldown.berserking.duration+duration||(target.health.pct<35||!talent.killer_instinct))||boss&fight_remains<13\nactions.cds+=/blood_fury,if=(buff.wild_spirits.up||!covenant.night_fae&buff.aspect_of_the_wild.up&buff.bestial_wrath.up)&(fight_remains>cooldown.blood_fury.duration+duration||(target.health.pct<35||!talent.killer_instinct))||boss&fight_remains<16\nactions.cds+=/lights_judgment\nactions.cds+=/potion,if=buff.aspect_of_the_wild.up||fight_remains<26\n\nactions.cleave=aspect_of_the_wild,if=!raid_event.adds.exists||raid_event.adds.remains>=10||active_enemies>=raid_event.adds.count*2\nactions.cleave+=/barbed_shot,cycle_targets=1,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd||buff.wild_spirits.up&charges_fractional>1.4&runeforge.fragments_of_the_elder_antlers\nactions.cleave+=/multishot,if=gcd-pet.main.buff.beast_cleave.remains>0.25\nactions.cleave+=/kill_shot,if=runeforge.pouch_of_razor_fragments&buff.flayers_mark.up\nactions.cleave+=/flayed_shot,if=runeforge.pouch_of_razor_fragments\nactions.cleave+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd\nactions.cleave+=/flare,if=tar_trap.up&runeforge.soulforge_embers\nactions.cleave+=/death_chakram,if=focus+cast_regen<focus.max\nactions.cleave+=/wild_spirits,if=!raid_event.adds.exists||raid_event.adds.remains>=10||active_enemies>=raid_event.adds.count*2\nactions.cleave+=/barbed_shot,cycle_targets=1,if=full_recharge_time<gcd&cooldown.bestial_wrath.remains||cooldown.bestial_wrath.remains<12+gcd&talent.scent_of_blood\nactions.cleave+=/bestial_wrath,if=!raid_event.adds.exists||raid_event.adds.remains>=5||active_enemies>=raid_event.adds.count*2\nactions.cleave+=/resonating_arrow,if=!raid_event.adds.exists||raid_event.adds.remains>=5||active_enemies>=raid_event.adds.count*2\nactions.cleave+=/stampede,if=buff.aspect_of_the_wild.up||boss&fight_remains<15\nactions.cleave+=/wailing_arrow\nactions.cleave+=/flayed_shot\nactions.cleave+=/kill_shot\nactions.cleave+=/chimaera_shot\nactions.cleave+=/bloodshed\nactions.cleave+=/a_murder_of_crows\nactions.cleave+=/barrage,if=pet.main.buff.frenzy.remains>execute_time\nactions.cleave+=/kill_command,if=focus>cost+action.multishot.cost\nactions.cleave+=/bag_of_tricks,if=buff.bestial_wrath.down||boss&fight_remains<5\nactions.cleave+=/dire_beast\nactions.cleave+=/barbed_shot,cycle_targets=1,if=target.time_to_die<9||charges_fractional>1.2&conduit.bloodletting\nactions.cleave+=/cobra_shot,if=focus.time_to_max<gcd*2\nactions.cleave+=/tar_trap,if=runeforge.soulforge_embers||runeforge.nessingwarys_trapping_apparatus\nactions.cleave+=/freezing_trap,if=runeforge.nessingwarys_trapping_apparatus\nactions.cleave+=/arcane_torrent,if=(focus+focus.regen+30)<focus.max\n\nactions.st=aspect_of_the_wild,if=!raid_event.adds.exists||!raid_event.adds.up&(raid_event.adds.duration+raid_event.adds.in<20||(raid_event.adds.count=1&covenant.kyrian))||raid_event.adds.up&raid_event.adds.remains>19\nactions.st+=/barbed_shot,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd||buff.wild_spirits.up&charges_fractional>1.4&runeforge.fragments_of_the_elder_antlers\nactions.st+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd\nactions.st+=/flare,line_cd=25,if=tar_trap.up&runeforge.soulforge_embers\nactions.st+=/bloodshed\nactions.st+=/wild_spirits,if=!raid_event.adds.exists||!raid_event.adds.up&raid_event.adds.duration+raid_event.adds.in<20||raid_event.adds.up&raid_event.adds.remains>19\nactions.st+=/flayed_shot\nactions.st+=/kill_shot\nactions.st+=/wailing_arrow,if=cooldown.resonating_arrow.remains<gcd&(!talent.explosive_shot||buff.bloodlust.up)||!covenant.kyrian||cooldown.resonating_arrow.remains||target.time_to_die<5\nactions.st+=/barbed_shot,if=cooldown.bestial_wrath.remains<12*charges_fractional+gcd&talent.scent_of_blood||full_recharge_time<gcd&cooldown.bestial_wrath.remains||target.time_to_die<9\nactions.st+=/death_chakram,if=focus+cast_regen<focus.max\nactions.st+=/stampede,if=buff.aspect_of_the_wild.up||target.time_to_die<15\nactions.st+=/a_murder_of_crows\nactions.st+=/resonating_arrow,if=(buff.bestial_wrath.up||target.time_to_die<10)&(!raid_event.adds.exists||!raid_event.adds.up&(raid_event.adds.duration+raid_event.adds.in<20||raid_event.adds.count=1)||raid_event.adds.up&raid_event.adds.remains>19)\nactions.st+=/bestial_wrath,if=(cooldown.wild_spirits.remains>15||covenant.kyrian&(cooldown.resonating_arrow.remains<5||cooldown.resonating_arrow.remains>20)||target.time_to_die<15||(!covenant.night_fae&!covenant.kyrian))&(!raid_event.adds.exists||!raid_event.adds.up&(raid_event.adds.duration+raid_event.adds.in<20||raid_event.adds.count=1)||raid_event.adds.up&raid_event.adds.remains>19)\nactions.st+=/chimaera_shot\nactions.st+=/kill_command\nactions.st+=/bag_of_tricks,if=buff.bestial_wrath.down||boss&fight_remains<5\nactions.st+=/dire_beast\nactions.st+=/cobra_shot,if=(focus-cost+focus.regen*(cooldown.kill_command.remains-1)>action.kill_command.cost||cooldown.kill_command.remains>1+gcd)||(buff.bestial_wrath.up||buff.nessingwarys_trapping_apparatus.up)&!runeforge.qapla_eredun_war_order||boss&fight_remains<3\nactions.st+=/barbed_shot,if=buff.wild_spirits.up||charges_fractional>1.2&conduit.bloodletting\nactions.st+=/arcane_pulse,if=buff.bestial_wrath.down||boss&fight_remains<5\nactions.st+=/tar_trap,if=runeforge.soulforge_embers||runeforge.nessingwarys_trapping_apparatus\nactions.st+=/freezing_trap,if=runeforge.nessingwarys_trapping_apparatus\nactions.st+=/arcane_torrent,if=(focus+focus.regen+15)<focus.max\n\nactions.trinkets=variable,name=sync_up,value=buff.resonating_arrow.up||buff.aspect_of_the_wild.up\nactions.trinkets+=/variable,name=strong_sync_up,value=covenant.kyrian&buff.resonating_arrow.up&buff.aspect_of_the_wild.up||!covenant.kyrian&buff.aspect_of_the_wild.up\nactions.trinkets+=/variable,name=strong_sync_remains,op=setif,condition=covenant.kyrian,value=cooldown.resonating_arrow.remains<?cooldown.aspect_of_the_wild.remains,value_else=cooldown.aspect_of_the_wild.remains,if=buff.aspect_of_the_wild.down\nactions.trinkets+=/variable,name=strong_sync_remains,op=setif,condition=covenant.kyrian,value=cooldown.resonating_arrow.remains,value_else=cooldown.aspect_of_the_wild.remains,if=buff.aspect_of_the_wild.up\nactions.trinkets+=/variable,name=sync_remains,op=setif,condition=covenant.kyrian,value=cooldown.resonating_arrow.remains>?cooldown.aspect_of_the_wild.remains,value_else=cooldown.aspect_of_the_wild.remains\nactions.trinkets+=/use_items,slots=trinket1,if=(trinket.1.has_use_buff||covenant.kyrian&trinket.1.has_cooldown)&(variable.strong_sync_up&(!covenant.kyrian&!trinket.2.has_use_buff||covenant.kyrian&!trinket.2.has_cooldown||trinket.2.cooldown.remains||trinket.1.has_use_buff&(!trinket.2.has_use_buff||trinket.1.cooldown.duration>=trinket.2.cooldown.duration)||trinket.1.has_cooldown&!trinket.2.has_use_buff&trinket.1.cooldown.duration>=trinket.2.cooldown.duration)||!variable.strong_sync_up&(!trinket.2.has_use_buff&(trinket.1.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2)||trinket.2.has_use_buff&(trinket.1.has_use_buff&trinket.1.cooldown.duration>=trinket.2.cooldown.duration&(trinket.1.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2)||(!trinket.1.has_use_buff||trinket.2.cooldown.duration>=trinket.1.cooldown.duration)&(trinket.2.cooldown.ready&trinket.2.cooldown.duration-5>variable.sync_remains&variable.sync_remains<trinket.2.cooldown.duration%2||!trinket.2.cooldown.ready&(trinket.2.cooldown.remains-5<variable.strong_sync_remains&variable.strong_sync_remains>20&(trinket.1.cooldown.duration-5<variable.sync_remains||trinket.2.cooldown.remains-5<variable.sync_remains&trinket.2.cooldown.duration-10+variable.sync_remains<variable.strong_sync_remains||variable.sync_remains>trinket.1.cooldown.duration%2||variable.sync_up)||trinket.2.cooldown.remains-5>variable.strong_sync_remains&(trinket.1.cooldown.duration-5<variable.strong_sync_remains||!trinket.1.has_use_buff&(variable.sync_remains>trinket.1.cooldown.duration%2||variable.sync_up))))))||target.time_to_die<variable.sync_remains)||!trinket.1.has_use_buff&!covenant.kyrian&(trinket.2.has_use_buff&((!variable.sync_up||trinket.2.cooldown.remains>5)&(variable.sync_remains>20||trinket.2.cooldown.remains-5>variable.sync_remains))||!trinket.2.has_use_buff&(!trinket.2.has_cooldown||trinket.2.cooldown.remains||trinket.2.cooldown.duration>=trinket.1.cooldown.duration))\nactions.trinkets+=/use_items,slots=trinket2,if=(trinket.2.has_use_buff||covenant.kyrian&trinket.2.has_cooldown)&(variable.strong_sync_up&(!covenant.kyrian&!trinket.1.has_use_buff||covenant.kyrian&!trinket.1.has_cooldown||trinket.1.cooldown.remains||trinket.2.has_use_buff&(!trinket.1.has_use_buff||trinket.2.cooldown.duration>=trinket.1.cooldown.duration)||trinket.2.has_cooldown&!trinket.1.has_use_buff&trinket.2.cooldown.duration>=trinket.1.cooldown.duration)||!variable.strong_sync_up&(!trinket.1.has_use_buff&(trinket.2.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2)||trinket.1.has_use_buff&(trinket.2.has_use_buff&trinket.2.cooldown.duration>=trinket.1.cooldown.duration&(trinket.2.cooldown.duration-5<variable.sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2)||(!trinket.2.has_use_buff||trinket.1.cooldown.duration>=trinket.2.cooldown.duration)&(trinket.1.cooldown.ready&trinket.1.cooldown.duration-5>variable.sync_remains&variable.sync_remains<trinket.1.cooldown.duration%2||!trinket.1.cooldown.ready&(trinket.1.cooldown.remains-5<variable.strong_sync_remains&variable.strong_sync_remains>20&(trinket.2.cooldown.duration-5<variable.sync_remains||trinket.1.cooldown.remains-5<variable.sync_remains&trinket.1.cooldown.duration-10+variable.sync_remains<variable.strong_sync_remains||variable.sync_remains>trinket.2.cooldown.duration%2||variable.sync_up)||trinket.1.cooldown.remains-5>variable.strong_sync_remains&(trinket.2.cooldown.duration-5<variable.strong_sync_remains||!trinket.2.has_use_buff&(variable.sync_remains>trinket.2.cooldown.duration%2||variable.sync_up))))))||target.time_to_die<variable.sync_remains)||!trinket.2.has_use_buff&!covenant.kyrian&(trinket.1.has_use_buff&((!variable.sync_up||trinket.1.cooldown.remains>5)&(variable.sync_remains>20||trinket.1.cooldown.remains-5>variable.sync_remains))||!trinket.1.has_use_buff&(!trinket.1.has_cooldown||trinket.1.cooldown.remains||trinket.1.cooldown.duration>=trinket.2.cooldown.duration))",
				},
				["Survival"] = {
					["source"] = "# https://github.com/simulationcraft/simc/",
					["builtIn"] = true,
					["date"] = 20210703,
					["author"] = "SimC",
					["desc"] = "Survival Hunter\nJuly 3, 2021",
					["lists"] = {
						["nta"] = {
							{
								["action"] = "steel_trap",
								["enabled"] = true,
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "! buff.wild_spirits.remains || buff.wild_spirits.remains & cooldown.kill_command.remains",
								["action"] = "freezing_trap",
							}, -- [2]
							{
								["enabled"] = true,
								["criteria"] = "! buff.wild_spirits.remains || buff.wild_spirits.remains & cooldown.kill_command.remains",
								["action"] = "tar_trap",
							}, -- [3]
						},
						["default"] = {
							{
								["action"] = "muzzle",
								["enabled"] = true,
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "! target.is_player",
								["action"] = "tranquilizing_shot",
								["description"] = "Go ahead and Tranquilize NPC enemies, we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.",
							}, -- [2]
							{
								["action"] = "use_items",
								["enabled"] = true,
							}, -- [3]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["list_name"] = "cds",
							}, -- [4]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies < 3 & talent.birds_of_prey.enabled",
								["list_name"] = "bop",
							}, -- [5]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies < 3 & ! talent.birds_of_prey.enabled",
								["list_name"] = "st",
							}, -- [6]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "active_enemies > 2",
								["list_name"] = "cleave",
							}, -- [7]
							{
								["action"] = "arcane_torrent",
								["enabled"] = true,
							}, -- [8]
						},
						["precombat"] = {
							{
								["enabled"] = true,
								["op"] = "setif",
								["description"] = "July 3, 2021",
								["value"] = "action.mongoose_bite.cost",
								["var_name"] = "mb_rs_cost",
								["action"] = "variable",
								["value_else"] = "action.raptor_strike.cost",
								["criteria"] = "talent.mongoose_bite.enabled",
							}, -- [1]
							{
								["action"] = "summon_pet",
								["enabled"] = true,
							}, -- [2]
							{
								["action"] = "bottled_flayedwing_toxin",
								["enabled"] = true,
							}, -- [3]
							{
								["action"] = "fleshcraft",
								["enabled"] = true,
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.soulforge_embers.equipped",
								["action"] = "tar_trap",
							}, -- [5]
							{
								["action"] = "steel_trap",
								["enabled"] = true,
							}, -- [6]
						},
						["cleave"] = {
							{
								["enabled"] = true,
								["criteria"] = "talent.hydras_bite.enabled & buff.vipers_venom.remains & buff.vipers_venom.remains < gcd",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [1]
							{
								["action"] = "wild_spirits",
								["enabled"] = true,
							}, -- [2]
							{
								["action"] = "resonating_arrow",
								["enabled"] = true,
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "full_recharge_time < gcd",
								["action"] = "wildfire_bomb",
							}, -- [4]
							{
								["action"] = "chakrams",
								["enabled"] = true,
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "dot.shrapnel_bomb.ticking & ( dot.internal_bleeding.stack < 2 || dot.shrapnel_bomb.remains < gcd )",
								["action"] = "butchery",
							}, -- [6]
							{
								["enabled"] = true,
								["criteria"] = "dot.shrapnel_bomb.ticking",
								["action"] = "carve",
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [8]
							{
								["action"] = "coordinated_assault",
								["enabled"] = true,
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "charges_fractional > 2.5 & cooldown.wildfire_bomb.full_recharge_time > spell_targets / 2",
								["action"] = "butchery",
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "flanking_strike",
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.wildfire_bomb.full_recharge_time > spell_targets / 2 & talent.alpha_predator.enabled",
								["action"] = "carve",
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & full_recharge_time < gcd & ( runeforge.nessingwarys_trapping_apparatus.equipped & cooldown.freezing_trap.remains & cooldown.tar_trap.remains || ! runeforge.nessingwarys_trapping_apparatus.equipped )",
								["action"] = "kill_command",
								["cycle_targets"] = 1,
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "! dot.wildfire_bomb.ticking",
								["action"] = "wildfire_bomb",
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "( ! next_wi_bomb.shrapnel || ! talent.wildfire_infusion.enabled ) & cooldown.wildfire_bomb.full_recharge_time > spell_targets / 2",
								["action"] = "butchery",
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.wildfire_bomb.full_recharge_time > spell_targets / 2",
								["action"] = "carve",
							}, -- [16]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [17]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [18]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [19]
							{
								["action"] = "steel_trap",
								["enabled"] = true,
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "refreshable & talent.hydras_bite.enabled & target.time_to_die > 8",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [21]
							{
								["action"] = "carve",
								["enabled"] = true,
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & ( runeforge.nessingwarys_trapping_apparatus.equipped & cooldown.freezing_trap.remains & cooldown.tar_trap.remains || ! runeforge.nessingwarys_trapping_apparatus.equipped )",
								["action"] = "kill_command",
								["cycle_targets"] = 1,
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "refreshable",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [24]
							{
								["enabled"] = true,
								["action"] = "mongoose_bite",
								["cycle_targets"] = 1,
							}, -- [25]
							{
								["enabled"] = true,
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [26]
						},
						["cds"] = {
							{
								["enabled"] = true,
								["criteria"] = "talent.terms_of_engagement.enabled & focus < focus.max",
								["action"] = "harpoon",
							}, -- [1]
							{
								["enabled"] = true,
								["name"] = "dreadfire_vessel",
								["action"] = "dreadfire_vessel",
								["criteria"] = "covenant.kyrian & cooldown.resonating_arrow.remains > 10 || ! covenant.kyrian",
							}, -- [2]
							{
								["enabled"] = true,
								["name"] = "jotungeirr_destinys_call",
								["action"] = "jotungeirr_destinys_call",
								["criteria"] = "buff.coordinated_assault.up || time_to_die < 31",
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up",
								["action"] = "blood_fury",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up",
								["action"] = "ancestral_call",
							}, -- [5]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up",
								["action"] = "fireblood",
							}, -- [6]
							{
								["action"] = "lights_judgment",
								["enabled"] = true,
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "cooldown.kill_command.full_recharge_time > gcd",
								["action"] = "bag_of_tricks",
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up || time_to_die < 13",
								["action"] = "berserking",
							}, -- [9]
							{
								["action"] = "muzzle",
								["enabled"] = true,
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "fight_remains < 60 || buff.coordinated_assault.up",
								["action"] = "potion",
							}, -- [11]
							{
								["enabled"] = true,
								["interrupt_if"] = "channeling&!soulbind.pustule_eruption",
								["criteria"] = "( focus < 70 || cooldown.coordinated_assault.remains < gcd ) & ( soulbind.pustule_eruption.enabled || soulbind.volatile_solvent.enabled )",
								["action"] = "fleshcraft",
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & runeforge.soulforge_embers.equipped & tar_trap.remains < gcd & cooldown.flare.remains < gcd & ( active_enemies > 1 || active_enemies = 1 & time_to_die > 5 * gcd )",
								["action"] = "tar_trap",
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & tar_trap.up & runeforge.soulforge_embers.equipped & time_to_die > 4 * gcd",
								["action"] = "flare",
								["line_cd"] = "25",
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies = 1 & target.time_to_die < focus / ( variable.mb_rs_cost - cast_regen ) * gcd",
								["action"] = "kill_shot",
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies = 1 & target.time_to_die < focus / ( variable.mb_rs_cost - cast_regen ) * gcd",
								["action"] = "mongoose_bite",
							}, -- [16]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies = 1 & target.time_to_die < focus / ( variable.mb_rs_cost - cast_regen ) * gcd",
								["action"] = "raptor_strike",
							}, -- [17]
							{
								["enabled"] = true,
								["criteria"] = "target.distance >= 6",
								["action"] = "aspect_of_the_eagle",
							}, -- [18]
						},
						["st"] = {
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "! dot.serpent_sting.ticking & target.time_to_die > 7 || buff.vipers_venom.up & buff.vipers_venom.remains < gcd",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [2]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [3]
							{
								["action"] = "resonating_arrow",
								["enabled"] = true,
							}, -- [4]
							{
								["action"] = "wild_spirits",
								["enabled"] = true,
							}, -- [5]
							{
								["action"] = "coordinated_assault",
								["enabled"] = true,
							}, -- [6]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "flanking_strike",
							}, -- [8]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "full_recharge_time < gcd || focus + cast_regen < focus.max & ( next_wi_bomb.volatile & dot.serpent_sting.ticking & dot.serpent_sting.refreshable || next_wi_bomb.pheromone & ! buff.mongoose_fury.up & focus + cast_regen < focus.max - action.kill_command.cast_regen * 3 ) || time_to_die < 10",
								["action"] = "wildfire_bomb",
							}, -- [10]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies > 1 & ! runeforge.rylakstalkers_confounding_strikes.equipped",
								["action"] = "carve",
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "active_enemies > 1 & ! runeforge.rylakstalkers_confounding_strikes.equipped & cooldown.wildfire_bomb.full_recharge_time > spell_targets & ( charges_fractional > 2.5 || dot.shrapnel_bomb.ticking )",
								["action"] = "butchery",
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "steel_trap",
							}, -- [13]
							{
								["enabled"] = true,
								["criteria"] = "talent.alpha_predator.enabled & ( buff.mongoose_fury.up & buff.mongoose_fury.remains < focus / ( variable.mb_rs_cost - cast_regen ) * gcd & ! buff.wild_spirits.remains || buff.mongoose_fury.remains & next_wi_bomb.pheromone )",
								["action"] = "mongoose_bite",
								["cycle_targets"] = 1,
							}, -- [14]
							{
								["enabled"] = true,
								["criteria"] = "full_recharge_time < gcd & focus + cast_regen < focus.max",
								["action"] = "kill_command",
								["cycle_targets"] = 1,
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "buff.tip_of_the_spear.stack = 3 || dot.shrapnel_bomb.ticking",
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [16]
							{
								["enabled"] = true,
								["criteria"] = "dot.shrapnel_bomb.ticking",
								["action"] = "mongoose_bite",
							}, -- [17]
							{
								["enabled"] = true,
								["criteria"] = "refreshable & target.time_to_die > 7 || buff.vipers_venom.up",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [18]
							{
								["enabled"] = true,
								["criteria"] = "next_wi_bomb.shrapnel & focus > variable.mb_rs_cost * 2 & dot.serpent_sting.remains > 5 * gcd",
								["action"] = "wildfire_bomb",
							}, -- [19]
							{
								["action"] = "chakrams",
								["enabled"] = true,
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "kill_command",
								["cycle_targets"] = 1,
							}, -- [21]
							{
								["enabled"] = true,
								["criteria"] = "runeforge.rylakstalkers_confounding_strikes.equipped",
								["action"] = "wildfire_bomb",
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "buff.mongoose_fury.up || focus + action.kill_command.cast_regen > focus.max - 15 || dot.shrapnel_bomb.ticking || buff.wild_spirits.remains",
								["action"] = "mongoose_bite",
								["cycle_targets"] = 1,
							}, -- [23]
							{
								["enabled"] = true,
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [24]
							{
								["enabled"] = true,
								["criteria"] = "next_wi_bomb.volatile & dot.serpent_sting.ticking || next_wi_bomb.pheromone || next_wi_bomb.shrapnel & focus > 50",
								["action"] = "wildfire_bomb",
							}, -- [25]
						},
						["bop"] = {
							{
								["enabled"] = true,
								["criteria"] = "buff.vipers_venom.remains & ( buff.vipers_venom.remains < gcd || refreshable )",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [1]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & buff.nesingwarys_trapping_apparatus.up || focus + cast_regen < focus.max + 10 & buff.nesingwarys_trapping_apparatus.up & buff.nesingwarys_trapping_apparatus.remains < gcd",
								["action"] = "kill_command",
								["cycle_targets"] = 1,
							}, -- [2]
							{
								["action"] = "kill_shot",
								["enabled"] = true,
							}, -- [3]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & ! ticking & full_recharge_time < gcd",
								["action"] = "wildfire_bomb",
							}, -- [4]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "flanking_strike",
							}, -- [5]
							{
								["action"] = "flayed_shot",
								["enabled"] = true,
							}, -- [6]
							{
								["enabled"] = true,
								["action"] = "call_action_list",
								["criteria"] = "runeforge.nessingwarys_trapping_apparatus.equipped & focus < variable.mb_rs_cost",
								["list_name"] = "nta",
							}, -- [7]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "death_chakram",
							}, -- [8]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up & buff.coordinated_assault.remains < 1.5 * gcd",
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [9]
							{
								["enabled"] = true,
								["criteria"] = "buff.coordinated_assault.up & buff.coordinated_assault.remains < 1.5 * gcd",
								["action"] = "mongoose_bite",
								["cycle_targets"] = 1,
							}, -- [10]
							{
								["action"] = "a_murder_of_crows",
								["enabled"] = true,
							}, -- [11]
							{
								["enabled"] = true,
								["criteria"] = "buff.tip_of_the_spear.stack = 3",
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [12]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max & ! ticking & ( full_recharge_time < gcd || ! dot.wildfire_bomb.ticking & buff.mongoose_fury.remains > full_recharge_time - 1 * gcd || ! dot.wildfire_bomb.ticking & ! buff.mongoose_fury.remains ) || time_to_die < 18 & ! dot.wildfire_bomb.ticking",
								["action"] = "wildfire_bomb",
							}, -- [13]
							{
								["enabled"] = true,
								["action"] = "kill_command",
								["cycle_targets"] = 1,
								["description"] = "If you don't have Nessingwary's Trapping Apparatus, simply cast Kill Command if you won't overcap on Focus from doing so. If you do have Nessingwary's Trapping Apparatus you should cast Kill Command if your focus is below the cost of Mongoose Bite or Raptor Strike",
								["criteria"] = "focus + cast_regen < focus.max & ( ! runeforge.nessingwarys_trapping_apparatus.enabled || focus < variable.mb_rs_cost )",
							}, -- [14]
							{
								["enabled"] = true,
								["action"] = "kill_command",
								["cycle_targets"] = 1,
								["description"] = "With Nessingwary's Trapping Apparatus only Kill Command if your traps are on cooldown, otherwise stop using Kill Command if your current focus amount is enough to sustain the amount of time left for any of your traps to come off cooldown",
								["criteria"] = "focus + cast_regen < focus.max & runeforge.nessingwarys_trapping_apparatus.enabled & cooldown.freezing_trap.remains > ( focus / ( variable.mb_rs_cost - cast_regen ) * gcd ) & cooldown.tar_trap.remains > ( focus / ( variable.mb_rs_cost - cast_regen ) * gcd ) & ( ! talent.steel_trap.enabled || talent.steel_trap.enabled & cooldown.steel_trap.remains > ( focus / ( variable.mb_rs_cost - cast_regen ) * gcd ) )",
							}, -- [15]
							{
								["enabled"] = true,
								["criteria"] = "focus + cast_regen < focus.max",
								["action"] = "steel_trap",
							}, -- [16]
							{
								["enabled"] = true,
								["criteria"] = "dot.serpent_sting.refreshable & ! buff.coordinated_assault.up",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [17]
							{
								["action"] = "resonating_arrow",
								["enabled"] = true,
							}, -- [18]
							{
								["action"] = "wild_spirits",
								["enabled"] = true,
							}, -- [19]
							{
								["enabled"] = true,
								["criteria"] = "! buff.coordinated_assault.up",
								["action"] = "coordinated_assault",
							}, -- [20]
							{
								["enabled"] = true,
								["criteria"] = "buff.mongoose_fury.up || focus + action.kill_command.cast_regen > focus.max || buff.coordinated_assault.up",
								["action"] = "mongoose_bite",
							}, -- [21]
							{
								["enabled"] = true,
								["action"] = "raptor_strike",
								["cycle_targets"] = 1,
							}, -- [22]
							{
								["enabled"] = true,
								["criteria"] = "dot.wildfire_bomb.refreshable",
								["action"] = "wildfire_bomb",
							}, -- [23]
							{
								["enabled"] = true,
								["criteria"] = "buff.vipers_venom.up",
								["action"] = "serpent_sting",
								["cycle_targets"] = 1,
							}, -- [24]
						},
					},
					["version"] = 20210703,
					["warnings"] = "WARNING:  The import for 'precombat' required some automated changes.\nLine 1: Converted 'talent.X' to 'talent.X.enabled' at EOL (1x).\n\nWARNING:  The import for 'st' required some automated changes.\nLine 14: Converted SimC syntax % to Lua division operator (/) (1x).\n\nWARNING:  The import for 'cds' required some automated changes.\nLine 12: Converted 'soulbind.X' to 'soulbind.X.enabled' (2x).\nLine 15: Converted SimC syntax % to Lua division operator (/) (1x).\nLine 16: Converted SimC syntax % to Lua division operator (/) (1x).\nLine 17: Converted SimC syntax % to Lua division operator (/) (1x).\n\nWARNING:  The import for 'bop' required some automated changes.\nLine 14: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\nLine 15: Converted SimC syntax % to Lua division operator (/) (3x).\nLine 15: Converted 'talent.X' to 'talent.X.enabled' (2x).\nLine 15: Converted 'runeforge.X' to 'runeforge.X.enabled' (1x).\n\nWARNING:  The import for 'cleave' required some automated changes.\nLine 10: Converted SimC syntax % to Lua division operator (/) (1x).\nLine 12: Converted SimC syntax % to Lua division operator (/) (1x).\nLine 15: Converted SimC syntax % to Lua division operator (/) (1x).\nLine 16: Converted SimC syntax % to Lua division operator (/) (1x).\n\nImported 7 action lists.\n",
					["profile"] = "# Survival Hunter\n# July 3, 2021\n\nactions.precombat+=/variable,name=mb_rs_cost,op=setif,value=action.mongoose_bite.cost,value_else=action.raptor_strike.cost,condition=talent.mongoose_bite\nactions.precombat+=/summon_pet\nactions.precombat+=/bottled_flayedwing_toxin\nactions.precombat+=/fleshcraft\nactions.precombat+=/tar_trap,if=runeforge.soulforge_embers.equipped\nactions.precombat+=/steel_trap\n\nactions+=/muzzle\n# Go ahead and Tranquilize NPC enemies; we don't do this for players because it'd be too spammy and we can't readily Tranq specific buffs.\nactions+=/tranquilizing_shot,if=!target.is_player\nactions+=/use_items\n## Delay facing your doubt until you have put Resonating Arrow down, or if the cooldown is too long to delay facing your Doubt. If none of these conditions are able to met within the 10 seconds leeway, the sim faces your Doubt automatically.\n## actions+=/newfound_resolve,if=soulbind.newfound_resolve&(buff.resonating_arrow.up||cooldown.resonating_arrow.remains>10||target.time_to_die<16)\nactions+=/call_action_list,name=cds\nactions+=/call_action_list,name=bop,if=active_enemies<3&talent.birds_of_prey.enabled\nactions+=/call_action_list,name=st,if=active_enemies<3&!talent.birds_of_prey.enabled\nactions+=/call_action_list,name=cleave,if=active_enemies>2\nactions+=/arcane_torrent\n\nactions.bop=serpent_sting,cycle_targets=1,if=buff.vipers_venom.remains&(buff.vipers_venom.remains<gcd||refreshable)\nactions.bop+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max&buff.nesingwarys_trapping_apparatus.up||focus+cast_regen<focus.max+10&buff.nesingwarys_trapping_apparatus.up&buff.nesingwarys_trapping_apparatus.remains<gcd\nactions.bop+=/kill_shot\nactions.bop+=/wildfire_bomb,if=focus+cast_regen<focus.max&!ticking&full_recharge_time<gcd\nactions.bop+=/flanking_strike,if=focus+cast_regen<focus.max\nactions.bop+=/flayed_shot\nactions.bop+=/call_action_list,name=nta,if=runeforge.nessingwarys_trapping_apparatus.equipped&focus<variable.mb_rs_cost\nactions.bop+=/death_chakram,if=focus+cast_regen<focus.max\nactions.bop+=/raptor_strike,cycle_targets=1,if=buff.coordinated_assault.up&buff.coordinated_assault.remains<1.5*gcd\nactions.bop+=/mongoose_bite,cycle_targets=1,if=buff.coordinated_assault.up&buff.coordinated_assault.remains<1.5*gcd\nactions.bop+=/a_murder_of_crows\nactions.bop+=/raptor_strike,cycle_targets=1,if=buff.tip_of_the_spear.stack=3\nactions.bop+=/wildfire_bomb,if=focus+cast_regen<focus.max&!ticking&(full_recharge_time<gcd||!dot.wildfire_bomb.ticking&buff.mongoose_fury.remains>full_recharge_time-1*gcd||!dot.wildfire_bomb.ticking&!buff.mongoose_fury.remains)||time_to_die<18&!dot.wildfire_bomb.ticking\n# If you don't have Nessingwary's Trapping Apparatus, simply cast Kill Command if you won't overcap on Focus from doing so. If you do have Nessingwary's Trapping Apparatus you should cast Kill Command if your focus is below the cost of Mongoose Bite or Raptor Strike\nactions.bop+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max&(!runeforge.nessingwarys_trapping_apparatus||focus<variable.mb_rs_cost)\n# With Nessingwary's Trapping Apparatus only Kill Command if your traps are on cooldown, otherwise stop using Kill Command if your current focus amount is enough to sustain the amount of time left for any of your traps to come off cooldown\nactions.bop+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max&runeforge.nessingwarys_trapping_apparatus&cooldown.freezing_trap.remains>(focus%(variable.mb_rs_cost-cast_regen)*gcd)&cooldown.tar_trap.remains>(focus%(variable.mb_rs_cost-cast_regen)*gcd)&(!talent.steel_trap||talent.steel_trap&cooldown.steel_trap.remains>(focus%(variable.mb_rs_cost-cast_regen)*gcd))\nactions.bop+=/steel_trap,if=focus+cast_regen<focus.max\nactions.bop+=/serpent_sting,cycle_targets=1,if=dot.serpent_sting.refreshable&!buff.coordinated_assault.up\nactions.bop+=/resonating_arrow\nactions.bop+=/wild_spirits\nactions.bop+=/coordinated_assault,if=!buff.coordinated_assault.up\nactions.bop+=/mongoose_bite,if=buff.mongoose_fury.up||focus+action.kill_command.cast_regen>focus.max||buff.coordinated_assault.up\nactions.bop+=/raptor_strike,cycle_targets=1\nactions.bop+=/wildfire_bomb,if=dot.wildfire_bomb.refreshable\nactions.bop+=/serpent_sting,cycle_targets=1,if=buff.vipers_venom.up\n\nactions.cds=harpoon,if=talent.terms_of_engagement.enabled&focus<focus.max\nactions.cds+=/use_item,name=dreadfire_vessel,if=covenant.kyrian&cooldown.resonating_arrow.remains>10||!covenant.kyrian\nactions.cds+=/use_item,name=jotungeirr_destinys_call,if=buff.coordinated_assault.up||time_to_die<31\nactions.cds+=/blood_fury,if=buff.coordinated_assault.up\nactions.cds+=/ancestral_call,if=buff.coordinated_assault.up\nactions.cds+=/fireblood,if=buff.coordinated_assault.up\nactions.cds+=/lights_judgment\nactions.cds+=/bag_of_tricks,if=cooldown.kill_command.full_recharge_time>gcd\nactions.cds+=/berserking,if=buff.coordinated_assault.up||time_to_die<13\nactions.cds+=/muzzle\nactions.cds+=/potion,if=fight_remains<60||buff.coordinated_assault.up\nactions.cds+=/fleshcraft,interrupt_if=channeling&!soulbind.pustule_eruption,if=(focus<70||cooldown.coordinated_assault.remains<gcd)&(soulbind.pustule_eruption||soulbind.volatile_solvent)\nactions.cds+=/tar_trap,if=focus+cast_regen<focus.max&runeforge.soulforge_embers.equipped&tar_trap.remains<gcd&cooldown.flare.remains<gcd&(active_enemies>1||active_enemies=1&time_to_die>5*gcd)\nactions.cds+=/flare,line_cd=25,if=focus+cast_regen<focus.max&tar_trap.up&runeforge.soulforge_embers.equipped&time_to_die>4*gcd\nactions.cds+=/kill_shot,if=active_enemies=1&target.time_to_die<focus%(variable.mb_rs_cost-cast_regen)*gcd\nactions.cds+=/mongoose_bite,if=active_enemies=1&target.time_to_die<focus%(variable.mb_rs_cost-cast_regen)*gcd\nactions.cds+=/raptor_strike,if=active_enemies=1&target.time_to_die<focus%(variable.mb_rs_cost-cast_regen)*gcd\nactions.cds+=/aspect_of_the_eagle,if=target.distance>=6\n\nactions.cleave=serpent_sting,cycle_targets=1,if=talent.hydras_bite.enabled&buff.vipers_venom.remains&buff.vipers_venom.remains<gcd\nactions.cleave+=/wild_spirits\nactions.cleave+=/resonating_arrow\nactions.cleave+=/wildfire_bomb,if=full_recharge_time<gcd\nactions.cleave+=/chakrams\nactions.cleave+=/butchery,if=dot.shrapnel_bomb.ticking&(dot.internal_bleeding.stack<2||dot.shrapnel_bomb.remains<gcd)\nactions.cleave+=/carve,if=dot.shrapnel_bomb.ticking\nactions.cleave+=/death_chakram,if=focus+cast_regen<focus.max\nactions.cleave+=/coordinated_assault\nactions.cleave+=/butchery,if=charges_fractional>2.5&cooldown.wildfire_bomb.full_recharge_time>spell_targets%2\nactions.cleave+=/flanking_strike,if=focus+cast_regen<focus.max\nactions.cleave+=/carve,if=cooldown.wildfire_bomb.full_recharge_time>spell_targets%2&talent.alpha_predator.enabled\nactions.cleave+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max&full_recharge_time<gcd&(runeforge.nessingwarys_trapping_apparatus.equipped&cooldown.freezing_trap.remains&cooldown.tar_trap.remains||!runeforge.nessingwarys_trapping_apparatus.equipped)\nactions.cleave+=/wildfire_bomb,if=!dot.wildfire_bomb.ticking\nactions.cleave+=/butchery,if=(!next_wi_bomb.shrapnel||!talent.wildfire_infusion.enabled)&cooldown.wildfire_bomb.full_recharge_time>spell_targets%2\nactions.cleave+=/carve,if=cooldown.wildfire_bomb.full_recharge_time>spell_targets%2\nactions.cleave+=/kill_shot\nactions.cleave+=/flayed_shot\nactions.cleave+=/a_murder_of_crows\nactions.cleave+=/steel_trap\nactions.cleave+=/serpent_sting,cycle_targets=1,if=refreshable&talent.hydras_bite.enabled&target.time_to_die>8\nactions.cleave+=/carve\nactions.cleave+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max&(runeforge.nessingwarys_trapping_apparatus.equipped&cooldown.freezing_trap.remains&cooldown.tar_trap.remains||!runeforge.nessingwarys_trapping_apparatus.equipped)\nactions.cleave+=/serpent_sting,cycle_targets=1,if=refreshable\nactions.cleave+=/mongoose_bite,cycle_targets=1\nactions.cleave+=/raptor_strike,cycle_targets=1\n\nactions.nta=steel_trap\nactions.nta+=/freezing_trap,if=!buff.wild_spirits.remains||buff.wild_spirits.remains&cooldown.kill_command.remains\nactions.nta+=/tar_trap,if=!buff.wild_spirits.remains||buff.wild_spirits.remains&cooldown.kill_command.remains\n\nactions.st=death_chakram,if=focus+cast_regen<focus.max\nactions.st+=/serpent_sting,cycle_targets=1,if=!dot.serpent_sting.ticking&target.time_to_die>7||buff.vipers_venom.up&buff.vipers_venom.remains<gcd\nactions.st+=/flayed_shot\nactions.st+=/resonating_arrow\nactions.st+=/wild_spirits\nactions.st+=/coordinated_assault\nactions.st+=/kill_shot\nactions.st+=/flanking_strike,if=focus+cast_regen<focus.max\nactions.st+=/a_murder_of_crows\nactions.st+=/wildfire_bomb,if=full_recharge_time<gcd||focus+cast_regen<focus.max&(next_wi_bomb.volatile&dot.serpent_sting.ticking&dot.serpent_sting.refreshable||next_wi_bomb.pheromone&!buff.mongoose_fury.up&focus+cast_regen<focus.max-action.kill_command.cast_regen*3)||time_to_die<10\nactions.st+=/carve,if=active_enemies>1&!runeforge.rylakstalkers_confounding_strikes.equipped\nactions.st+=/butchery,if=active_enemies>1&!runeforge.rylakstalkers_confounding_strikes.equipped&cooldown.wildfire_bomb.full_recharge_time>spell_targets&(charges_fractional>2.5||dot.shrapnel_bomb.ticking)\nactions.st+=/steel_trap,if=focus+cast_regen<focus.max\nactions.st+=/mongoose_bite,cycle_targets=1,if=talent.alpha_predator.enabled&(buff.mongoose_fury.up&buff.mongoose_fury.remains<focus%(variable.mb_rs_cost-cast_regen)*gcd&!buff.wild_spirits.remains||buff.mongoose_fury.remains&next_wi_bomb.pheromone)\nactions.st+=/kill_command,cycle_targets=1,if=full_recharge_time<gcd&focus+cast_regen<focus.max\nactions.st+=/raptor_strike,cycle_targets=1,if=buff.tip_of_the_spear.stack=3||dot.shrapnel_bomb.ticking\nactions.st+=/mongoose_bite,if=dot.shrapnel_bomb.ticking\nactions.st+=/serpent_sting,cycle_targets=1,if=refreshable&target.time_to_die>7||buff.vipers_venom.up\nactions.st+=/wildfire_bomb,if=next_wi_bomb.shrapnel&focus>variable.mb_rs_cost*2&dot.serpent_sting.remains>5*gcd\nactions.st+=/chakrams\nactions.st+=/kill_command,cycle_targets=1,if=focus+cast_regen<focus.max\nactions.st+=/wildfire_bomb,if=runeforge.rylakstalkers_confounding_strikes.equipped\nactions.st+=/mongoose_bite,cycle_targets=1,if=buff.mongoose_fury.up||focus+action.kill_command.cast_regen>focus.max-15||dot.shrapnel_bomb.ticking||buff.wild_spirits.remains\nactions.st+=/raptor_strike,cycle_targets=1\nactions.st+=/wildfire_bomb,if=next_wi_bomb.volatile&dot.serpent_sting.ticking||next_wi_bomb.pheromone||next_wi_bomb.shrapnel&focus>50",
					["spec"] = 255,
				},
			},
			["specs"] = {
				[253] = {
					["custom2Name"] = "Custom 2",
					["throttleRefresh"] = false,
					["enhancedRecheck"] = false,
					["enabled"] = true,
					["petbased"] = false,
					["custom1Name"] = "Custom 1",
					["cycle"] = false,
					["maxRefresh"] = 10,
					["damagePets"] = false,
					["settings"] = {
						["barbed_shot_grace_period"] = 0.5,
						["avoid_bw_overlap"] = false,
					},
					["aoe"] = 3,
					["gcdSync"] = true,
					["damageDots"] = false,
					["damage"] = true,
					["debuffPadding"] = 0,
					["maxTime"] = 33,
					["package"] = "Beast Mastery",
					["nameplates"] = false,
					["cycle_min"] = 6,
					["nameplateRange"] = 8,
					["potion"] = "spectral_agility",
					["throttleTime"] = false,
					["potionsReset"] = 20180919.1,
					["damageExpiration"] = 3,
					["buffPadding"] = 0,
					["damageRange"] = 0,
				},
				[254] = {
					["custom2Name"] = "Custom 2",
					["throttleRefresh"] = false,
					["enhancedRecheck"] = false,
					["enabled"] = true,
					["petbased"] = false,
					["custom1Name"] = "Custom 1",
					["cycle"] = false,
					["maxRefresh"] = 10,
					["damagePets"] = false,
					["settings"] = {
						["eagletalon_swap"] = false,
						["prevent_hardcasts"] = false,
					},
					["aoe"] = 3,
					["gcdSync"] = true,
					["damageDots"] = false,
					["buffPadding"] = 0,
					["debuffPadding"] = 0,
					["maxTime"] = 33,
					["package"] = "Marksmanship",
					["nameplates"] = false,
					["cycle_min"] = 6,
					["nameplateRange"] = 8,
					["potion"] = "spectral_agility",
					["throttleTime"] = false,
					["potionsReset"] = 20180919.1,
					["damageExpiration"] = 6,
					["damage"] = true,
					["damageRange"] = 0,
				},
				[102] = {
					["enabled"] = true,
					["enhancedRecheck"] = true,
				},
				[255] = {
					["custom2Name"] = "Custom 2",
					["throttleRefresh"] = false,
					["enhancedRecheck"] = false,
					["enabled"] = true,
					["petbased"] = false,
					["custom1Name"] = "Custom 1",
					["cycle"] = false,
					["maxRefresh"] = 10,
					["damagePets"] = false,
					["settings"] = {
						["use_harpoon"] = true,
						["ca_vop_overlap"] = false,
					},
					["aoe"] = 2,
					["gcdSync"] = true,
					["damageDots"] = false,
					["buffPadding"] = 0,
					["debuffPadding"] = 0,
					["maxTime"] = 33,
					["package"] = "Survival",
					["nameplates"] = true,
					["cycle_min"] = 6,
					["nameplateRange"] = 8,
					["potion"] = "spectral_agility",
					["throttleTime"] = false,
					["potionsReset"] = 20180919.1,
					["damageExpiration"] = 8,
					["damage"] = true,
					["damageRange"] = 0,
				},
			},
			["notifications"] = {
				["y"] = -16.66685485839844,
				["x"] = -636.6668090820312,
			},
		},
	},
}
