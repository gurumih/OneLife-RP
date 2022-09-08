local Translations = {
    error = {
        not_enough = "Nie masz wystarczającej ilości gotówki..",
        no_slots = "Nie ma wolnych slotów",
        occured = "Wystąpił błąd",
        have_keys = "Ta osoba ma już klucze",
        p_have_keys = "%{value} Ta osoba ma już klucze",
        not_owner = "Nie jesteś właścicielem pułapki lub nie jesteś właścicielem",
        not_online = "Tej osoby nie ma w mieście",
        no_money = "W szafce nie ma pieniędzy",
        incorrect_code = "Ten kod jest nieprawidłowy",
        up_to_6 = "Możesz dać dostęp do domu pułapki nawet 6 osobom!",
        cancelled = "Przejęcia anulowane",
    },
    success = {
        added = "%{value} Został dodany do pułapki!",
    },
    info = {
        enter = "Wejdź do TrapHouse",
        give_keys = "Daj klucze do TrapHouse",
        pincode = "Traphouse Kod: %{value}",
        taking_over = "Przejmowanie",
        pin_code_see = "~b~G~w~ - Zobacz kod PIN",
        pin_code = "Pincode: %{value}",
        multikeys = "~b~/multikeys~w~ [id] - Dawać klucze",
        take_cash = "~b~E~w~ - Weź gotówkę (~g~$%{value}~w~)",
        inventory = "~b~H~w~ - Wyświetl ekwipunek",
        take_over = "~b~E~w~ - Przejąć (~g~$5000~w~)",
        leave = "~b~E~w~ - Wyjdź z Traphouse",
    },
    targetInfo = {
        options = "Traphouse Ustawienia",
        enter = "Wejdź Traphouse",
        give_keys = "Podaruj klucze do Traphouse",
        pincode = "Traphouse Pincode: %{value}",
        taking_over = "Przejmowanie",
        pin_code_see = "See Pin Code",
        pin_code = "Pincode: %{value}",
        multikeys = "Podaruj klucze (use /multikey [id])",
        take_cash = "Zabierz pieniądze ($%{value})",
        inventory = "Wyświetl ekwipunek",
        take_over = "Przejąć ($5000)",
        leave = "Wyjdeź Traphouse",
        close_menu = "⬅ Zamknij menu",
    }
}

    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })

