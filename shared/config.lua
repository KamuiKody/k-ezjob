Config = {}

Config.Debug = false
Config.UseExports = true -- see shared/imports.lua if true this utilizes item and job exports

Config.Labels = {
    ['duty'] = 'On/Off Duty',
    ['register'] = 'View Register',
    ['stash'] = 'Open Stash',
    ['job_stash'] = 'Open Work Stash',
    ['tray'] = 'Check Tray',
    ['boss_menu'] = 'Open Boss Menu',
    ['clothing'] = 'Change Clothes'
}
Config.Icons = {
    ['duty'] = 'fas fa-user-o',
    ['register'] = 'fas fa-university',
    ['stash'] = 'fas fa-database',
    ['job_stash'] = 'fas fa-database',
    ['tray'] = 'fas fa-spoon',
    ['boss_menu'] = 'fas fa-tablet',
    ['clothing'] = 'fas fa-user'    
}

Config.Stash = {
    ['stash'] = {
        weight = 100000,
        slots = 80
    },
    ['job_stash'] = {
        weight = 100000,
        slots = 20
    },
    ['tray'] = {
        weight = 30000,
        slots = 5
    }
}

Config.Locations = {
    ['bishops'] = {-- name on the society fund
        ['commission'] = 0.15, 
        ['blip']= {-- blip options
            active = true,
            label = "Bishop's Chicken",
            coords = vector3(174.58, -1632.28, 28.9),
            sprite = 106, 
            color = 1,
            scale = 0.6
        },
        ['duty'] = { -- clock in and clock out 
            [1] = vector4(182.13, -1631.82, 29.4, 304.48),
        },
        ['register'] = { -- creates cash register to charge customer 
            [1] = vector4(174.58, -1632.28, 28.9, 122.02),
            [2] = vector4(176.18, -1634.73, 29.0, 137.37),
        },
        ['stash'] = { -- personal stash attached to citizen id
            [1] = vector4(178.71, -1637.31, 29.4, 182.07),
        },
        ['job_stash'] = { -- stash only to be opened by this job
            [1] = vector4(177.17, -1631.74, 29.4, 286.77),
        },
        ['tray'] = { -- public stash
            [1] = vector4(175.76, -1633.9, 29.33, 0.0),
            [2] = vector4(175.19, -1633.08, 29.15, 125.33),
        },
        ['job_names'] = { -- names of the job to have access to all except the public stash
            'bishops'
        },
        ['boss_menu'] = { -- creates a location for the boss to access the boss menu
            [1] = vector4(180.72, -1628.52, 29.4, 136.88),
        },
        ['clothing'] = { -- creates a place for employees to change clothing
            [1] = vector4(181.76, -1635.36, 29.4, 0.86),
        },
        ['shop'] = { -- a store or armory so to say
            [1] = {
                ['coord'] = vector4(183.16, -1633.91, 29.4, 303.88),
                ['icon'] = "fas fa-drumstick-bite",
                ['label'] = 'Ingredients Shop',
                ['items'] = {
                    [1] = {
                        name = "frozen_fries",
                        price = 50,
                        amount = 100,
                        info = {}
                    },
                    [2] = {
                        name = "popcorn_chicken",
                        price = 50,
                        amount = 100,
                        info = {}
                    },
                    [3] = {
                        name = "raw_wings",
                        price = 100,
                        amount = 100,
                        info = {}
                    },
                    [4] = {
                        name = "frozen_boneless",
                        price = 100,
                        amount = 100,
                        info = {}
                    },
                    [5] = {
                        name = "burger_ingredients",
                        price = 150,
                        amount = 100,
                        info = {}
                    },
                    [6] = {
                        name = "special_ingredients",
                        price = 100,
                        amount = 100,
                        info = {}
                    },
                    [7] = {
                        name = "chicken_ingredients",
                        price = 150,
                        amount = 100,
                        info = {}
                    },
                    [8] = {
                        name = "cup",
                        price = 5,
                        amount = 100,
                        info = {}
                    },
                }
            }
        },
        ['stations'] = {-- if you use "emote" in this section leave the rest of the anim and prop stuff false
            [1] = {
                label = 'Frying Station', -- Label for targeting or drawtext UI [E] will be automatically added
                coord = vector4(182.74, -1632.8, 29.4, 301.34), -- station location
                icon = "fas fa-drumstick-bite", -- icon for targeting
                ['recipes'] = {
                    ['fries'] = { -- item name of the item rewarded
                        item = 'fries', 
                        cost = {
                            ['frozen_fries'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Fries', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = 'bartender', -- emote name if you want to use dpemotes / or you can use the options below
                        anim = false, -- animation
                        dict = false, -- animation dictionary
                        flags = false, -- animation flags
                        prop = false, -- model name
                        pos = false, -- vector3
                        rot = false --vector3
                    },
                    ['popcorn_chicken'] = { -- item name of the item rewarded
                        cost = {
                            ['frozen_pop_chk'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Chicken', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    },
                    ['wings'] = { -- item name of the item rewarded
                        cost = {
                            ['raw_wings'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Chicken', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    },
                    ['boneless_wings'] = { -- item name of the item rewarded
                        cost = {
                            ['frozen_boneless'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Chicken', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    }
                }
            },
            [2] = {
                label = 'Grill Cook', -- Label for targeting or drawtext UI [E] will be automatically added
                coord = vector4(181.39, -1630.78, 29.4, 292.68), -- station location
                icon = "fas fa-drumstick-bite", -- icon for targeting
                ['recipes'] = {
                    ['meathead_burger'] = { -- item name of the item rewarded
                        cost = {
                            ['burger_ingredients'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Burger', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    },
                    ['death_penalty_sandwhich'] = { -- item name of the item rewarded
                        cost = {
                            ['special_ingredients'] = 1,
                            ['chicken_ingredients'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Sandwhich', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    },
                    ['chicken_sandwhich'] = { -- item name of the item rewarded
                        cost = {
                            ['chicken_ingredients'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Cooking Sandwhich', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        emote = "bartender", -- emote name if you want to use dpemotes
                    }
                }
            },
            [3] = {
                label = 'Fountain Drinks', -- Label for targeting or drawtext UI [E] will be automatically added
                coord = vector4(179.38, -1629.23, 29.4, 33.41), -- station location
                icon = "fas fa-cup", -- icon for targeting
                ['recipes'] = {
                    ['sprunk'] = { -- item name of the item rewarded
                        cost = {
                            ['cup'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Dispensing Fluids', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        dict = "mini@sprunk", -- animation
                        anim = "plyr_buy_drink_pt1", -- animation dictionary
                        flags = 9, -- animation flags
                        model = "v_ret_fh_bscup", -- model name
                        pos = vector3(0.12, 0.008, 0.03), -- vector3
                        rot = vector3(175.0, 160.0, 270.0) -- vector3
                    },
                    ['ecola'] = { -- item name of the item rewarded
                        cost = {
                            ['cup'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Dispensing Fluids', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        dict = "mini@sprunk", -- animation
                        anim = "plyr_buy_drink_pt1", -- animation dictionary
                        flags = 9, -- animation flags
                        model = "v_ret_fh_bscup", -- model name
                        pos = vector3(0.12, 0.008, 0.03), -- vector3
                        rot = vector3(175.0, 160.0, 270.0) -- vector3
                    },
                    ['water_bottle'] = { -- item name of the item rewarded
                        cost = {
                            ['cup'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Dispensing Fluids', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        dict = "mini@sprunk", -- animation
                        anim = "plyr_buy_drink_pt1", -- animation dictionary
                        flags = 9, -- animation flags
                        model = "v_ret_fh_bscup", -- model name
                        pos = vector3(0.12, 0.008, 0.03), -- vector3
                        rot = vector3(175.0, 160.0, 270.0) -- vector3
                    }
                }
            },
            [4] = {
                label = 'Slushy Machine', -- Label for targeting or drawtext UI [E] will be automatically added
                coord = vector4(178.84, -1630.17, 29.4, 135.47), -- station location
                icon = "fas fa-cup", -- icon for targeting
                ['recipes'] = {
                    ['slushy'] = { -- item name of the item rewarded
                        cost = {
                            ['cup'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Dispensing Slushy', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        dict = "mini@sprunk", -- animation
                        anim = "plyr_buy_drink_pt1", -- animation dictionary
                        flags = 9, -- animation flags
                        model = "v_ret_fh_bscup", -- model name
                        pos = vector3(0.12, 0.008, 0.03), -- vector3
                        rot = vector3(175.0, 160.0, 270.0) -- vector3
                    }
                }
            },
            [5] = {
                label = 'Coffee Machine', -- Label for targeting or drawtext UI [E] will be automatically added
                coord = vector4(179.61, -1631.17, 29.4, 117.06), -- station location
                icon = "fas fa-cup", -- icon for targeting
                ['recipes'] = {
                    ['coffee'] = { -- item name of the item rewarded
                        cost = {
                            ['cup'] = 1
                        }, -- [name of the item taken] = number of the item taken
                        label = 'Dispensing Coffee', -- label for progressbar
                        time = 5000, -- progressbar time
                        received = 1, -- how many reward items received
                        dict = "mini@sprunk", -- animation
                        anim = "plyr_buy_drink_pt1", -- animation dictionary
                        flags = 9, -- animation flags
                        model = "p_amb_coffeecup_01", -- model name
                        pos = vector3(0.12, 0.008, 0.03), -- vector3
                        rot = vector3(175.0, 160.0, 270.0) -- vector3
                    }
                }
            }
        },        
        ['activity'] = { -- in case you want a spot for someone to trigger a specific activity like for towing npc tows or what have ya
            -- [1] = {-- not currently setup.
            --     coord = vector4(0,0,0,0),
            --     label = 'This is a test',
            --     event = 'k-ezjob:testeventexternal',
            --     server = false,
            --     job = false -- will restrict this to jobs listed above
            -- }
        }
    }
}