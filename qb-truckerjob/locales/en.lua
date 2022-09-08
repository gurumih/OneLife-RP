local Translations = {
    error = {
        no_deposit = "$%{value} Depozyt wymagany",
        cancelled = "Anulowany",
        vehicle_not_correct = "To nie jest pojazd użytkowy!",
        no_driver = "Musisz być kierowcą, aby to zrobić..",
        no_work_done = "Nie wykonałeś jeszcze żadnej pracy..",
    },
    success = {
        paid_with_cash = "$%{value} Depozyt zapłacony gotówką",
        paid_with_bank = "$%{value} Depozyt wpłacony z banku",
        refund_to_cash = "$%{value} Depozyt zapłacony gotówką",
        you_earned = "Zarobiłeś $%{value}",
        payslip_time = "Poszedłeś do wszystkich sklepów .. Czas na twój odcinek wypłaty!",
    },
    menu = {
        header = "Dostępne ciężarówki",
        close_menu = "⬅ Zamknij menu",
    },
    mission = {
        store_reached = "Przechowuj dotarł, weź pudło w bagażniku za pomocą [E] i dostarcz do znacznika",
        take_box = "Weź pudełko produktów",
        deliver_box = "Dostarcz pudełko produktów",
        another_box = "Zdobądź kolejne pudełko produktów",
        goto_next_point = "Dostarczyłeś wszystkie produkty do następnego punktu",
    },
    info = {
        deliver_e = "~g~E~w~ - Dostarcz produkty",
        deliver = "Dostarcz produkty",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
