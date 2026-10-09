fx_version 'cerulean'
game 'gta5'

author 'Kabo'
description 'Immersive delivery contracts for the Kabo Qbox server'
version '0.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config/shared.lua'
}

client_scripts {
    'config/client.lua',
    'client/*.lua'
}

server_scripts {
    'config/server.lua',
    'server/*.lua'
}
ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/app.js'
}

dependencies {
    'qbx_core',
    'ox_lib',
    'ox_target'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
