local Translations = {
    error = {
        negative = 'Próbujesz sprzedać ujemną kwotę?',
        no_melt = 'Nie dałeś mi nic do stopienia...',
        no_items = 'Za mało przedmiotów',
    },
    success = {
        sold = 'Sprzedałeś %{value} x %{value2} za $%{value3}',
        items_received = 'Otrzymałeś %{value} x %{value2}',
    },
    info = {
        title = 'Lombard',
        subject = 'Melting Items',
        message = 'Zakończyliśmy topienie twoich przedmiotów. Możesz je odebrać w każdej chwili.',
        open_pawn = 'Otwórz lombard',
        sell = 'Sprzedaj przedmioty',
        sell_pawn = 'Sprzedaj przedmioty do lombardu',
        melt = 'Stopić przedmioty',
        melt_pawn = 'Otwórz Topialnię',
        melt_pickup = 'Odbiór stopionych przedmiotów',
        pawn_closed = 'Lombard jest zamknięty. Wróć między %{value}0:00 AM - %{value2}:00 PM',
        sell_items = 'Cena sprzedaży $%{value}',
        back = '⬅ Wróć',
        melt_item = 'Stopić %{value}',
        max = 'Maksymalna kwota %{value}',
        submit = 'Stopić',
        melt_wait = 'Daj mi %{value} minut, a twoje rzeczy się stopią',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})