local Translations = {
    error = {
        no_money = 'Nie posiadasz pieniędzy',
        too_far = 'Jesteś za daleko od stoiska z hot dogami',
        no_stand = 'Nie masz stoiska z hot dogami',
        cust_refused = 'Klient odmówił!',
        no_stand_found = 'Nigdzie nie było Twojego stoiska z hot dogami, nie otrzymasz zwrotu!',
        no_more = 'Nie masz %{value} więcej na ten temat przed radą',
        deposit_notreturned = 'Nie masz stoiska z hot dogami',
    },
    success = {
        deposit = 'Zapłaciłeś depozyt w wysokości %{deposit} $!',
        deposit_returned = 'Twój depozyt $%{deposit} został zwrócony!',
        sold_hotdogs = '%{value} x Hotdog(\'s) sprzedany za $%{value2}',
        made_hotdog = 'Udało Ci się zrobić %{value} Hot Doga',
        made_luck_hotdog = 'Zrobiłeś %{value} x %{value2} hot dogi',
    },
    info = {
        command = "Usuń stojak (Admin Only)",
        blip_name = 'Stoisko z hot dogami',
        start_working = '[E] Rozpocząć pracę',
        start_work = 'Rozpocząć pracę',
        stop_working = '[E] Przestań Pracować',
        stop_work = 'Przestań Pracować',
        grab_stall = '[~g~G~s~] Chwyć stragan',
        drop_stall = '[~g~G~s~] Zwolnij stoisko',
        grab = 'Chwyć stragan',
        selling_prep = '[~g~E~s~] Przygotowanie hotdoga [Sale: ~g~Selling~w~]',
        not_selling = '[~g~E~s~] Przygotowanie hotdoga [Sale: ~r~Not Selling~w~]',
        sell_dogs = '[~g~7~s~] Sell %{value} x HotDogs for $%{value2} / [~g~8~s~] Reject',
        admin_removed = "Hot Dog Stand Removed",
        label_a = "Perfect (A)",
        label_b = "Rare (B)",
        label_c = "Common (C)"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
