local Translations = {
    error = {
        ["invalid_job"] = "Chyba tu nie pracuję...",
        ["invalid_items"] = "Nie masz odpowiednich przedmiotów!",
        ["no_items"] = "Nie masz żadnych przedmiotów!",
    },
    progress = {
        ["pick_grapes"] = "Zbieranie winogron ..",
        ["process_grapes"] = "Przetwarzanie winogron ..",
    },
    task = {
        ["start_task"] = "[E] Start",
        ["load_ingrediants"] = "[E] Załaduj składniki",
        ["wine_process"] = "[E] Rozpocznij proces wina",
        ["get_wine"] = "[E] Zdobądź wino",
        ["make_grape_juice"] = "[E] Zrób sok winogronowy",
        ["countdown"] = "Pozostały czas %{time}s",
        ['cancel_task'] = "Anulowałeś zadanie"
    },
    text = {
        ["start_shift"] = "Rozpocząłeś swoją zmianę w winnicy!",
        ["end_shift"] = "Twoja zmiana w winnicy dobiegła końca!",
        ["valid_zone"] = "Ważna strefa!",
        ["invalid_zone"] = "Nieprawidłowa strefa!",
        ["zone_entered"] = "%{zone} Wprowadzono strefę",
        ["zone_exited"] = "%{zone} Wyjście ze strefy",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})