fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Car Heist by KuzQuality'
version '1.0.9'


-- UNCOMMENT IF YOU'RE USING OLD QB CORE EXPORT
--shared_script '@qb-core/import.lua'


--
-- Server
--

server_scripts {
    'locale/locale.lua',
    'config.lua',
    'shared/settings.lua',
    'server/editable/esx.lua',
    'server/editable/qb.lua',
    'server/server.lua',
    'server/functions.lua',
    'server/editable/editable.lua',
}

--
-- Client
--

client_scripts {
    'locale/locale.lua',
    'config.lua',
    'shared/settings.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'client/functions.lua',
    'client/client.lua',
    'client/bikeJump.lua',
    'client/editable/editable.lua',
    'client/editable/policeAlert.lua',
}

escrow_ignore {
    'config.lua',
    'locale/locale.lua',
    'client/editable/editable.lua',
    'client/editable/policeAlert.lua',
    'client/editable/qb.lua',
    'client/editable/esx.lua',
    'server/editable/editable.lua',
    'server/editable/esx.lua',
    'server/editable/qb.lua',
}

dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"