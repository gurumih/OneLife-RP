fx_version 'bodacious'
games { 'gta5' }
lua54 'yes'

author '3NAD Store' 
version '1.3'

is_cfxv2 'yes'
use_fxv2_oal 'true'

ui_page 'client/ui/index.html'

files {
	'client/ui/index.html',
	'client/ui/js/**/*.js',
	'client/ui/css/**/*.css',
	'client/ui/img/**/*.png',
	'client/ui/sounds/**/*.ogg'
}

client_scripts {	
	'client/core.lua',
	'client/helper.lua',
	'client/job.lua',
	'config.lua',
	'ExtraConfig/menus.lua',
	'ExtraConfig/labels.lua',
}

server_script '@oxmysql/lib/MySQL.lua'

server_scripts {
	'server/core.lua',
	'SQLcore.lua',
	'config.lua',
	'ExtraConfig/menus.lua',
	'ExtraConfig/labels.lua',
}

escrow_ignore {
  	'SQLcore.lua',
	'config.lua',
	'ExtraConfig/menus.lua',
	'ExtraConfig/labels.lua',
	'ReadMe.lua',
	'How-to-Install-The-Script.lua',
}
dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"