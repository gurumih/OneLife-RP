local Translations = {
    info = {
        search = 'Przeszukujesz smietnik smieciu',
    },
    error = {
        cooldown = 'Musisz poczekać %{time} sekund na ponowne wyszukiwanie',
        hasBeenSearched = "Ten kosz został już przeszukany!",
        nothingFound = "Niczego nie znalazłeś Pizdo znaczy przyjacielu !",
    },
    progressbar = {
        searching = "Szukasz smieci !!!",
    },
    reward = {
        money = "Znalazłeś %{amount}$",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})