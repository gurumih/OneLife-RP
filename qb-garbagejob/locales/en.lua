local Translations = {
    error = {
        ["cancled"] = "Anulowany",
        ["no_truck"] = "Nie masz ciężarówki!",
        ["not_enough"] = "Nie dość pieniędzy (%{value} required)",
        ["too_far"] = "Jesteś za daleko od punktu zrzutu",
        ["early_finish"] = "Ze względu na wczesne wykończenie (Completed: %{completed} Total: %{total}), Twój depozyt nie zostanie zwrócony.",
        ["never_clocked_on"] = "You never clocked on!",
    },
    success = {
        ["clear_routes"] = "Wyczyszczono trasy użytkowników, których zachowano %{value} tras",
        ["pay_slip"] = "Otrzymałeś %{total} $, Twój odcinek wypłaty %{deposit} został wpłacony na Twoje konto bankowe!",
    },
    info = {
        ["payslip_collect"] = "[E] - Odcinek wypłaty",
        ["payslip"] = "Odcinek wypłaty",
        ["not_enough"] = "Nie masz wystarczającej ilości pieniędzy na wpłatę. Koszty wpłaty wynoszą $%{value}",
        ["deposit_paid"] = "Wpłaciłeś depozyt w wysokości %{value} $!",
        ["no_deposit"] = "Nie masz wpłaconej kaucji za ten pojazd..",
        ["truck_returned"] = "Ciężarówka zwrócona, odbierz odcinek wypłaty, aby otrzymać wypłatę i zwrot kaucji!",
        ["bags_left"] = "Pozostało jeszcze %{value} bagażu!",
        ["bags_still"] = "Tam wciąż jest %{value} toreb!",
        ["all_bags"] = "Wszystkie worki na śmieci są gotowe, przejdź do następnej lokalizacji!",
        ["depot_issue"] = "W magazynie wystąpił problem, prosimy o natychmiastowy powrót!",
        ["done_working"] = "Skończyłeś pracę! Wróć do magazynu.",
        ["started"] = "Rozpocząłeś pracę, lokalizacja oznaczona na GPS!",
        ["grab_garbage"] = "[E] Chwyć worek na śmieci",
        ["stand_grab_garbage"] = "Stań tutaj, aby złapać worek na śmieci.",
        ["dispose_garbage"] = "[E] Wyrzuć worek na śmieci",
        ["progressbar"] = "Wkładanie worka do trashmastera..",
        ["garbage_in_truck"] = "Włóż torbę do ciężarówki..",
        ["stand_here"] = "Zostań tutaj..",
        ["found_crypto"] = "Znalazłeś kryptostick na podłodze",
        ["payout_deposit"] = "(+ $%{value} deposit)",
        ["store_truck"] =  "[E] - Przechowuj śmieciarka",
        ["get_truck"] =  "[E] - Śmieciarka",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
