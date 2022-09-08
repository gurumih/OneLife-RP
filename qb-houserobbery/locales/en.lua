local Translations = {
    error = {
        ["missing_something"] = "Wygląda na to, że czegoś Ci brakuje...",
        ["not_enough_police"] = "Za mało policji..",
        ["door_open"] = "Drzwi są już otwarte..",
        ["process_cancelled"] = "Proces anulowany..",
        ["didnt_work"] = "Nie działało..",
        ["emty_box"] = "Pudełko jest puste..",
    },
    success = {
        ["worked"] = "Zadziałało!",
    }
}
Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})