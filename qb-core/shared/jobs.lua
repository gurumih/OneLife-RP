QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Cywil',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Bezrobotny',
                payment = 50
            },
        },
	},
    ['lumberjack'] = {
		label = 'LumberJack',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Logger',
                payment = 50
            },
        },
	},
    ["pizzeria"] = {
        label = "Pizzeria",
        offDutyPay = false,
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Worker',
                payment = 30,
            },
            ['1'] = {
                name = 'Vice Boss',
                payment = 70,
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 130,
            },
        }
    },
    ['vunicorn'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 25
            },
			['1'] = {
                name = 'Employee',
                payment = 40
            },
			['2'] = {
                name = 'Bar Staff',
                payment = 50
            },
			['3'] = {
                name = 'Dancer',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 100
            },
            ['5'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['police'] = {
		label = 'SASP',
        type = "SASP",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 300
            },
            ['1'] = {
                name = 'Proobie Trooper',
                payment = 400
            },
            ['2'] = {
                name = 'Trooper',
                payment = 500
            },
            ['3'] = {
                name = 'Senior trooper',
                payment = 600
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 800
            },
            ['5'] = {
                name = 'Staff Sergeant',
                payment = 1000
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 1100
            },
            ['7'] = {
                name = 'Staff Lieutenant',
                payment = 1200
            },
            ['8'] = {
                name = 'Captain',
                payment = 1300
            },
            ['9'] = {
                name = 'Staff Captain',
                payment = 1450
            },
            ['10'] = {
                name = 'Commander',
                isboss = true,
                payment = 1600
            },
            ['11'] = {
                name = 'Assistant Chief of State Police',
                isboss = true,
                payment = 1800
            },
            ['12'] = {
                name = 'Deputy Chief of State Police',
				isboss = true,
                payment = 2000
            },
            ['13'] = {
                name = 'Chief of State Police',
                isboss = true,
                payment = 2300
            },
        },
    },
	['ambulance'] = {
		label = 'SAMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Praktykant',
                payment = 300
            },
			['1'] = {
                name = 'Pielęgniarz',
                payment = 400
            },
			['2'] = {
                name = 'Ratownik medyczny',
                payment = 500
            },
			['3'] = {
                name = 'Lekarz rezydent',
                payment = 600
            },
			['4'] = {
                name = 'Lekarz',
                payment = 700
            },
			['5'] = {
                name = 'Lekarz Specjalista',
                payment = 800
            },
			['6'] = {
                name = 'Doktor',
                payment = 900
            },
			['7'] = {
                name = 'Doktor Habilitowany',
                payment = 1000
            },
			['8'] = {
                name = 'Profesor',
                payment = 1100
            },
			['9'] = {
                name = 'Profesor Zwyczajny',
                payment = 1200
            },
			['10'] = {
                name = 'Profesor Nadzwyczajny',
                payment = 1300
            },
			['11'] = {
                name = 'Chirurg',
                payment = 1400
            },
			['12'] = {
                name = 'Chirurg Specjalista',
                payment = 1500
            },
			['13'] = {
                name = 'Oddziałowy',
                payment = 1600
            },
			['14'] = {
                name = 'Zastępca ordynatora',
                payment = 1800,
				isboss = true
            },
			['15'] = {
                name = 'Ordynator',
                payment = 2000,
				isboss = true
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 200
            },
			['1'] = {
                name = 'House Sales',
                payment = 250
            },
			['2'] = {
                name = 'Business Sales',
                payment = 300
            },
			['3'] = {
                name = 'Broker',
                payment = 350
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 400
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 200
            },
			['1'] = {
                name = 'Driver',
                payment = 250
            },
			['2'] = {
                name = 'Event Driver',
                payment = 300
            },
			['3'] = {
                name = 'Sales',
                payment = 350
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 400
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Kierowca',
                payment = 200
            },
		},
	},
	['cardealer'] = {
		label = 'Tunner',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Rekrut',
                payment = 200
            },
			['1'] = {
                name = 'mechanik',
                payment = 250
            },
			['2'] = {
                name = 'zaawansowany mechanik',
                payment = 300
            },
			['3'] = {
                name = 'zastepca szefa',
                payment = 350
            },
			['4'] = {
                name = 'szef',
				isboss = true,
                payment = 400
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Rekrut',
                payment = 300
            },
			['1'] = {
                name = 'Młodszy mechanik',
                payment = 400
            },
			['2'] = {
                name = 'Mechanik',
                payment = 500
            },
			['3'] = {
                name = 'Starszy Mechanik',
                payment = 600
            },
            ['4'] = {
                name = 'Kierownik',
                payment = 700
            },
            ['5'] = {
                name = 'Zastępca',
                isboss = true,
                payment = 850
            },
			['6'] = {
                name = 'Szef',
				isboss = true,
                payment = 1000
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 200
            },
        },
	},
	['lawyer'] = {
		label = 'DOJ',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Aplikant',
                payment = 100
            },
			['1'] = {
                name = 'Adwokat',
                payment = 100
            },
			['2'] = {
                name = 'Prokurator',
                payment = 100
            },
			['3'] = {
                name = 'Zastępca Adwokata Generalnego',
                payment = 100
            },
			['4'] = {
                name = 'Asystent Prokuratora Generalnego',
                payment = 100
            },
			['5'] = {
                name = 'Zastępca Prokuratora Generalnego',
                payment = 100
            },
			['6'] = {
                name = 'Adwokat Generalny',
                payment = 100
            },
			['7'] = {
                name = 'Sąd Najwyższy',
                payment = 100
            },
			['8'] = {
                name = 'Prokurator Generalny',
                payment = 100
            },
			['9'] = {
                name = 'Chief DOJ',
                payment = 100
            },		
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 200
            },
        },
	},
	['trucker'] = {
		label = 'Kierowca',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Kierowca busa',
                payment = 200
            },
        },
	},
	['tow'] = {
		label = 'Holownik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Kierowca',
                payment = 200
            },
        },
	},
	['garbage'] = {
		label = 'Śmieciarz',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Śmieciarz',
                payment = 200
            },
        },
	},
	['vineyard'] = {
		label = 'Winiarz',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Pracownik',
                payment = 200
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'sprzedawca',
                payment = 200
            },
        },
	},
    ['ochrona'] = {
		label = 'ochrona',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
                name = 'rekrut',
                payment = 40
            },
			['1'] = {
                name = 'ochroniarz',
                payment = 50
            },
			['2'] = {
                name = 'Starszy Ochroniarz',
                payment = 80
            },
			['3'] = {
                name = 'Koordynator zespołu',
				isboss = true,
                payment = 100
            },
            ['4'] = {
                name = 'Szef',
				isboss = true,
                payment = 150
            },
        },
	},
	["burgershot"] = {
		label = "BurgerShot",
		defaultDuty = true,
		grades = {
        ['0'] = {
                name = "Maskotka",
                payment = 50
        },
	    ['1'] = {
                name = "Kucharz",
                payment = 75
            },
	    ['2'] = {
                name = "Sprzedawca",
                payment = 100
            },
	    ['3'] = {
                name = "Kierownik",
                payment = 150
            },
	   ['4'] = {
                name = "Zastępca Burgershota",
		        isboss = true,
                payment = 500
            },
	    ['5'] = {
                name = "Właściciel Burgershota",
		        isboss = true,
                payment = 500
            },
        },
	},
    ['lsc'] = {
		label = 'Los Santos Custom',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Rekrut',
                payment = 300
            },
			['1'] = {
                name = 'Młodszy mechanik',
                payment = 400
            },
			['2'] = {
                name = 'Mechanik',
                payment = 500
            },
			['3'] = {
                name = 'Starszy Mechanik',
                payment = 600
            },
            ['4'] = {
                name = 'Kierownik',
                payment = 700
            },
            ['5'] = {
                name = 'Zastępca',
                isboss = true,
                payment = 850
            },
			['6'] = {
                name = 'Szef',
				isboss = true,
                payment = 1000
            },
        },
	},
}