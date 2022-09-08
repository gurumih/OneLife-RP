local Translations = {
    error = {
        canceled = 'Anulowany',
        max_ammo = 'Maksymalna pojemność amunicji',
        no_weapon = 'Nie masz broni.',
        no_support_attachment = 'Ta broń nie obsługuje tego załącznika.',
        no_weapon_in_hand = 'Nie masz broni w dłoni.',
        weapon_broken = 'Ta broń jest zepsuta i nie można jej użyć.',
        no_damage_on_weapon = 'Ta broń nie jest uszkodzona..',
        weapon_broken_need_repair = 'Twoja broń jest zepsuta, musisz ją naprawić, zanim będziesz mogła z niej ponownie skorzystać.',
        attachment_already_on_weapon = 'Masz już %{value} na swojej broni.'
    },
    success = {
        reloaded = 'Przeładowano'
    },
    info = {
        loading_bullets = 'Ładowanie pocisków',
        repairshop_not_usable = 'Warsztat w tej chwili ~r~NIE~w~ nadaje się do użytku.',
        weapon_will_repair = 'Twoja broń zostanie naprawiona.',
        take_weapon_back = '[E] - Odbierz broń',
        repair_weapon_price = '[E] Naprawa broni, ~g~$%{value}~w~',
        removed_attachment = 'Usunąłeś %{value} ze swojej broni!',
        hp_of_weapon = 'Trwałość twojej broni'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Naprawa',
        message = 'Twój %{value} został naprawiony, możesz go odebrać w lokalizacji. <br><br> Pokój z madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
