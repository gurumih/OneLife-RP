local Translations = {
    error = {
        ["no_keys"] = "Nie masz kluczy do domu...",
        ["not_in_house"] = "Nie jesteś w domu!",
        ["out_range"] = "Wyszedłeś poza zasięg",
        ["no_key_holders"] = "Nie znaleziono kluczy",
        ["invalid_tier"] = "Nieprawidłowy poziom domu",
        ["no_house"] = "W pobliżu nie ma domu",
        ["no_door"] = "Nie jesteś wystarczająco blisko drzwi..",
        ["locked"] = "Dom jest zamknięty!",
        ["no_one_near"] = "Nikt w pobliżu!",
        ["not_owner"] = "Nie jesteś właścicielem tego domu.",
        ["no_police"] = "Nie ma żadnej policji..",
        ["already_open"] = "Ten dom jest już otwarty..",
        ["failed_invasion"] = "Nie udało się spróbować ponownie",
        ["inprogress_invasion"] = "Ktoś już pracuje nad drzwiami..",
        ["no_invasion"] = "Te drzwi nie są wyłamane..",
        ["realestate_only"] = "Tylko nieruchomości mogą używać tego polecenia",
        ["emergency_services"] = "Jest to możliwe tylko dla służb ratowniczych!",
        ["already_owned"] = "Ten dom jest już własnością!",
        ["not_enough_money"] = "Nie masz wystarczająco dużo pieniędzy..",
        ["remove_key_from"] = "Klucze zostały usunięte z %{firstname} %{lastname}",
        ["already_keys"] = "Ta osoba ma już klucze do domu!",
        ["something_wrong"] = "Coś poszło nie tak, spróbuj ponownie!",
        ["nobody_at_door"] = 'Nie ma nikogo przy drzwiach...'
    },
    success = {
        ["unlocked"] = "Dom jest odblokowany!",
        ["home_invasion"] = "Drzwi są teraz otwarte.",
        ["lock_invasion"] = "Znowu zamknąłeś dom..",
        ["recieved_key"] = "Otrzymałeś klucze o wartości %{value}!",
        ["house_purchased"] = "Udało Ci się kupić dom!"
    },
    info = {
        ["door_ringing"] = "Ktoś dzwoni do drzwi!",
        ["speed"] = "Prędkość jest %{value}",
        ["added_house"] = "Dodałeś dom: %{value}",
        ["added_garage"] = "Dodałeś garaż: %{value}",
        ["exit_camera"] = "Wyjdź z kamery",
        ["house_for_sale"] = "Dom na sprzedaż",
        ["decorate_interior"] = "Udekoruj wnętrze",
        ["create_house"] = "Stwórz dom (Real Estate Only)",
        ["price_of_house"] = "Cena domu",
        ["tier_number"] = "Numer poziomu domu",
        ["add_garage"] = "Dodaj dom garaż (Real Estate Only)",
        ["ring_doorbell"] = "Zadzwoń dzwonkiem"
    },
    menu = {
        ["house_options"] = "Opcje domu",
        ["close_menu"] = "⬅ Zamknij menu",
        ["enter_house"] = "Wejdź do swojego domu",
        ["give_house_key"] = "Daj klucz do domu",
        ["exit_property"] = "Wyjdź z Domu",
        ["front_camera"] = "Przednia kamera",
        ["back"] = "Z powrotem",
        ["remove_key"] = "Usuń klucz",
        ["open_door"] = "Otwórz drzwi",
        ["view_house"] = "Zobacz dom",
        ["ring_door"] = "Dzwonek do drzwi",
        ["exit_door"] = "Wyjdź z właściwości",
        ["open_stash"] = "Otwórz skrytkę",
        ["stash"] = "Szafka",
        ["change_outfit"] = "Zmień ubiór",
        ["outfits"] = "Outfit",
        ["change_character"] = "Zmień postać",
        ["characters"] = "Postacie",
        ["enter_unlocked_house"] = "Wejdź do odblokowanego domu",
        ["lock_door_police"] = "Zamknij drzwi"
    },
    target = {
        ["open_stash"] = "[E] Otwórz skrytkę",
        ["outfits"] = "[E] Zmień stroje",
        ["change_character"] = "[E] Zmiana Postaci",
    },
    log = {
        ["house_created"] = "Utworzono dom:",
        ["house_address"] = "**Address**: %{label}\n\n**Listing Price**: %{price}\n\n**Tier**: %{tier}\n\n**Listing Agent**: %{agent}",
        ["house_purchased"] = "House Purchased:",
        ["house_purchased_by"] = "**Address**: %{house}\n\n**Purchase Price**: %{price}\n\n**Purchaser**: %{firstname} %{lastname}"
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
