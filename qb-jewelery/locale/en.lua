local Translations = {
    error = {
        fingerprints = 'Zostawiłeś odcisk palca na szkle',
        minimum_police = 'Wymagane minimum %{value} policji',
        wrong_weapon = 'Twoja broń nie jest wystarczająco silna...',
        to_much = 'Masz za dużo w kieszeni'
    },
    success = {},
    info = {
        progressbar = 'Rozbijanie gabloty',
    },
    general = {
        target_label = 'Rozbij Gablote',
        drawtextui_grab = '[E] Rozbij Gablote',
        drawtextui_broken = 'Gablota jest zepsuta'
    }
}

Lang = Locale:new({phrases = Translations})
