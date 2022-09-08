local Translations = {
    error = {
        already_driving_bus = 'Już jedziesz autobusem',
        not_in_bus = 'Nie jesteś w autobusie',
        one_bus_active = 'Jednocześnie możesz mieć tylko jeden aktywny autobus',
        drop_off_passengers = 'Wysadź pasażerów, zanim przestaniesz pracować'
    },
    success = {
        dropped_off = 'Osoba została podrzucona',
    },
    info = {
        bus = 'Autobus standardowy',
        goto_busstop = 'Idź na przystanek autobusowy',
        busstop_text = '[E] Przystanek autobusowy',
        bus_plate = 'BUS', -- Can be 3 or 4 characters long (uses random 4 digits)
        bus_depot = 'Bus Depot',
        bus_stop_work = '[E] Przestać działać',
        bus_job_vehicles = '[E] Pojazdy do pracy'
    },
    menu = {
        bus_header = 'Pojazdy autobusowe',
        bus_close = '⬅ Zamknij menu'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})