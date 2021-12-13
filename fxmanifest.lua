fx_version 'cerulean'
game 'gta5'

author 'Cpt_NoHand'
description 'qb-jobs QBCore Created By Cpt_NoHand'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}

client_scripts {
	'client/main.lua',
	'client/menus.lua'
}

server_script 'server/*.lua'
