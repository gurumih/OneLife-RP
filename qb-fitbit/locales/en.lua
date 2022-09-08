local Translations = {
    success = {
        hunger_set = 'Fitbit: Ostrzeżenie o głodzie ustawione na %{hungervalue}%',
        thirst_set = 'Fitbit: Ostrzeżenie o pragnieniu ustawione na %{thirstvalue}%',
    },
    warning = {
        hunger_warning = 'Twój głód jest %{hunger}%',
        thirst_warning = 'Twoim pragnieniem jest %{thirst}%'
    },
    info = {
        fitbit = 'FITBIT '
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})