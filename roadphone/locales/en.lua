local Translations = {
   error = {
   ['fixphone'] = 'Wystąpił błąd podczas próby wykonania polecenia /fixphone.',
   ['fixphone2'] = 'Jeśli komunikat nie zniknie w ciągu kilku sekund, wpisz /fixphone.',
   ['nophone'] = 'Nie posiadasz telefonu.',
   ['notenoughmoney'] = "Nie masz takich pieniędzy.",
   },
   success = {},
   info = {
   ['registerkeymapping'] = 'Telefon otwarty',
   ['invalidvalue'] = 'Nieprawidłowa wartość.',
   ['sendmoneyyourself'] = "Nie możesz wysyłać sobie pieniędzy.",
   ['receivemoney'] = 'Otrzymałeś przelew %{value} $ .',
   ['sendmoney'] = 'Dokonałeś transferu %{value} $ .',
   ['numbernotfound'] = 'Nie można znaleźć podanego numeru.',
   ['newmessageencro'] = 'Odebrano nową wiadomość EncroChat',
   ['encroaccountexist'] = 'Masz już konto.',
   ['encrochatusernameexist'] = 'Ta nazwa użytkownika już istnieje.',
   ['messageappflightmode'] = 'Nie można wysłać wiadomości w trybie samolotowym.',
   ['newmessage'] = 'Otrzymałeś nową wiadomość',
   ['resetprofile'] = 'Zdjęcie profilowe zostało zresetowane.',
   ['updatedprofile'] = 'Zaktualizowano zdjęcie profilowe.',
   ['yellownotenoughmoney'] = 'Nie masz wystarczająco dużo pieniędzy na stworzenie reklamy.',
   ['setwaypoint'] = 'Punkt trasy został ustawiony pomyślnie.',
   ['radionoaccess'] = 'Użytkownik nie ma dostępu do tego radia.',
   ['radioleave'] = 'Zostawiłeś radio.',
   ['noradioitem'] = 'Potrzebujesz radia.',
   ['radiojoined'] = 'Przyłączyłeś się do radia %{value}.',
   ['yellowpageapp'] = 'YellowPages',
   ['gpsapp'] = 'GPS',
   ['radioapp'] = 'Radio',
   ['messageapp'] = 'Wiadomości',
   ['encrochatapp'] = 'Encrochat',
   ['bankapp'] = 'Bank',
   ['settingsapp'] = 'Ustawienia'
   },
   text = {
      ['selfmessage'] = 'Nie można wysłać wiadomości do samego siebie.',
   },
}
Lang = Locale:new({
   phrases = Translations,
   warnOnMissing = true
})