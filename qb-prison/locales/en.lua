local Translations = {
    error = {
        ["missing_something"] = "Wygląda na to, że czegoś Ci brakuje...",
        ["not_enough_police"] = "Za mało policji..",
        ["door_open"] = "Drzwi są już otwarte..",
        ["cancelled"] = "Proces anulowany..",
        ["didnt_work"] = "Nie działało..",
        ["emty_box"] = "Pudełko jest puste..",
        ["injail"] = "Jesteś w więzieniu od %{Time} miesięcy..",
        ["item_missing"] = "Brakuje Ci przedmiotu..",
        ["escaped"] = "Uciekłeś... Wynoś się stąd do diabła.!",
        ["do_some_work"] = "Popracuj nad redukcją zdań, natychmiastowa praca: %{currentjob} ",
    },
    success = {
        ["found_phone"] = "Znalazłeś telefon..",
        ["time_cut"] = "Odpracowałeś trochę czasu wolnego od kary.",
        ["free_"] = "Jesteś wolny! Ciesz się tym! :)",
        ["timesup"] = "Twój czas się skończył! Sprawdź się w centrum dla zwiedzających",
    },
    info = {
        ["timeleft"] = "Nadal musisz... %{JAILTIME} miesięcy",
        ["lost_job"] = "Jesteś bezrobotny",
        ["job_interaction"] = "[E] Praca elektryczna",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
