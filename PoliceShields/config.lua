main = {
    commandName = "shield",
    commandChatSuggestion = "Use a police shield",
    parameterType = "Shield Type", -- Use this to change to a different language
    acePermissionsEnabled = true, --If true, this enables ace permissions
    enableDeveloperCommand = true, -- Toggle the developer command (/shieldposition) which can assist in positioning the shields
    networkedWhenDeveloping = true, -- Toggle whether the shield is synced to other players when using the shieldposition command
    developerBoneIndex = 24818, -- The bone index to attach the shield to when using the shield position command
    developerCollision = true, -- Whether collision should be enabled when using the shield position command
    offSetMovement = 0.009,
    rotationMovement = 0.7,
    developerAnimDict = "combat@combat_reactions@pistol_1h_hillbilly",
    developerAnimName = "180",
}

translations = {
    noArguments = "~r~Error~w~: You must specify the shield type",
    invalidShieldType = "~r~Error~w~: You must specify the shield type",
    outsideVehicle = "~r~Error~w~: You must be outside a vehicle",
    shieldRemoved = "~g~Success~w~: Shield removed",
    invalidShieldModel = "Invalid Shield Model - Usage /shieldposition [model]",
}

-- Shield Names must be one word for command usage
-- eg /shield ballistic

shields = {
    {
        name = "Firearms",
        model = `bv_shield1`,
        offSet = {-0.081, 0.432, 0.0},
        rotation = {0.7, 0.0, 180.6},
        boneIndex = -1,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "CTSFO",
        model = `bv_shield2`,
        offSet = {0.0, 0.387, 0.0},
        rotation = {0.0, 0.0, 185.5},
        boneIndex = -1,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "Small",
        model = `bv_shield3`,
        offSet = {0.0, 0.288, 0.0},
        rotation = {0.0, 0.0, 163.1},
        boneIndex = -1,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "Long",
        model = `bv_shield4`,
        offSet = {0.045, 0.405, -0.108},
        rotation = {0.7, -0.7, 171.5},
        boneIndex = -1,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "CTSFO2",
        model = `prop_shield_one`,
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "Firearms2",
        model = `prop_shield_two`,
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "Long2",
        model = `prop_shield_three`,
        offSet = {-1.2, 0.31, -0.05},
        rotation = {1.0, 74.39, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "Short2",
        model = `prop_shield_four`,
        offSet = {-0.68, 0.22, 0.15},
        rotation = {0.52, 79.28, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
}