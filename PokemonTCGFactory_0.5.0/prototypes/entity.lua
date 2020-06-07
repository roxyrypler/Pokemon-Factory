data:extend({
    {
        type = "item",
        name = "Paper",
        icon = "__PokemonTCGFactory__/graphics/icons/paper.png",
        icon_size = 64,
        subgroup = "cards",
        flags = {"goes-to-quickbar"},
        stack_size = 999,
    },
    {
        type = "item",
        name = "Ink",
        icon = "__PokemonTCGFactory__/graphics/icons/Ink.png",
        icon_size = 64,
        subgroup = "cards",
        flags = {"goes-to-quickbar"},
        stack_size = 999,
    },
    {
        type = "item",
        name = "Pokemon-Card",
        icon = "__PokemonTCGFactory__/graphics/icons/PokemonCard.png",
        icon_size = 64,
        subgroup = "cards",
        flags = {"goes-to-quickbar"},
        stack_size = 999,
    },
    {
        type = "item",
        name = "Pokemon-Booster-Pack",
        icon = "__PokemonTCGFactory__/graphics/icons/BoosterPack.png",
        icon_size = 64,
        subgroup = "cards",
        flags = {"goes-to-quickbar"},
        stack_size = 999,
    },
    {
        type = "item",
        name = "Pokemon-Booster-Box",
        icon = "__PokemonTCGFactory__/graphics/icons/BoosterBox.png",
        icon_size = 64,
        subgroup = "cards",
        flags = {"goes-to-quickbar"},
        stack_size = 999,
    },
    {
        type = "assembling-machine",
        name = "printer",
        icon = "__PokemonTCGFactory__/graphics/icons/Printer.png",
        icon_size = 32,
        subgroup = "cards",
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "printer"},
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        max_health = 250,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        fast_replaceable_group = "printer",
        crafting_categories = {"printer"},
        crafting_speed = 0.75,
        energy_source =
        {
        type = "electric",
        usage_priority = "secondary-input",
        },
        energy_usage = "100kW", --"25kW",
        resistances =
        {
        {
            type = "fire",
            percent = 70
        }
        },
        module_specification =
        {
            module_slots = 0
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        animation =
        {
        filename = "__PokemonTCGFactory__/graphics/entity/PrinterPlaceable.png",
        width = 113,
        height = 91,
        frame_count = 1,
        shift = {0.2, 0.15}
        },
        working_visualisations =
        {
        {
            light = {intensity = 1, size = 6},
            animation =
            {
            filename = "__PokemonTCGFactory__/graphics/entity/PrinterPlaceable.png",
            width = 113,
            height = 91,
            frame_count = 1,
            shift = {0.2, 0.15}
            }
        }
        },
        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    }
})