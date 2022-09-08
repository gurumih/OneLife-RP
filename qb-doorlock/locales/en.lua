local Translations = {
    error = {
        lockpick_fail = "Przegrany",
        door_not_found = "Nie otrzymałem wzoru, jeśli drzwi są przezroczyste, upewnij się, że celujesz w ramę drzwi",
        same_entity = "Oba drzwi nie mogą być tą samą jednostką",
        door_registered = "Te drzwi są już zarejestrowane",
        door_identifier_exists = "Drzwi o tym identyfikatorze już istnieją w konfiguracji. (%s)",
    },
    success = {
        lockpick_success = "Success"
    },
    general = {
        locked = "Zamknięte",
        unlocked = "Otwarte",
        locked_button = "[E] - Zamknięte",
        unlocked_button = "[E] - Otwarte",
        keymapping_description = "Interakcja z zamkami do drzwi",
        keymapping_remotetriggerdoor = "Zdalne wyzwalanie drzwi",
        locked_menu = "Zablokowany",
        pickable_menu = "Otwieranie zamków",
        cantunlock_menu = 'Nie mogę odblokować',
        hidelabel_menu = 'Ukryj etykietę drzwi',
        distance_menu = "Maksymalna odległość",
        item_authorisation_menu = "Autoryzacja przedmiotu",
        citizenid_authorisation_menu = "Autoryzacja CitizenID",
        gang_authorisation_menu = "Autoryzacja gangu",
        job_authorisation_menu = "Autoryzacja pracy",
        doortype_title = "Typ drzwi",
        doortype_door = "Pojedyncze drzwi",
        doortype_double = "Podwójne drzwi",
        doortype_sliding = "Pojedyncze drzwi przesuwne",
        doortype_doublesliding = "Podwójne drzwi przesuwne",
        doortype_garage = "Garaż",
        dooridentifier_title = "Unikalny identyfikator",
        doorlabel_title = "Według etykiety",
        configfile_title = "Nazwa pliku konfiguracyjnego",
        submit_text = "Składać",
        newdoor_menu_title = "Dodaj nowe drzwi",
        newdoor_command_description = "Dodaj nowe drzwi do systemu zamków",
        doordebug_command_description = "Przełącz tryb debugowania",
        warning = "Ostrzeżenie",
        created_by = "stworzone przez",
        warn_no_permission_newdoor = "%{player} (%{license}) tried to add a new door without permission (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) attempted to open a door without authorisation (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) attempted to update invalid door (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) attempted to update to an invalid state (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) didn't send an appropriate doorID (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) opened a door using admin privileges"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})