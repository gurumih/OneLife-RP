local Translations = {
    error = {
        smash_own = "Nie możesz rozbić pojazdu, który go posiada.",
        cannot_scrap = "Ten pojazd nie może zostać złomowany.",
        not_driver = "Nie jesteś kierowcą",
        demolish_vehicle = "Nie możesz teraz niszczyć pojazdów",
        canceled = "Anulowany",
    },
    text = {
        scrapyard = 'Złomowisko',
        disassemble_vehicle = '~g~E~w~ - Zdemontuj pojazd',
        email_list = "~g~E~w~ - E-mail z listą pojazdów",
        demolish_vehicle = "Zburzyć pojazd",
    },
    email = {
        sender = "Auto Wrecking Turnera",
		subject = "Lista pojazdów",
		message = "Możesz zburzyć tylko kilka pojazdów.<br />Możesz zachować wszystko, co wyburzasz dla siebie, o ile mi nie przeszkadzasz.<br /><br /><strong>Lista pojazdów:</strong><br / >",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})