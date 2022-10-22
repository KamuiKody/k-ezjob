fx_version 'cerulean'
game 'gta5'

author 'kamui_kody#9175'
description 'K-EZJOB'

shared_scripts {
    'shared/*.lua'
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

