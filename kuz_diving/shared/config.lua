Config = {}

Config.Debug = false

-- Whether or not the new QBcore export should be used
-- If you set it to false make sure to uncomment the import from the fxmanifest.lua ("--shared_script '@qb-core/import.lua'" simply remove the dashes)
Config.useNewQBExport = true

-- If players should receive divin/scuba gear when applying the items
Config.divingClothing = true

-- If sell locations should ba available for players
Config.useSellLocations = true

-- Whether to show the time your oxygen will last
Config.showOxygenRemaining = true

Config.sellLocations = {
    {
        locations = {
            {
                x = -617.39,
                y = -234.76,
                z = 38.05
            },
        },
        name = 'Jeweler',
        showOnMap = false,
        useAccount = 'bank',
        blipIcon = 617,
        blipColor = 46,
        blipScale = 0.8,
        items = {
            {
                item = 'kuz_watch',
                label = 'Expensive watch',
                price = 770,
            },
            {
                item = 'kuz_pearl',
                label = 'Pearl',
                price = 500,
            },
            {
                item = 'kuz_jewelry',
                label = 'Jewelry',
                price = 240,
            },
            {
                item = 'kuz_goldcoin',
                label = 'Golden coin',
                price = 70,
            },
            {
                item = 'kuz_silvercoin',
                label = 'Silver coin',
                price = 25,
            },
        },
    },
    {
        locations = {
            {
                x = -1621.46,
                y = -380.81,
                z = 43.71
            },
            {
                x = -406.8,
                y = 6313.47,
                z = 28.94
            },
        },
        name = 'Kolekcjoner monet',
        showOnMap = false,
        useAccount = 'cash',
        blipIcon = 431,
        blipColor = 46,
        blipScale = 0.8,
        items = {
            {
                item = 'kuz_rarecoin',
                label = 'Rare coin',
                price = 470,
            },
            {
                item = 'kuz_goldcoin',
                label = 'Golden coin',
                price = 120,
            },
            {
                item = 'kuz_silvercoin',
                label = 'Silver coin',
                price = 35,
            },
        },
    },
    {
        locations = {
            {
                x = -1095.78,
                y = 4948.48,
                z = 218.35
            },
        },
        name = 'Kupujący części do broni',
        showOnMap = false,
        useAccount = 'cash',
        blipIcon = 437,
        blipColor = 64,
        blipScale = 0.7,
        items = {
            {
                item = 'kuz_merryweather',
                label = 'Merryweather parts',
                price = 1200,
            },
        },
    }
}


-- Locations where the items will spawn which then can be picked up by players
Config.lootLocations = {
    paddleBoat = {
        name = "Łódź wiosłowa",
        showOnMap = true,
        x = 2688.0,
        y = -1392.0,
        z = -18.0,
        spotsCount = 50,
        radius = 65,
        loot = {
            {
                item = "kuz_goldcoin",
                chance = 32,
                amount_min = 1,
                amount_max = 2,
            },
            {
                item = "kuz_silvercoin",
                chance = 50,
                amount_min = 1,
                amount_max = 3,
            },
            {
                item = "kuz_pearl",
                chance = 9,
                amount_min = 1,
                amount_max = 2,
            },
            {
                item = "kuz_rarecoin",
                chance = 6,
                amount_min = 1,
                amount_max = 3,
            },
            {
                item = "kuz_plasmacutter",
                chance = 3,
                amount_min = 1,
                amount_max = 1,
            },
        },
        models = {
            "prop_money_bag_01",
            "prop_idol_case_02",
            "prop_drop_armscrate_01b",
            "prop_box_ammo04a",
            "prop_box_tea01a",
        }
    },
    airliner = {
        name = "Samolot pasażerski",
        showOnMap = true,
        x = -934.0,
        y = 6670.0,
        z = -27.0,
        spotsCount = 100,
        radius = 130,
        loot = {
            {
                item = "kuz_goldcoin",
                chance = 26,
                amount_min = 1,
                amount_max = 2,
            },
            {
                item = "kuz_silvercoin",
                chance = 34,
                amount_min = 1,
                amount_max = 3,
            },
            {
                item = "kuz_jewelry",
                chance = 20,
                amount_min = 1,
                amount_max = 2,
            },
            {
                item = "kuz_rarecoin",
                chance = 5,
                amount_min = 1,
                amount_max = 3,
            },
            {
                item = "kuz_watch",
                chance = 15,
                amount_min = 1,
                amount_max = 2,
            },
        },
        models = {
            "prop_luggage_04a",
            "prop_luggage_06a",
            "prop_luggage_02a",
            "prop_luggage_01a",
            "prop_box_tea01a",
        }
    },
    cargoShip = {
        name = "Statek towarowy (nielegalny)",
        showOnMap = true,
        requireItem = 'kuz_plasmacutter',
        animationDict = 'Scenario',
        animation = 'WORLD_HUMAN_WELDING',
        x = 3168.0,
        y = -316.0,
        z = -11.0,
        spotsCount = 5,
        radius = 80,
        loot = {
            {
                item = "kuz_merryweather",
                chance = 60,
                amount_min = 1,
                amount_max = 2,
            },
        },
        models = {
            "prop_container_ld_pu",
        }
    }
}
