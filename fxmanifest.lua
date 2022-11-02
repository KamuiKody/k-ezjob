fx_version 'cerulean'
game 'gta5'

author 'kamui_kody#9175'
description 'k-ezjob'

shared_scripts {
    'shared/imports.lua',
    'shared/config.lua',
    'shared/configs/*.lua',
    'shared/items/*.lua',
    'shared/jobs/*.lua',
    'shared/gangs/*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/ComboZone.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

