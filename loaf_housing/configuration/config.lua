Version = "1.1.1"

Config = {}

local second = 1
local minute = 60 * second
local hour = 60 * minute
local day = 24 * hour
local week = 7 * day
local month = 4 * week

-- if a player doesn't log in for this time period, the house will be deleted due to inactivity. 
-- if it shouldn't automatically be deleted, just set this to false.
Config.DeleteHouse = month --[[
    you can use math here, for example:
        month + 2 * week = 1 month + 2 weeks
        52 * week = 52 weeks
        365 * day = 365 days
]]

Config.REA = true -- require real estate agents to sell houses? this requires my real estate agent job.
Config.AllowCircle = false -- allow to buy from circle, even though Config.REA is true.

Config.Options = {
    MenuAlign = "bottom-right", -- where the menus are aligned (esx_menu_default)
    MainAction = 51, -- where all keys are "E" by default, remember to change the control in language.lua so it corresponds with this
    SecondaryAction = 47, -- where all the keys are "G" by default, remember to change the control in language.lua so it corresponds with this
    Inventory = "default", -- what inventory you use, valid options: 
    --[[
        default (menu based)
        modfreakz (MF inventory: https://modit.store/products/mf-inventory?variant=39985142268087) PAID
        linden (linden_inventory: https://github.com/thelindat/linden_inventory) FREE, I RECOMMEND THIS
    --]]

    Stripper = {
        Enabled = false, -- allow people to pole dance & lap dance?
        PoleDancing = false, -- allow people to pole dance?
        LapDance = false, -- allow people to lapdance?
    },

    RequireKeyFurnish = true, -- require a key to furnish/remove furniture?

    Key = {
        CheckDistance = true, -- if you must be nearby to unlock / lock
        Distance = 3.0, -- how nearby the player must be to the door to be able to use a key
        Garage = true, -- allow people with a key to access the garage (they will only see their own vehicles)
    },
}

Config.RandomInterior = false -- true: you get assigned a random interior when purchasing | false: you can choose what interior to get when you purchase
Config.MaxProperties = 2 -- the max amount of houses a player can own
Config.EnableGarage = false -- requires my (loaf) garage
Config.Use3DText = true
Config.EnableESXIdentity = true
Config.IdentitySQL = false -- use mysql for fetching username / lastname, you should only enable this if the other method doesn't work
Config.SpawnAboveHouse = true -- if this is true, the shell will spawn in the air above the house (invisible to to other players)
Config.PreviewHouse = {
    Enabled = true, -- allow people to preview?
    Position = vector3(-4000.0, -8250.0, 1250.0), -- the position where shells are spawned when previewing.
}
Config.LockPicking = {
    Enabled = false,
    AlertPolice = false, -- this will alert the police that a house is being robbed
    Police = "police", -- the name of the job
    MinimumPolice = 2, -- minimum amount of police required to lockpick
    RequiredPicks = { -- the amount of successful lockpicks required for each house. I recommend that more expensive houses has higher number = harder to rob, and less expensive houses has lower number = easier to rob
        ["HighEndApartment"] = 7,
        ["HighEndHouse"] = 9,
        ["MidTierApartment"] = 6,
        ["MidTierHouse"] = 7,
        ["LowTierHouse"] = 4,
        ["ShitTier"] = 2,
        ["Trailer"] = 2,
    }
}

Config.PoliceRaid = {
    Enabled = false,
    OnlyBoss = false, -- if this is enabled, only the boss can breach the door
    Job = {
        Name = "police",
        Boss = "boss",
    }
}

Config.Blips = {
    Owned = true, -- every house that you personally own
    Access = true, -- every house that you have a key to
    Others = true, -- every house that is owned by someone other than yourself
    Buyable = true, -- every house that is for sale
    IKEA = true, -- where you buy furniture
    Scale = 0.3, -- then blip scale
    IKEAScale = 0.5, -- the IKEA blip scale
    Categorize = true, -- add blips to "PROPERTY" category?
}

Config.IKEA = {
    EnterIKEA = vector4(2747.54, 3472.87, 55.67, 250.0),
    ShellPosition = vector3(45.34, -1771.77, 29.4),
    CameraPosition = vector3(45.11, -1764.03, 34.0),
    Heading = 180.0,
    ResellPercent = 10, -- the % you get back of the original price when selling furniture
}

Config.ResellHouse = {
    ResellPercent = 10, -- the percent of money they get back from the original price
}

Config.ShellToUse = "k4mb1" -- k4mb1 or mythic

-- from https://github.com/JustAnotherModder/mythic_interiors/blob/master/client/shells.lua
Config.DefaultFurniture = {
    ["playerhouse_tier3"] = {
        {
            object = "v_16_high_lng_over_shadow",
            offset = vector3(10.16043000, -4.83294600, 4.99192700),
        }
    },
    ["playerhouse_hotel"] = {
        {
            object = "V_49_MotelMP_Curtains",
            offset = vector3(1.55156, -3.831001, 2.34575),
        },
        {
            object = "V_49_MotelMP_Curtains",
            offset = vector3(1.4319, -3.923151, 2.293296),
        },
    },
}

-- HighEndApartment, HighEndHouse, MidTierApartment, MidTierHouse, LowTierHouse, ShitTier, Trailer

Shells = {
    ["k4mb1"] = {
        ['HighEndApartment'] = {
            {
                object = "shell_apartment2",
            },
            {
                object = "shell_apartment1",
            },
            {
                object = "shell_highendv2",
            },
        },
        ['HighEndHouse'] = {
            {
                object = "shell_highend",
            },
            {
                object = "shell_apartment3",
            },
            {
                object = "shell_michael",
            },
            {
                object = "shell_westons",
            },
            {
                object = "shell_westons2",
            },
            {
                object = "shell_banham",
            },
        },
    
        ['MidTierApartment'] = {
            {
                object = "shell_medium2",
            },
            {
                object = "shell_v16low",
            },
            {
                object = "shell_trevor",
            },
        },
        ['MidTierHouse'] = {
            {
                object = "shell_v16mid",
            },
        },
    
        ['LowTierHouse'] = {
            {
                object = "shell_lester", 
            },
            {
                object = "shell_frankaunt",
            }
        },
    
        ['ShitTier'] = {
            {
                object = "shell_medium3",
            },
        },
    
        ['Trailer'] = {
            {
                object = "shell_trailer",
            },
        },
    },
}

Config.Shells = Shells[Config.ShellToUse]

Config.ShellOffsets = {
    ["shell_apartment2"] = vector3(-2.2558898925781, 8.9857788085938, 2.2122497558594),
    ["shell_apartment1"] = vector3(-2.2137756347656, 8.95556640625, 2.2123107910156),
    ["shell_highendv2"] = vector3(-10.472412109375, 0.82540893554688, 0.9453125),
    ["shell_highend"] = vector3(-22.357116699219, -0.3636474609375, 6.2174072265625),
    ["shell_apartment3"] = vector3(11.430450439453, 4.4891662597656, 1.01904296875),
    ["shell_michael"] = vector3(-9.3757629394531, 5.6485290527344, -5.05322265625),
    ["shell_medium2"] = vector3(6.0094604492188, 0.28695678710938, -1.6507873535156),
    ["shell_v16low"] = vector3(4.635009765625, -6.5882263183594, -2.6448974609375),
    ["shell_trevor"] = vector3(0.18386840820313, -3.8077392578125, -1.3983764648438),
    ["shell_v16mid"] = vector3(1.3710327148438, -14.351745605469, -1.4822082519531),
    ["shell_lester"] = vector3(-1.6512145996094, -6.0126342773438, -1.35986328125),
    ["shell_frankaunt"] = vector3(-0.33334350585938, -5.9446105957031, -1.5599365234375),
    ["shell_medium3"] = vector3(-2.5239868164063, 7.7714233398438, 0.19931030273438),
    ["shell_trailer"] = vector3(-1.3285827636719, -2.0115661621094, -1.4691772460938),
    ["shell_westons"] = vector3(4.3998336791992, 10.373115539551, 0.35943603515625),
    ["shell_banham"] = vector3(-3.3586883544922, -1.5261611938477, 0.24725341796875),
    ["shell_westons2"] = vector3(-1.8435668945313, 10.505462646484, 0.3590087890625)
}

for k, v in pairs(Config.Shells) do
    for k, v in pairs(v) do
        if Config.ShellOffsets[v.object] then
            v.entrance = Config.ShellOffsets[v.object]
        else
            print("^1LOAF_HOUSING: ERROR!!! ^0SHELL HAS NO ENTRANCE: " .. v.object)
        end
    end
end

Config.Houses = {
    {
        Label = "Eclipse towers 1",
        Price = 250000,
        Garage = {
            Exit = vector4(-800.55, 332.31, 85.28, 180.0), -- where the car will spawn when you take it out from your garage
            Entrance = vector3(-790.32098388672, 307.93585205078, 85.702102661133), -- where you enter the garage
        },
        Entrance = vector4(-777.29, 312.91, 85.7, 175.0),
        Type = "apartment", -- apartment or house
        ShellType = "HighEndApartment",
    },
}
-- HighEndApartment, HighEndHouse, MidTierApartment, MidTierHouse, LowTierHouse, ShitTier, Trailer

Config.ShellSpawns = { -- every possible position for a shell to be spawned. default is 66 different spawns, meaning 66 people can be inside their house at the same time! You shouldn't mess around with this tbh.
    {coords = vector3(1020.0, 2000.0, -100.0)}, -- spawn #1
    {coords = vector3(1080.0, 2000.0, -100.0)}, -- spawn #2
    {coords = vector3(1140.0, 2000.0, -100.0)}, -- spawn #3
    {coords = vector3(1200.0, 2000.0, -100.0)}, -- spawn #4
    {coords = vector3(1260.0, 2000.0, -100.0)}, -- spawn #5
    {coords = vector3(1320.0, 2000.0, -100.0)}, -- spawn #6
    {coords = vector3(1380.0, 2000.0, -100.0)}, -- spawn #7
    {coords = vector3(1440.0, 2000.0, -100.0)}, -- spawn #8
    {coords = vector3(1500.0, 2000.0, -100.0)}, -- spawn #9
    {coords = vector3(1560.0, 2000.0, -100.0)}, -- spawn #10
    {coords = vector3(1620.0, 2000.0, -100.0)}, -- spawn #11
    {coords = vector3(1680.0, 2000.0, -100.0)}, -- spawn #12
    {coords = vector3(1740.0, 2000.0, -100.0)}, -- spawn #13
    {coords = vector3(1800.0, 2000.0, -100.0)}, -- spawn #14
    {coords = vector3(1860.0, 2000.0, -100.0)}, -- spawn #15
    {coords = vector3(1920.0, 2000.0, -100.0)}, -- spawn #16
    {coords = vector3(1980.0, 2000.0, -100.0)}, -- spawn #17
    {coords = vector3(2040.0, 2000.0, -100.0)}, -- spawn #18
    {coords = vector3(2100.0, 2000.0, -100.0)}, -- spawn #19
    {coords = vector3(2160.0, 2000.0, -100.0)}, -- spawn #20
    {coords = vector3(2220.0, 2000.0, -100.0)}, -- spawn #21
    {coords = vector3(2280.0, 2000.0, -100.0)}, -- spawn #22
    {coords = vector3(2340.0, 2000.0, -100.0)}, -- spawn #23
    {coords = vector3(2400.0, 2000.0, -100.0)}, -- spawn #24
    {coords = vector3(2460.0, 2000.0, -100.0)}, -- spawn #25
    {coords = vector3(2520.0, 2000.0, -100.0)}, -- spawn #26
    {coords = vector3(2580.0, 2000.0, -100.0)}, -- spawn #27
    {coords = vector3(2640.0, 2000.0, -100.0)}, -- spawn #28
    {coords = vector3(2700.0, 2000.0, -100.0)}, -- spawn #29
    {coords = vector3(2760.0, 2000.0, -100.0)}, -- spawn #30
    {coords = vector3(2820.0, 2000.0, -100.0)}, -- spawn #31
    {coords = vector3(2880.0, 2000.0, -100.0)}, -- spawn #32
    {coords = vector3(2940.0, 2000.0, -100.0)}, -- spawn #33

    {coords = vector3(1020.0, 2100.0, -100.0)}, -- spawn #34
    {coords = vector3(1080.0, 2100.0, -100.0)}, -- spawn #35
    {coords = vector3(1140.0, 2100.0, -100.0)}, -- spawn #36
    {coords = vector3(1200.0, 2100.0, -100.0)}, -- spawn #37
    {coords = vector3(1260.0, 2100.0, -100.0)}, -- spawn #38
    {coords = vector3(1320.0, 2100.0, -100.0)}, -- spawn #39
    {coords = vector3(1380.0, 2100.0, -100.0)}, -- spawn #40
    {coords = vector3(1440.0, 2100.0, -100.0)}, -- spawn #41
    {coords = vector3(1500.0, 2100.0, -100.0)}, -- spawn #42
    {coords = vector3(1560.0, 2100.0, -100.0)}, -- spawn #43
    {coords = vector3(1620.0, 2100.0, -100.0)}, -- spawn #44
    {coords = vector3(1680.0, 2100.0, -100.0)}, -- spawn #45
    {coords = vector3(1740.0, 2100.0, -100.0)}, -- spawn #46
    {coords = vector3(1800.0, 2100.0, -100.0)}, -- spawn #47
    {coords = vector3(1860.0, 2100.0, -100.0)}, -- spawn #48
    {coords = vector3(1920.0, 2100.0, -100.0)}, -- spawn #49
    {coords = vector3(1980.0, 2100.0, -100.0)}, -- spawn #50
    {coords = vector3(2040.0, 2100.0, -100.0)}, -- spawn #51
    {coords = vector3(2100.0, 2100.0, -100.0)}, -- spawn #52
    {coords = vector3(2160.0, 2100.0, -100.0)}, -- spawn #53
    {coords = vector3(2220.0, 2100.0, -100.0)}, -- spawn #54
    {coords = vector3(2280.0, 2100.0, -100.0)}, -- spawn #55
    {coords = vector3(2340.0, 2100.0, -100.0)}, -- spawn #56
    {coords = vector3(2400.0, 2100.0, -100.0)}, -- spawn #57
    {coords = vector3(2460.0, 2100.0, -100.0)}, -- spawn #58
    {coords = vector3(2520.0, 2100.0, -100.0)}, -- spawn #59
    {coords = vector3(2580.0, 2100.0, -100.0)}, -- spawn #60
    {coords = vector3(2640.0, 2100.0, -100.0)}, -- spawn #61
    {coords = vector3(2700.0, 2100.0, -100.0)}, -- spawn #62
    {coords = vector3(2760.0, 2100.0, -100.0)}, -- spawn #63
    {coords = vector3(2820.0, 2100.0, -100.0)}, -- spawn #64
    {coords = vector3(2880.0, 2100.0, -100.0)}, -- spawn #65
    {coords = vector3(2940.0, 2100.0, -100.0)}, -- spawn #66
}

if Config.REA then
    Config.Houses = {}
end