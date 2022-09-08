local Translations = {
    error = {
        ["already_mission"] = "Już wykonujesz misję NPC",
        ["not_in_taxi"] = "Nie jesteś w taksówce",
        ["missing_meter"] = "Ten pojazd nie ma licznika taksówek",
        ["no_vehicle"] = "Nie jesteś w pojeździe",
        ["not_active_meter"] = "Taksometr nie jest aktywny",
        ["no_meter_sight"] = "Brak taksometru w zasięgu wzroku",
    },
    success = {},
    info = {
        ["person_was_dropped_off"] = "Osoba została odrzucona!",
        ["npc_on_gps"] = "NPC jest wskazany w twoim GPS",
        ["go_to_location"] = "Zabierz NPC do określonej lokalizacji",
        ["vehicle_parking"] = "[E] Parkowanie pojazdu",
        ["job_vehicles"] = "[E] Pojazdy do pracy",
        ["drop_off_npc"] = "[E] Odrzuć NPC",
        ["call_npc"] = "[E] Zadzwoń do NPC",
        ["blip_name"] = "Taxi",
        ["taxi_label_1"] = "Taxi standardowa",
        ["no_spawn_point"] = "Nie można znaleźć miejsca, w którym można zabrać taksówkę",
        ["taxi_returned"] = "Taxi zaparkowana"
    },
    menu = {
        ["taxi_menu_header"] = "Pojazdy taksówkowe",
        ["close_menu"] = "⬅ Zamknij menu",
        ['boss_menu'] = "Boss Menu"
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
})