local Translations = {
    error = {
        to_far_from_door = 'Jesteś za daleko od dzwonka',
        nobody_home = 'Nikogo nie ma w domu..',
        nobody_at_door = 'Nie ma nikogo przy drzwiach...'
    },
    success = {
        receive_apart = 'Masz mieszkanie?',
        changed_apart = 'Przeniosłeś się do mieszkania',
    },
    info = {'Ktoś jest przy drzwiach!',},
    
    text = {
        options = '[E] Opcje mieszkania',
        enter = 'Wejdź do mieszkania',
        ring_doorbell = 'Dzwonek do drzwi',
        logout = 'Zmień Postać',
        change_outfit = 'Zmień Ubranie',
        open_stash = 'Otwórz Szafke',
        move_here = 'Przenieś tutaj',
        open_door = 'Otwórz Drzwi',
        leave = 'Opuść mieszkanie',
        close_menu = '⬅ Zamknij menu',
        tennants = 'Najemcy',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
