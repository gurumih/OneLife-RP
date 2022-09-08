local Translations = {
    error = {
        not_in_range = 'Za daleko od ratusza'
    },
    success = {
        recived_license = 'Otrzymałeś %{value} za 50 $'
    },
    info = {
        bilp_text = 'Usługi miejskie',
        city_services_menu = '~g~E~w~ - Menu usług miejskich',
        id_card = 'Dowód osobisty',
        driver_license = 'Prawo jazdy',
        weaponlicense = 'Licencja na broń palną',
        new_job = 'Gratulujemy nowej pracy! (%{job})'
    },
    email = {
        mr = 'Mr',
        mrs = 'Mrs',
        sender = 'Parafia',
        subject = 'Prośba o lekcje jazdy',
        message = 'Witaj %{gender} %{lastname}<br /><br />Właśnie otrzymaliśmy wiadomość, że ktoś chce wziąć lekcje jazdy<br />Jeśli chcesz uczyć, skontaktuj się z nami:<br />Imię i nazwisko : <strong>%{firstname} %{lastname}</strong><br />Numer telefonu: <strong>%{phone}</strong><br/><br/>Pozdrawiamy,<br />Miasto Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
