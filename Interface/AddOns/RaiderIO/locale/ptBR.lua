local ns = select(2, ...) ---@type ns @The addon namespace.

if ns:IsSameLocale("ptBR") then
	local L = ns.L or ns:NewLocale()

	L.LOCALE_NAME = "ptBR"

	L["ALLOW_IN_LFD"] = "Permitir no localizador de masmorras."
L["ALLOW_IN_LFD_DESC"] = "Clique-direito em grupos ou candidatos no localizador de masmorras para copiar o URL do perfil Raider.IO."
L["ALLOW_ON_PLAYER_UNITS"] = "Permitir em retratos de jogador"
L["ALLOW_ON_PLAYER_UNITS_DESC"] = "Clique-direito no retrato do jogador para copiar a URL do perfil Raider.IO."
L["API_DEPRECATED"] = "|cffFF0000Warning!|r O Addon |cffFFFFFF%s|r está chamando uma função descontinuada do RaiderIO.%s. Esta função será removida em versões futuras. Por favor, incentive o autor de %s a atualizar seu addon. Call stack: %s"
L["API_DEPRECATED_UNKNOWN_ADDON"] = "<AddOn Desconhecido>"
L["API_DEPRECATED_UNKNOWN_FILE"] = "<Arquivo de AddOn Desconhecido>"
L["API_DEPRECATED_WITH"] = "|cffFF0000Warning!|r O Addon |cffFFFFFF%s|r está chamando uma função descontinuada do RaiderIO.%s. Esta função será removida em versões futuras. Incentive o autor de %s a atualizar para a nova API do RaiderIO.%s. Call stack:%s"
L["API_INVALID_DATABASE"] = "|cffFF0000Warning!|r Detectou um banco de dados Raider.IO inválido em |cffffffff%s|r. Atualize todas as regiões e facções no cliente Raider.IO ou reinstale o addon manualmente."
L["AUTO_COMBATLOG"] = "Habilita Automaticamente o Log de Combate em Raides e Masmorras"
L["AUTO_COMBATLOG_DESC"] = "Habilitar e desabilitar o Registro de Combate quando entrar ou sair de masmorras e raids suportadas."
L["BEST_FOR_DUNGEON"] = "Melhor por Masmorra"
L["BEST_RUN"] = "Melhor M+"
L["BEST_SCORE"] = "Melhor Pontuação de M+ (%s)"
L["CANCEL"] = "Cancelar"
L["CHANGES_REQUIRES_UI_RELOAD"] = "Suas mudanças foram salvas, mas você precisa recarregar sua interface para que elas funcionem. Você deseja fazer isso agora?"
L["CHARACTER_LF_GUILD_MPLUS"] = "Procurando por Guilda para Mítica+"
L["CHARACTER_LF_GUILD_MPLUS_WITH_SCORE"] = "Procurando por Guilda para Mítica+"
L["CHARACTER_LF_GUILD_PVP"] = "Procurando por Guilda para PvP"
L["CHARACTER_LF_GUILD_RAID_DEFAULT"] = "Procurando por Guilda para Raidar"
L["CHARACTER_LF_GUILD_RAID_HEROIC"] = "Procurando por Guilda para Raidar Heroico"
L["CHARACTER_LF_GUILD_RAID_MYTHIC"] = "Procurando por Guilda para Raidar Mítico"
L["CHARACTER_LF_GUILD_RAID_NORMAL"] = "Procurando por Guilda para Raidar Normal"
L["CHARACTER_LF_GUILD_SOCIAL"] = "Procurando por Guilda Social"
L["CHARACTER_LF_TEAM_MPLUS_DEFAULT"] = "Procurando por um Grupo de Mítica+"
L["CHARACTER_LF_TEAM_MPLUS_WITH_SCORE"] = "Procurando por %d+ Grupo de Mítica+"
L["CHECKBOX_DISPLAY_WEEKLY"] = "Mostrar Semanalmente"
L["CHOOSE_HEADLINE_HEADER"] = " Informação em destaque.de Mítica+"
L["CONFIG_WHERE_TO_SHOW_TOOLTIPS"] = "Onde Mostrar o Progresso em Mítica+ e Raide"
L["CONFIRM"] = "Confirmar"
L["COPY_RAIDERIO_PROFILE_URL"] = "Copiar URL do Raider.IO"
L["COPY_RAIDERIO_RECRUITMENT_URL"] = "Copiar URL de Recrutamento"
L["COPY_RAIDERIO_URL"] = "Copiar URL do Raider.IO"
L["CURRENT_MAINS_SCORE"] = "Pontuação de M+ Atual do Main"
L["CURRENT_SCORE"] = "Pontuação Atual de M+"
--[[Translation missing --]]
--[[ L["DB_MODULES"] = ""--]] 
--[[Translation missing --]]
--[[ L["DB_MODULES_HEADER_MYTHIC_PLUS"] = ""--]] 
--[[Translation missing --]]
--[[ L["DB_MODULES_HEADER_RAIDING"] = ""--]] 
--[[Translation missing --]]
--[[ L["DB_MODULES_HEADER_RECRUITMENT"] = ""--]] 
L["DISABLE_DEBUG_MODE_RELOAD"] = "Você está desabilitando o Modo de Depuração. Clicar em Confirmar irá Recarregar sua Interface."
L["DISABLE_RWF_MODE_BUTTON"] = "Desabilitar"
L["DISABLE_RWF_MODE_BUTTON_TOOLTIP"] = "Clique para desativar o modo Race World First. Isso fará com que sua interface seja recarregada."
L["DISABLE_RWF_MODE_RELOAD"] = "Você está desabilitando o modo Race World First. Clicar em Confirmar irá recarregar sua interface."
L["DPS"] = "DPS"
L["DUNGEON_SHORT_NAME_DOS"] = "Outro Lado"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_GD"] = ""--]] 
L["DUNGEON_SHORT_NAME_GMBT"] = "Gambito de So'leah"
L["DUNGEON_SHORT_NAME_HOA"] = "Salões"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_ID"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_LOWR"] = ""--]] 
L["DUNGEON_SHORT_NAME_MISTS"] = "Brumas"
L["DUNGEON_SHORT_NAME_NW"] = "Chaga"
L["DUNGEON_SHORT_NAME_PF"] = "Empéstia"
L["DUNGEON_SHORT_NAME_SD"] = "Profundezas"
L["DUNGEON_SHORT_NAME_SOA"] = "Torres"
L["DUNGEON_SHORT_NAME_STRT"] = "Ruas das Maravilhas"
L["DUNGEON_SHORT_NAME_TOP"] = "Teatro"
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_UPPR"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_WORK"] = ""--]] 
--[[Translation missing --]]
--[[ L["DUNGEON_SHORT_NAME_YARD"] = ""--]] 
L["ENABLE_AUTO_FRAME_POSITION"] = "Posicionar o Quadro de Perfil do Raider.IO Automaticamente."
L["ENABLE_AUTO_FRAME_POSITION_DESC"] = "Ativar isso manterá o Quadro de perfil de M+ ao lado do \"Localizador de grupos\"."
L["ENABLE_DEBUG_MODE_RELOAD"] = "Você está ativando o modo de depuração. Destina-se apenas a fins de teste e desenvolvimento e incorrerá em uso adicional de memória. Clicar em Confirmar recarregará sua interface."
L["ENABLE_LOCK_PROFILE_FRAME"] = "Bloquear quadro de perfil do Raider.IO"
L["ENABLE_LOCK_PROFILE_FRAME_DESC"] = "Impede que o quadro de perfil M+ seja arrastado. Isso não tem efeito se o quadro de perfil M+ estiver definido para ser posicionado automaticamente."
L["ENABLE_NO_SCORE_COLORS"] = "Desativar todas as cores de pontuação de Míticas+"
L["ENABLE_NO_SCORE_COLORS_DESC"] = "Coloração de pontuação desativada. Todas as pontuações serão mostradas em branco."
L["ENABLE_RAIDERIO_CLIENT_ENHANCEMENTS"] = "Permitir aprimoramentos do cliente Raider.IO"
L["ENABLE_RAIDERIO_CLIENT_ENHANCEMENTS_DESC"] = "A ativação dessa opção permitirá que você visualize dados detalhados do perfil Raider.IO baixados do Cliente Raider.IO para os personagens selecionados."
L["ENABLE_RWF_MODE_BUTTON"] = "Habilitar"
L["ENABLE_RWF_MODE_BUTTON_TOOLTIP"] = "Clique para ativar o modo Race World First. Isso fará com que sua interface seja recarregada."
L["ENABLE_RWF_MODE_RELOAD"] = "Você está ativando o modo Race World First. Isso é destinado ao uso com a corrida Mythic World First e deve ser usado apenas para esse propósito junto com o cliente do Raider.IO para upload de dados. Clicar em Confirmar irá recarregar sua interface."
L["ENABLE_SIMPLE_SCORE_COLORS"] = "Usar cores simples para Pontuação de Mítica+"
L["ENABLE_SIMPLE_SCORE_COLORS_DESC"] = "Mostra pontuações apenas com cores de qualidade de item padrão. Isso pode tornar mais fácil para aqueles com deficiências de visão de cores distinguir os níveis de pontuação."
L["EXPORTJSON_COPY_TEXT"] = "Copie o seguinte e cole-o em qualquer lugar em |cff00C8FFhttps://raider.io|r para procurar todos os players."
L["GENERAL_TOOLTIP_OPTIONS"] = "Opções gerais da dica (tooltip)."
L["GUILD_BEST_SEASON"] = "Guilda: Melhor da Season"
L["GUILD_BEST_TITLE"] = "Recordes do Raider.IO"
L["GUILD_BEST_WEEKLY"] = "Guilda: Melhor da Semana"
L["GUILD_LF_MPLUS_DEFAULT"] = "Recrutando Jogadores de Mítica+"
L["GUILD_LF_MPLUS_WITH_SCORE"] = "Recrutando Jogadores de Mítica+ com score de %d+"
L["GUILD_LF_PVP"] = "Recrutando Jogadores para PvP"
L["GUILD_LF_RAID_DEFAULT"] = "Recrutando Raiders"
L["GUILD_LF_RAID_HEROIC"] = "Recrutando Raiders para Heroico"
L["GUILD_LF_RAID_MYTHIC"] = "Recrutando Raiders para Mítico"
L["GUILD_LF_RAID_NORMAL"] = "Recrutando Raiders para Normal"
L["GUILD_LF_SOCIAL"] = "Recrutando Jogadores Sociais"
L["HEALER"] = "Curador"
L["HIDE_OWN_PROFILE"] = "Ocultar perfil pessoal no Raider.IO."
L["HIDE_OWN_PROFILE_DESC"] = "Quando definido, isso não mostrará seu próprio perfil Raider.IO na dica (tooltip), mas poderá mostrar outros jogadores, se eles tiverem um."
L["INVERSE_PROFILE_MODIFIER"] = "Inverter o Modificador da dica (tooltip) do Perfil do Raider.IO"
L["INVERSE_PROFILE_MODIFIER_DESC"] = "Ativar isso inverte o comportamento do modificador da dica (tooltip) do Raider.IO (shift/ctrl/alt): mantenha pressionado para alternar a exibição entre o perfil Pessoal/Líder ou perfil Líder/Pessoal."
L["LOCKING_PROFILE_FRAME"] = "Raider.IO: Bloqueando o quadro de perfil M+."
L["MAINS_BEST_SCORE_BEST_SEASON"] = "Melhor pontuação de M+ do Main (%s)"
L["MAINS_RAID_PROGRESS"] = "Progresso do Main"
L["MAINS_SCORE"] = "Pontuação de M+ do Main"
L["MODULE_AMERICAS"] = "Américas"
L["MODULE_EUROPE"] = "Europa"
L["MODULE_KOREA"] = "Coréia"
L["MODULE_TAIWAN"] = "Taiwan"
L["MY_PROFILE_TITLE"] = "Perfil do Raider.IO"
--[[Translation missing --]]
--[[ L["MYTHIC_PLUS_DB_MODULES"] = ""--]] 
L["MYTHIC_PLUS_SCORES"] = "Tooltips de Mítica+"
L["NO_GUILD_RECORD"] = "Sem registros da Guilda"
L["OPEN_CONFIG"] = "Abrir Configuração"
L["OUT_OF_SYNC_DATABASE_S"] = "|cffFFFFFF%s|r possui dados de facção da Horda/Aliança que não estão sincronizados. Atualize as configurações do cliente do Raider.IO para sincronizar as duas facções."
L["OUTDATED_DATABASE"] = "As pontuações têm %d dias."
L["OUTDATED_DATABASE_HOURS"] = "As pontuações têm %d horas."
L["OUTDATED_DOWNLOAD_LINK"] = "Download: |cffffbd0a%s|r"
L["OUTDATED_EXPIRED_ALERT"] = "|cffFFFFFF%s|r está usando dados expirados. Atualize agora para ver os dados mais precisos:  |cffFFFFFF%s|r."
L["OUTDATED_EXPIRED_TITLE"] = "Os dados do Raider.IO expiraram."
L["OUTDATED_EXPIRES_IN_DAYS"] = "Dados do Raider.IO expiram em %d dias."
L["OUTDATED_EXPIRES_IN_HOURS"] = "Dados do Raider.IO expiram em %d horas."
L["OUTDATED_EXPIRES_IN_MINUTES"] = "Dados do Raider.IO expiram em %d Minutos"
L["OUTDATED_PROFILE_TOOLTIP_MESSAGE"] = [=[Atualize seu Addon agora para ver os dados mais precisos. Os jogadores trabalham duro para melhorar seu progresso, e exibir dados muito antigos é um desserviço para eles. Você pode usar o Raider.IO Client para manter seus dados sincronizados automaticamente.
]=]
L["PREVIOUS_SCORE"] = "Pontuação anterior de M+ (%s)"
L["PROFILE_BEST_RUNS"] = "Melhores Runs por Masmorra"
--[[Translation missing --]]
--[[ L["PROFILE_TOOLTIP_ANCHOR_TOOLTIP"] = ""--]] 
L["PROVIDER_NOT_LOADED"] = "|cffFF0000Warning:|r |cffFFFFFF%s|r não pode encontrar dados para sua facção atual. Verifique suas configurações |cffFFFFFF/raiderio|r e ative os dados da ferramenta para |cffFFFFFF%s|r."
L["RAID_BOSS_CN_1"] = "Guinchasa"
L["RAID_BOSS_CN_10"] = "Sir Denathrius"
L["RAID_BOSS_CN_2"] = "Guarda-caça Altimor"
L["RAID_BOSS_CN_3"] = "Destruidor Faminto"
L["RAID_BOSS_CN_4"] = "Artífice Xy'Mox"
L["RAID_BOSS_CN_5"] = "Salvação do Rei Sol"
L["RAID_BOSS_CN_6"] = "Lady Verva Venumbra"
L["RAID_BOSS_CN_7"] = "O Conselho de Sangue"
L["RAID_BOSS_CN_8"] = "Punholodo"
L["RAID_BOSS_CN_9"] = "Generais da Legião de Pedra"
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FCN_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_11"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSFO_9"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_1"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_10"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_2"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_3"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_4"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_5"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_6"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_7"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_8"] = ""--]] 
--[[Translation missing --]]
--[[ L["RAID_BOSS_FSOD_9"] = ""--]] 
L["RAID_BOSS_SFO_1"] = "Guardião Vigilante"
L["RAID_BOSS_SFO_10"] = "Rygelon"
L["RAID_BOSS_SFO_11"] = "O Carcereiro"
L["RAID_BOSS_SFO_2"] = "Skolex"
L["RAID_BOSS_SFO_3"] = "Artífice Xy'mox"
L["RAID_BOSS_SFO_4"] = "Dausegne"
L["RAID_BOSS_SFO_5"] = "Protótipo de Panteão"
L["RAID_BOSS_SFO_6"] = "Lihuvim"
L["RAID_BOSS_SFO_7"] = "Halondrus"
L["RAID_BOSS_SFO_8"] = "Anduin Wrynn"
L["RAID_BOSS_SFO_9"] = "Senhores do Pavor"
L["RAID_BOSS_SOD_1"] = "O Tarratrom"
L["RAID_BOSS_SOD_10"] = "Sylvana Correventos"
L["RAID_BOSS_SOD_2"] = "O Olho do Carcereiro"
L["RAID_BOSS_SOD_3"] = "As nove"
L["RAID_BOSS_SOD_4"] = "Resquícios de Ner'zhul"
L["RAID_BOSS_SOD_5"] = "Rasgalmas Dormazain"
L["RAID_BOSS_SOD_6"] = "Artífice da Dor Raznal"
L["RAID_BOSS_SOD_7"] = "Guardião dos Primogênitos"
L["RAID_BOSS_SOD_8"] = "Escreve-sinas Roh-Kalo"
L["RAID_BOSS_SOD_9"] = "Kel'Thuzad"
L["RAID_DIFFICULTY_NAME_HEROIC"] = "Heroico"
L["RAID_DIFFICULTY_NAME_MYTHIC"] = "Mítico"
L["RAID_DIFFICULTY_NAME_NORMAL"] = "Normal"
L["RAID_DIFFICULTY_SUFFIX_HEROIC"] = "H"
L["RAID_DIFFICULTY_SUFFIX_MYTHIC"] = "M"
L["RAID_DIFFICULTY_SUFFIX_NORMAL"] = "N"
L["RAID_ENCOUNTERS_DEFEATED_TITLE"] = "Encontros de Raide Derrotados"
L["RAIDERIO_AVERAGE_PLAYER_SCORE"] = "Pontuações Médias para Runs Dentro do Tempo +%s"
L["RAIDERIO_BEST_RUN"] = "Raider.IO Melhor Run M+"
L["RAIDERIO_CLIENT_CUSTOMIZATION"] = "Personalização do cliente Raider.IO."
L["RAIDERIO_LIVE_TRACKING"] = "Rastreamento ao vivo do Raider.IO"
L["RAIDERIO_MP_BASE_SCORE"] = "Raider.IO Pontuação Base de M+"
L["RAIDERIO_MP_BEST_SCORE"] = "Raider.IO Pontuação de M+ (%s)"
L["RAIDERIO_MP_SCORE"] = "Raider.IO Pontuação de M+"
L["RAIDERIO_MYTHIC_OPTIONS"] = "Opções do Addon do Raider.IO "
L["RAIDING_DATA_HEADER"] = "Raider.IO Progresso de Raid"
--[[Translation missing --]]
--[[ L["RAIDING_DB_MODULES"] = ""--]] 
--[[Translation missing --]]
--[[ L["RECRUITMENT_DB_MODULES"] = ""--]] 
L["RELOAD_LATER"] = "Recarregarei depois."
L["RELOAD_NOW"] = "Recarregar agora."
L["RELOAD_RWF_MODE_BUTTON"] = "Salvar"
L["RELOAD_RWF_MODE_BUTTON_TOOLTIP"] = "Clique para salvar o log no arquivo de armazenamento. Isso fará com que sua interface seja recarregada."
L["RWF_MINIBUTTON_TOOLTIP"] = "Clique com o botão esquerdo sempre que houver saque pendente. Isso fará com que sua interface seja recarregada. Clique com o botão direito para abrir o quadro do Race World First."
L["RWF_SUBTITLE_LOGGING_FILTERED_LOOT"] = "(registrando itens relevantes)"
L["RWF_SUBTITLE_LOGGING_LOOT"] = "(registrando saque)"
L["RWF_TITLE"] = "|cffFFFFFFRaider.IO|r Race World First"
L["SEARCH_NAME_LABEL"] = "Nome"
L["SEARCH_REALM_LABEL"] = "Reino"
L["SEARCH_REGION_LABEL"] = "Região"
L["SEASON_LABEL_1"] = "S1-P"
L["SEASON_LABEL_2"] = "S2"
L["SEASON_LABEL_3"] = "S3"
L["SEASON_LABEL_4"] = "S4"
L["SHOW_AVERAGE_PLAYER_SCORE_INFO"] = "Mostrar Pontuação Média das runs feitas no tempo"
L["SHOW_AVERAGE_PLAYER_SCORE_INFO_DESC"] = "Mostra a pontuação média do Raider.IO vista em membros de runs feitas no tempo. Isso é visível nas Tooltips da Pedra-chave e nas Tooltips do Jogador no Localizador de Masmorras."
L["SHOW_BEST_MAINS_SCORE"] = "Mostrar a pontuação de Mítica+ do main na Melhor Season"
L["SHOW_BEST_MAINS_SCORE_DESC"] = "Mostra a pontuação de Mythic+ da melhor season do Main do jogador e o progresso de Raid na Tooltip. Os jogadores devem ter se registrado no Raider.IO e declarado um personagem como seu main."
L["SHOW_BEST_RUN"] = "Mostrar Melhor Run de M+ como título"
L["SHOW_BEST_RUN_DESC"] = "Mostre a melhor Run de Mítica+ do jogador da season atual como o título da dica (tooltip)."
L["SHOW_BEST_SEASON"] = "Mostrar melhor pontuação da season de Mythic+ como título."
L["SHOW_BEST_SEASON_DESC"] = "Mostra a melhor pontuação da season de Mítica+ do jogador como o título da dica (tooltip). Se a pontuação for de uma temporada anterior, a temporada será indicada como parte do título da dica (tooltip)."
L["SHOW_CHESTS_AS_MEDALS"] = "Mostrar ícones de medalhas de Mythic+"
L["SHOW_CHESTS_AS_MEDALS_DESC"] = "Mostra as medalhas de pedra-chave ganhas como ícones em vez dos sinais de mais (+)."
L["SHOW_CLIENT_GUILD_BEST"] = [=[Mostrar melhores registros em masmorras míticas do localizador de grupos.
]=]
L["SHOW_CLIENT_GUILD_BEST_DESC"] = "Ativar isso exibirá as 5 principais runs da sua guilda (Season ou Semanal) na guia Masmorras Míticas da janela do Localizador de Grupos."
L["SHOW_CURRENT_SEASON"] = "Mostrar a pontuação atual da season de Mythic+ como título."
L["SHOW_CURRENT_SEASON_DESC"] = "Mostra a pontuação atual da temporada de Mythic+ do jogador como o título da tooltip."
L["SHOW_IN_FRIENDS"] = "Mostrar nas dicas (tooltips) da lista de amigos"
L["SHOW_IN_FRIENDS_DESC"] = "Mostre a pontuação de  Mythic+ ao passar o mouse sobre seus amigos."
L["SHOW_IN_LFD"] = "Mostrar nas dicas (tooltips) do localizador de masmorras."
L["SHOW_IN_LFD_DESC"] = "Mostre a pontuação de  Mythic+ ao passar o mouse sobre grupos ou candidatos."
L["SHOW_IN_SLASH_WHO_RESULTS"] = "Mostrar nos resultados do \"/who\""
L["SHOW_IN_SLASH_WHO_RESULTS_DESC"] = "Mostre a pontuação de Mythic+ quando você \"/who\" alguém específico."
L["SHOW_IN_WHO_UI"] = "Mostrar nas dicas (tooltips) da janela \"Who List\""
L["SHOW_IN_WHO_UI_DESC"] = "Mostre a pontuação de Mítica+ ao passar o mouse na caixa de diálogo de resultados do /who."
L["SHOW_KEYSTONE_INFO"] = "Mostrar a Pontuação Base do Raider.IO para Pedras-Chave"
L["SHOW_KEYSTONE_INFO_DESC"] = "Adiciona a pontuação base do Raider.IO para Pedras-chave em suas dicas (tooltips). Também mostra a melhor run rastreada da masmorra para cada jogador do seu grupo."
L["SHOW_LEADER_PROFILE"] = "Permitir modificador de dica (tooltip) do perfil Raider.IO"
L["SHOW_LEADER_PROFILE_DESC"] = "Mantenha pressionado um modificador (shift/ctrl/alt) para alternar a dica (tooltip) de perfil entre Perfil Pessoal/Líder."
L["SHOW_MAINS_SCORE"] = "Mostrar a pontuação de M+ e o progresso do Main nas dicas de ferramentas"
L["SHOW_MAINS_SCORE_DESC"] = "Mostra a pontuação Mítica+ do Main do jogador da season atual e o progresso de Raid na dica (tooltip). Os jogadores devem ter se registrado no Raider.IO e declarado um personagem como seu main."
L["SHOW_ON_GUILD_ROSTER"] = "Mostrar nas dicas (tooltips) de listas de guildas e comunidades"
L["SHOW_ON_GUILD_ROSTER_DESC"] = "Mostre a pontuação de Mítica+ ao passar o mouse sobre os membros da guilda e da comunidade."
L["SHOW_ON_PLAYER_UNITS"] = "Mostrar nas dicas (tooltips) de Jogadores"
L["SHOW_ON_PLAYER_UNITS_DESC"] = "Mostre a pontuação de Mítica+ ao passar o mouse sobre as unidades de jogador."
L["SHOW_RAID_ENCOUNTERS_IN_PROFILE"] = "Mostrar encontros de raid na dica (tooltip) do perfil"
L["SHOW_RAID_ENCOUNTERS_IN_PROFILE_DESC"] = "Quando ativado, isso mostrará o progresso dos encontros de Raid nas dicas (tooltips) do perfil Raider.IO."
L["SHOW_RAIDERIO_BESTRUN_FIRST"] = "(Experimental) Priorize mostrar a melhor run do Raider.IO"
L["SHOW_RAIDERIO_BESTRUN_FIRST_DESC"] = "Este é um recurso experimental. Em vez de mostrar a pontuação do Raider.IO como a primeira linha, mostre a melhor run do jogador."
L["SHOW_RAIDERIO_PROFILE"] = "Mostrar dica (tooltip) de perfil do Raider.IO"
L["SHOW_RAIDERIO_PROFILE_DESC"] = "Mostra a dica (tooltip) de perfil do Raider.IO"
L["SHOW_ROLE_ICONS"] = "Mostrar ícones de função nas dicas (tooltips)"
L["SHOW_ROLE_ICONS_DESC"] = "Quando ativado, as principais funções do jogador em Mythic+ serão exibidas em suas dicas (tooltips)."
L["SHOW_SCORE_IN_COMBAT"] = "Mostra a dica (tooltip) do Raider.IO durante o combate"
L["SHOW_SCORE_IN_COMBAT_DESC"] = "Desative isso para minimizar o impacto no desempenho ao pairar sobre os jogadores durante o combate."
L["SHOW_SCORE_WITH_MODIFIER"] = "Mostrar informações de dica (tooltip) do Raider.IO com modificador"
L["SHOW_SCORE_WITH_MODIFIER_DESC"] = "Desative a exibição de dados ao passar o mouse sobre jogadores, a menos que uma tecla modificadora seja pressionada."
L["TANK"] = "Tank"
L["TEAM_LF_MPLUS_DEFAULT"] = "Recrutando Jogadores para Mítica+"
L["TEAM_LF_MPLUS_WITH_SCORE"] = "Recrutando %d+ jogadores de Mítica+"
L["TIMED_10_RUNS"] = "Runs +10-14 Dentro do Tempo"
L["TIMED_15_RUNS"] = "Runs 15+ Dentro do Tempo"
L["TIMED_20_RUNS"] = "Runs +20 Dentro do Tempo"
L["TIMED_5_RUNS"] = "Runs +5-9 Dentro do Tempo"
L["TOOLTIP_PROFILE"] = "Perfil de personalização da dica (tooltip) do Raider.IO"
L["UNKNOWN_SERVER_FOUND"] = "|cffFFFFFF%s|r encontrou um novo servidor. Por favor, anote esta informação |cffFF9999{|r |cffFFFFFF%s|r |cffFF9999,|r |cffFFFFFF%s|r |cffFF9999}|r e informe aos desenvolvedores. Obrigado!"
L["UNLOCKING_PROFILE_FRAME"] = "Raider.IO: Desbloqueando o quadro de perfil M+."
L["USE_ENGLISH_ABBREVIATION"] = "Forçar Abreviações em Inglês para Masmorras"
L["USE_ENGLISH_ABBREVIATION_DESC"] = "Quando ativado, isso substituirá as abreviações usadas para masmorras para serem as versões em inglês, em vez do seu idioma atual."
L["USE_RAIDERIO_CLIENT_LIVE_TRACKING_SETTINGS"] = "Permite que o cliente Raider.IO controle o Registro de Combate."
L["USE_RAIDERIO_CLIENT_LIVE_TRACKING_SETTINGS_DESC"] = "Permite que o cliente Raider.IO (quando possível) controle as configurações de seu Registro de Combate automaticamente"
L["WARNING_DEBUG_MODE_ENABLE"] = "|cffFFFFFF%s|r Modo de Depuração está habilitado. Você pode desabilitá-lo ao digitar |cffFFFFFF/raiderio debug|r"
L["WARNING_LOCK_POSITION_FRAME_AUTO"] = "Raider.IO: Você deve primeiro desabilitar o Posicionamento Automático para o Perfil do Raider.IO"
L["WARNING_RWF_MODE_ENABLE"] = "|cffFFFFFF%s|r O modo Race World First está ativado. Você pode desativá-lo digitando |cffFFFFFF/raiderio rwf|r."
L["WIPE_RWF_MODE_BUTTON"] = "Limpar"
L["WIPE_RWF_MODE_BUTTON_TOOLTIP"] = "Clique para limpar o log do arquivo de armazenamento. Isso fará com que sua interface seja recarregada."


	ns.L = L
end
