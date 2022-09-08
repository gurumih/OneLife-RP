Config = {}

-------------------------- COMMANDS & FUNCTIONALITY

Config.FeedbackClientCommand = 'report' -- The command that the players use to report something

Config.FeedbackAdminCommand = 'reports' -- The command that the admins use to check the pendent feedbacks list

Config.FeedbackCooldown = 10 -- Time in minutes

-------------------------- ADMIN PERMISSIONS

Config.ESX = false -- Set this to true if you use ESX 

-- If you use ESX you don't need to add any identifier to Config.AdminList because it checks if you have permission by your player group (superadmin, admin, mod)

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.AdminList = {
	'steam:110000113c27ef4', -- Example, change this
	'discord:855964401956945961',
	'discord:468094487231463424',
	'discord:954435047170142320',
	'discord:529060259218587668',
	'discord:896526428722561094',
	'discord:522080691643613185',
	'discord:926933082739703808',
	'discord:633246243627466752',
	'discord:888800113663815770',
	'discord:769289741480099870',
	'discord:780841036250480661',
	'discord:975849731525836930',
	'discord:428589670654541839',
	'discord:954072911206027355',
	'discord:967453012857593896',
	'discord:989254373538410526',
	'discord:420602412705775620',
	'discord:496309393470652416',
	'discord:821151673711067147',
	'discord:540643215418851348',
	'discord:415165670234521604',
	'discord:913804474055786528',
	'discord:547515324795322408',
	'discord:707640700295970846',
	'discord:500920994114961408',
	'discord:540949012769931266',
	'discord:687302214099795977',
	'discord:554003265424195614',
	'discord:554003265424195614',
	'discord:540858620024324096',
	'discord:436520889136185367',
	'discord:934211427076554814',
	'discord:315523645512351744',
	'discord:566680819616317465' -- Example, change this
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 13

Config.BotName = 'OLRP' -- Write the desired bot name

Config.ServerName = 'OLRP' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.NewFeedbackWebhookColor = '65352'

Config.AssistFeedbackWebhookColor = '16127'

Config.ConcludeFeedbackWebhookColor = '16711680'

-- ok? okok