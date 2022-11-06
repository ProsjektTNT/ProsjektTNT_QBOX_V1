return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		}
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['firework2'] = {
		label = 'poppelers',
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks"
	},

	['fitbit'] = {
		label = 'fitbit',
		weight = 500,
		stack = false,
		close = true,
		description = "I like fitbit"
	},

	['weed_purple-haze'] = {
		label = 'purple haze 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze"
	},

	['firstaid'] = {
		label = 'first aid',
		weight = 2500,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet"
	},

	['meth'] = {
		label = 'meth',
		weight = 100,
		stack = true,
		close = true,
		description = "A baggie of Meth"
	},

	['drill'] = {
		label = 'drill',
		weight = 20000,
		stack = true,
		close = false,
		description = "The real deal..."
	},

	['kurkakola'] = {
		label = 'cola',
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there"
	},

	['lighter'] = {
		label = 'lighter',
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to"
	},

	['weed_brick'] = {
		label = 'weed brick',
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers."
	},

	['screwdriverset'] = {
		label = 'toolkit',
		weight = 1000,
		stack = true,
		close = false,
		description = "Very useful to screw... screws..."
	},

	['walkstick'] = {
		label = 'walking stick',
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA"
	},

	['rolex'] = {
		label = 'golden watch',
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!"
	},

	['metalscrap'] = {
		label = 'metal scrap',
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this"
	},

	['radioscanner'] = {
		label = 'radio scanner',
		weight = 1000,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however"
	},

	['weed_og-kush_seed'] = {
		label = 'ogkush seed',
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush"
	},

	['labkey'] = {
		label = 'key',
		weight = 500,
		stack = false,
		close = true,
		description = "Key for a lock...?"
	},

	['lawyerpass'] = {
		label = 'lawyer pass',
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect"
	},

	['filled_evidence_bag'] = {
		label = 'evidence bag',
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:("
	},

	['weed_nutrition'] = {
		label = 'plant fertilizer',
		weight = 2000,
		stack = true,
		close = true,
		description = "Plant nutrition"
	},

	['empty_weed_bag'] = {
		label = 'empty weed bag',
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag"
	},

	['coke_small_brick'] = {
		label = 'coke package',
		weight = 350,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space"
	},

	['10kgoldchain'] = {
		label = '10k gold chain',
		weight = 2000,
		stack = true,
		close = true,
		description = "10 carat golden chain"
	},

	['glass'] = {
		label = 'glass',
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out"
	},

	['printerdocument'] = {
		label = 'document',
		weight = 500,
		stack = false,
		close = true,
		description = "A nice document"
	},

	['id_card'] = {
		label = 'id card',
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself"
	},

	['advancedrepairkit'] = {
		label = 'advanced repairkit',
		weight = 4000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle"
	},

	['jerry_can'] = {
		label = 'jerrycan 20l',
		weight = 20000,
		stack = true,
		close = true,
		description = "A can full of Fuel"
	},

	['nitrous'] = {
		label = 'nitrous',
		weight = 1000,
		stack = true,
		close = true,
		description = "Speed up, gas pedal! :D"
	},

	['casinochips'] = {
		label = 'casino chips',
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling"
	},

	['rubber'] = {
		label = 'rubber',
		weight = 100,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D"
	},

	['weed_og-kush'] = {
		label = 'ogkush 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush"
	},

	['weed_skunk'] = {
		label = 'skunk 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk"
	},

	['firework3'] = {
		label = 'wipeout',
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks"
	},

	['steel'] = {
		label = 'steel',
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something"
	},

	['weed_white-widow'] = {
		label = 'white widow 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow"
	},

	['advancedlockpick'] = {
		label = 'advanced lockpick',
		weight = 500,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers"
	},

	['plastic'] = {
		label = 'plastic',
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019"
	},

	['weed_amnesia_seed'] = {
		label = 'amnesia seed',
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia"
	},

	['laptop'] = {
		label = 'laptop',
		weight = 4000,
		stack = true,
		close = true,
		description = "Expensive laptop"
	},

	['toaster'] = {
		label = 'toaster',
		weight = 18000,
		stack = false,
		close = true,
		description = "Toast"
	},

	['antipatharia_coral'] = {
		label = 'antipatharia',
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals"
	},

	['grape'] = {
		label = 'grape',
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes"
	},

	['iphone'] = {
		label = 'iphone',
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone"
	},

	['coke_brick'] = {
		label = 'coke brick',
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space"
	},

	['aluminumoxide'] = {
		label = 'aluminium powder',
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with"
	},

	['certificate'] = {
		label = 'certificate',
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff"
	},

	['samsungphone'] = {
		label = 'samsung s10',
		weight = 1000,
		stack = true,
		close = true,
		description = "Very expensive phone"
	},

	['snikkel_candy'] = {
		label = 'snikkel',
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O"
	},

	['diving_gear'] = {
		label = 'diving gear',
		weight = 30000,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather"
	},

	['tosti'] = {
		label = 'grilled cheese sandwich',
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat"
	},

	['empty_evidence_bag'] = {
		label = 'empty evidence bag',
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more"
	},

	['handcuffs'] = {
		label = 'handcuffs',
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?"
	},

	['cryptostick'] = {
		label = 'crypto stick',
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?"
	},

	['dendrogyra_coral'] = {
		label = 'dendrogyra',
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral"
	},

	['weed_skunk_seed'] = {
		label = 'skunk seed',
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Skunk"
	},

	['security_card_01'] = {
		label = 'security card a',
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to"
	},

	['grapejuice'] = {
		label = 'grape juice',
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy"
	},

	['goldchain'] = {
		label = 'golden chain',
		weight = 1500,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!"
	},

	['diamond'] = {
		label = 'diamond',
		weight = 1000,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!"
	},

	['police_stormram'] = {
		label = 'stormram',
		weight = 18000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors"
	},

	['xtcbaggy'] = {
		label = 'bag of xtc',
		weight = 0,
		stack = true,
		close = true,
		description = "Pop those pills baby"
	},

	['gatecrack'] = {
		label = 'gatecrack',
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences"
	},

	['repairkit'] = {
		label = 'repairkit',
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle"
	},

	['binoculars'] = {
		label = 'binoculars',
		weight = 600,
		stack = true,
		close = true,
		description = "Sneaky Breaky..."
	},

	['moneybag'] = {
		label = 'money bag',
		weight = 0,
		stack = false,
		close = true,
		description = "A bag with cash"
	},

	['twerks_candy'] = {
		label = 'twerks',
		weight = 100,
		stack = true,
		close = true,
		description = "Some delicious candy :O"
	},

	['stickynote'] = {
		label = 'sticky note',
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)"
	},

	['ifaks'] = {
		label = 'ifaks',
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover."
	},

	['sandwich'] = {
		label = 'sandwich',
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach"
	},

	['weed_ak47'] = {
		label = 'ak47 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47"
	},

	['copper'] = {
		label = 'copper',
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something"
	},

	['diamond_ring'] = {
		label = 'diamond ring',
		weight = 1500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!"
	},

	['whiskey'] = {
		label = 'whiskey',
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there"
	},

	['driver_license'] = {
		label = 'drivers license',
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle"
	},

	['iron'] = {
		label = 'iron',
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something"
	},

	['water_bottle'] = {
		label = 'bottle of water',
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there"
	},

	['microwave'] = {
		label = 'microwave',
		weight = 46000,
		stack = false,
		close = true,
		description = "Microwave"
	},

	['diving_fill'] = {
		label = 'diving tube',
		weight = 3000,
		stack = false,
		close = true,
		description = nil
	},

	['weed_white-widow_seed'] = {
		label = 'white widow seed',
		weight = 0,
		stack = true,
		close = false,
		description = "A weed seed of White Widow"
	},

	['firework1'] = {
		label = '2brothers',
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks"
	},

	['coffee'] = {
		label = 'coffee',
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine"
	},

	['weed_ak47_seed'] = {
		label = 'ak47 seed',
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47"
	},

	['tablet'] = {
		label = 'tablet',
		weight = 2000,
		stack = true,
		close = true,
		description = "Expensive tablet"
	},

	['aluminum'] = {
		label = 'aluminium',
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something"
	},

	['weed_purple-haze_seed'] = {
		label = 'purple haze seed',
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze"
	},

	['firework4'] = {
		label = 'weeping willow',
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks"
	},

	['wine'] = {
		label = 'wine',
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening"
	},

	['crack_baggy'] = {
		label = 'bag of crack',
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy faster"
	},

	['thermite'] = {
		label = 'thermite',
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn"
	},

	['beer'] = {
		label = 'beer',
		weight = 500,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!"
	},

	['armor'] = {
		label = 'armor',
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?"
	},

	['painkillers'] = {
		label = 'painkillers',
		weight = 0,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again"
	},

	['pinger'] = {
		label = 'pinger',
		weight = 1000,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location"
	},

	['vodka'] = {
		label = 'vodka',
		weight = 500,
		stack = true,
		close = true,
		description = "For all the thirsty out there"
	},

	['heavyarmor'] = {
		label = 'heavy armor',
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?"
	},

	['cleaningkit'] = {
		label = 'cleaning kit',
		weight = 250,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!"
	},

	['cokebaggy'] = {
		label = 'bag of coke',
		weight = 0,
		stack = true,
		close = true,
		description = "To get happy real quick"
	},

	['ironoxide'] = {
		label = 'iron powder',
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with."
	},

	['harness'] = {
		label = 'race harness',
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car"
	},

	['weed_amnesia'] = {
		label = 'amnesia 2g',
		weight = 200,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia"
	},

	['rolling_paper'] = {
		label = 'rolling paper',
		weight = 0,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis."
	},

	['oxy'] = {
		label = 'prescription oxy',
		weight = 0,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off"
	},

	['security_card_02'] = {
		label = 'security card b',
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to"
	},

	['small_tv'] = {
		label = 'small tv',
		weight = 30000,
		stack = false,
		close = true,
		description = "TV"
	},

	['visa'] = {
		label = 'visa card',
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM"
	},

	['markedbills'] = {
		label = 'marked money',
		weight = 1000,
		stack = false,
		close = true,
		description = "Money?"
	},

	['trojan_usb'] = {
		label = 'trojan usb',
		weight = 0,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems"
	},

	['goldbar'] = {
		label = 'gold bar',
		weight = 7000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me"
	},

	['tunerlaptop'] = {
		label = 'tunerchip',
		weight = 2000,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing"
	},

	['weaponlicense'] = {
		label = 'weapon license',
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License"
	},

	['electronickit'] = {
		label = 'electronic kit',
		weight = 100,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?"
	},

	['joint'] = {
		label = 'joint',
		weight = 0,
		stack = true,
		close = true,
		description = "Sidney would be very proud at you"
	},
}