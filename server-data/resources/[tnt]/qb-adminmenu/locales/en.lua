local Translations = {
    title = {
        main_menu = 'Admin Menu',
        admin_menu = 'Admin Options',
        server_menu = 'Manage Server',
        dev_menu = 'Developer Options',
        players_menu = 'Online Players'
    },
    main_options = {
        label1 = 'Admin Options',
        desc1 = 'A set of options which will only effect you',
        label2 = 'Player Management',
        desc2 = 'Manage your current online playerbase',
        label3 = 'Server Management',
        desc3 = 'Manage resources or server specific options',
        label4 = 'Vehicles',
        desc4 = 'All about vehicles here',
        label5 = 'Developer Options',
        desc5 = 'Options that are handy for a developer'
    },
    admin_options = {
        label1 = 'Noclip',
        desc1 = 'Go through walls as if you are a ghost 👻',
        label2 = 'Revive',
        desc2 = 'Get yourself back in action',
        label3 = 'Invisible',
        desc3 = 'Now you can\'t see me anymore',
        label4 = 'Godmode',
        desc4 = 'Strong muscles',
        label5 = 'Names',
        desc5 = 'See what the names are of players',
        label6 = 'Blips',
        desc6 = 'See the locations of all the players on the map',
        label7 = 'Vehicle Godmode',
        desc7 = 'Smash your vehicle without it being damaged or destroyed',
        label8 = 'Change Ped Model',
        desc8 = 'Change how you look',
        value8_1 = 'Change Ped',
        value8_2 = 'Reset Ped',
        input8label = 'Ped Model Name',
        input8placeholder = 'a_m_m_soucent_04',
        label9 = 'Infinite Ammo',
        desc9 = 'Gives you infinite ammo for the current gun you are holding',
        label10 = 'Give All',
        desc10 = 'Gives every weapon in that category',
        value10_1 = 'Pistols',
        value10_2 = 'Smg',
        value10_3 = 'Shotgun',
        value10_4 = 'Assualt',
        value10_5 = 'Lmg',
        value10_6 = 'Sniper',
        value10_7 = 'Heavy',
        label11 = 'Un/Cuff',
        desc11 = 'Cuff yourself or uncuff'
    },
    server_options = {
        label1 = 'Change Weather',
        desc1 = 'Changes the weather to whatever is currently highlighted',
        value1_1 = 'Extrasunny',
        value1_2 = 'Clear',
        value1_3 = 'Neutral',
        value1_4 = 'Smog',
        value1_5 = 'Foggy',
        value1_6 = 'Overcast',
        value1_7 = 'Clouds',
        value1_8 = 'Clearing',
        value1_9 = 'Rain',
        value1_10 = 'Thunder',
        value1_11 = 'Snow',
        value1_12 = 'Blizzard',
        value1_13 = 'Snowlight',
        value1_14 = 'Xmas',
        value1_15 = 'Halloween',
        label2 = 'Change Time',
        desc2 = 'Changes the time to the specified hour',
        label3 = 'Get Radio List',
        desc3 = 'Get a full list of players on the given radio frequency',
        input3label = 'Radio Frequency',
        label4 = 'Pull Stash',
        desc4 = 'Open a stash with the specified name',
        input4label = 'Stash Name'
    },
    dev_options = {
        label1 = 'Copy Vector 2',
        desc1 = 'Copy your current vector 2 coordinates to your clipboard',
        label2 = 'Copy Vector 3',
        desc2 = 'Copy your current vector 3 coordinates to your clipboard',
        label3 = 'Copy Vector 4',
        desc3 = 'Copy your current vector 4 coordinates to your clipboard',
        label4 = 'Copy Heading',
        desc4 = 'Copy your current heading coordinates to your clipboard',
        label5 = 'Display Coords',
        desc5 = 'Displays your current coordinates',
        label6 = 'Display Vehicle Info',
        desc6 = 'Displays all kinds of information about the vehicle you are sitting in',
    },
    player_options = {
        label1 = 'General Options',
        desc1 = 'The same options you would find under admin options, but these will affect the chosen player',
        label2 = 'Administration',
        desc2 = 'Kick | Ban | Permissions',
        label3 = 'Extra Options',
        desc3 = 'Some fun miscellaneous options',
        general = {
            labelkill = 'Kill',
            desckill = 'Kill the currently selected player',
            labelrevive = 'Revive',
            descrevive = 'Revive the currently selected player',
            labelfreeze = 'Freeze',
            descfreeze = 'Freeze the currently selected player',
            labelgoto = 'Go to',
            descgoto = 'Go to the currently selected player',
            labelbring = 'Bring',
            descbring = 'Bring the currently selected player',
            labelsitinveh = 'Sit in vehicle',
            descsitinveh = 'Sit in vehicle the currently selected player',
            labelrouting = 'Routingbucket',
            descrouting = 'Routingbucket the currently selected player',
        },
        administration = {
            labelkick = 'Kick',
            desckick = 'Yeet this player from the server',
            inputkick = 'Reason',
            labelban = 'Ban',
            descban = 'Perm yeet this player from the server',
            input1ban = 'Hours',
            input2ban = 'Days',
            input3ban = 'Months',
            banreason = 'Reason: %{reason}, until %{lenght}',
            labelperm = 'Permission',
            descperm = 'Change someone\'s permission level',
            permvalue1 = 'Remove',
            permvalue2 = 'Mod',
            permvalue3 = 'Admin',
            permvalue4 = 'God',
        },
        admin = {

        },
        extra = {

        },
    },
    success = {
        blips_activated = 'Blips activated',
        names_activated = 'Names activated',
    },
    error = {
        no_perms = 'You don\'t have permission to do this',
        blips_deactivated = 'Blips deactivated',
        names_deactivated = 'Names deactivated', 
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})