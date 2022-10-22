Imports = {}

Imports.Cityhall = { -- this will put jobs in city hall using the following format
    --['bishops'] = "Bishop's Chicken"
}

Imports.Boss = { 
    ['bishops'] = 4000,
}

Imports.Jobs = { -- this will add the jobs to the jobs.lua
    ["bishops"] = {
        label = "Bishops Chicken",
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = "Trainee",
                payment = 100
            },
            ['1'] = {
                name = "Employee",
                payment = 200
            },
            ['2'] = {
                name = "Professional Frycook",
                payment = 250
            },
            ['3'] = {
                name = "Manager",
                payment = 300
            },
            ['4'] = {
                name = "Owner",
                isboss = true,
                payment = 350
            }
        }
    }
}

Imports.Items = { -- this will add the items to the items.lua
    ['fries'] 						= {['name'] = 'fries', 			 	  	  	['label'] = 'Freedom Fries', 	        ['weight'] = 200, 		['type'] = 'item', 		['image'] = 'fries.png', 				    ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['frozen_fries'] 				= {['name'] = 'frozen_fries', 			  	['label'] = 'Frozen fries', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'frozen_fries.png', 		    ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,                                                   ['combinable'] = nil,   ['description'] = ''},
    ['popcorn_chicken'] 			= {['name'] = 'popcorn_chicken', 			['label'] = 'Noogies', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'popcorn_chicken.png', 		    ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['frozen_pop_chk'] 				= {['name'] = 'frozen_pop_chk', 			['label'] = 'Frozen Noogies', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'frozen_pop_chk.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	                                                  ['combinable'] = nil,   ['description'] = ''},
    ['wings'] 						= {['name'] = 'wings', 			 	  	  	['label'] = 'Wild Wingz', 	            ['weight'] = 200, 		['type'] = 'item', 		['image'] = 'wings.png', 				    ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['raw_wings'] 				    = {['name'] = 'raw_wings', 			  	  	['label'] = 'Raw Wingz', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'raw_wings.png', 		        ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,                                                   ['combinable'] = nil,   ['description'] = ''},
    ['boneless_wings'] 				= {['name'] = 'boneless_wings', 			['label'] = 'Wet Noogies', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'boneless_wings.png', 		    ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['frozen_boneless'] 			= {['name'] = 'frozen_boneless', 			['label'] = 'Froozen Boneless', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'frozen_boneless.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	                                                  ['combinable'] = nil,   ['description'] = ''},
    ['meathead_burger'] 			= {['name'] = 'meathead_burger', 			['label'] = 'Meathead Burger', 	        ['weight'] = 300, 		['type'] = 'item', 		['image'] = 'meathead_burger.png', 			['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['burger_ingredients'] 			= {['name'] = 'burger_ingredients', 		['label'] = 'Burger Ingredients', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'burger_ingredients.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,                                                   ['combinable'] = nil,   ['description'] = ''},
    ['death_penalty_sandwhich'] 	= {['name'] = 'death_penalty_sandwhich',    ['label'] = 'Death Penatly', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'death_penalty_sandwhich.png',  ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['special_ingredients'] 		= {['name'] = 'special_ingredients', 		['label'] = '"Special" Ingredients', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'special_ingredients.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	                                                  ['combinable'] = nil,   ['description'] = ''},
    ['chicken_ingredients'] 		= {['name'] = 'chicken_ingredients', 		['label'] = 'Chicken Ingredients', 	    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'chicken_ingredients.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,                                                   ['combinable'] = nil,   ['description'] = ''},
    ['chicken_sandwhich'] 			= {['name'] = 'chicken_sandwhich', 			['label'] = 'Grilled Chicken', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'chicken_sandwhich.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ["degrade"] = 10.0, ['trade'] = 'spoiled_food',  ['combinable'] = nil,   ['description'] = ''},
    ['sprunk'] 				        = {['name'] = 'sprunk', 			  	    ['label'] = 'Sprunk', 					['weight'] = 150, 		['type'] = 'item', 		['image'] = 'sprunk.png', 		            ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 10.0, ['trade'] = 'bad_drink',     ['combinable'] = nil,   ['description'] = ''},
    ['ecola'] 				        = {['name'] = 'ecola', 			  	        ['label'] = 'E-Cola', 					['weight'] = 150, 		['type'] = 'item', 		['image'] = 'ecola.png', 		            ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 10.0, ['trade'] = 'bad_drink',     ['combinable'] = nil,   ['description'] = ''},
    ['slushy'] 				        = {['name'] = 'slushy', 			  	    ['label'] = 'Slushy', 					['weight'] = 150, 		['type'] = 'item', 		['image'] = 'slushy.png', 		            ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ["degrade"] = 30.0, ['trade'] = 'cup',           ['combinable'] = nil,   ['description'] = ''},
    ['cup'] 				 	    = {['name'] = 'cup', 			  	  		['label'] = 'Empty Cup', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'cup.png', 			            ['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	                                                  ['combinable'] = nil,   ['description'] = ''},
}

-------------- Items Below this line are not implimented yet. If you are smart enough to figure them out hats off to you please do not ask for support if you are trying to use stuff below this line.
Imports.ExperimentalUse = false

Imports.Consumables = { -- outside of these categories you will have to make ur own uses for items and what they do. If inside a usable item will be made and a reduction value for ones needs will be added. This piece is something i have been working on it is not functional at this time thank you!
    -- ['food'] = { -- not yet available for the current qb-release updates for compatibility very soon!
    --     ['fries'] = math.random(10,25),
    --     ['chicken_sandwhich'] = math.random(15,35),
    --     ['death_penalty_sandwhich'] = math.random(20,40),
    --     ['meathead_burger'] = math.random(15,35),
    --     ['boneless_wings'] = math.random(15,30),
    --     ['popcorn_chicken'] = math.random(10,25),
    --     ['wings'] = math.random(15,35),
    -- },
    -- ['drink'] = {
    --     ['slushy'] = math.random(10,15),
    --     ['sprunk'] = math.random(10,20),
    --     ['ecola'] = math.random(10,20),
    -- },
    -- ['alcohol'] = {}
}