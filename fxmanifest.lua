fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'LumaNode Studios'
description 'LumaNode Studios - Pause Menu'
version '1.0.0'

ui_page 'web/dist/index.html'

files {
    'web/dist/index.html',
    'web/dist/**/*',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/settings.lua',
    'shared/bridge.lua'
}

client_scripts {
    'client/cl_pausemenu.lua'
}

server_scripts {
    'bridge/server/esx/sv_esx.lua',
    'bridge/server/qbcore/sv_qb.lua',
    'bridge/server/qbox/sv_qbx.lua',
    'server/sv_pausemenu.lua'
}