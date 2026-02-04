-- Porkulus Items and Entities

data:extend({
  -- === ITEMS ===
  
  -- The Pig (Base item for quality tiers)
  {
    type = "item",
    name = "porkulus-pig",
    icon = "__base__/graphics/icons/fish.png", -- Placeholder
    icon_size = 64,
    subgroup = "raw-material",
    order = "p[pig]",
    stack_size = 50,
    default_import_location = "porkulus"
  },

  -- Vaccine
  {
    type = "item",
    name = "porkulus-vaccine",
    icon = "__base__/graphics/icons/automation-science-pack.png", -- Placeholder
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "v[vaccine]",
    stack_size = 100
  },

  -- High-Grade Feed
  {
    type = "item",
    name = "porkulus-feed",
    icon = "__base__/graphics/icons/solid-fuel.png", -- Placeholder
    icon_size = 64,
    subgroup = "raw-material",
    order = "f[feed]",
    stack_size = 100
  },

  -- Slop (Processed Gristle)
  {
    type = "item",
    name = "porkulus-slop",
    icon = "__base__/graphics/icons/coal.png", -- Placeholder
    icon_size = 64,
    subgroup = "raw-material",
    order = "s[slop]",
    stack_size = 100
  },

  -- Gristle (Frozen Organic Matter)
  {
    type = "item",
    name = "porkulus-gristle",
    icon = "__base__/graphics/icons/stone.png", -- Placeholder
    icon_size = 64,
    subgroup = "raw-resource",
    order = "g[gristle]",
    stack_size = 100
  },

  -- === FLUIDS ===

  -- Organic Sludge
  {
    type = "fluid",
    name = "porkulus-sludge",
    icon = "__base__/graphics/icons/fluid/crude-oil.png", -- Placeholder
    icon_size = 64,
    default_temperature = 25,
    base_color = {r = 0.5, g = 0.3, b = 0.3}, -- Pinkish brown
    flow_color = {r = 0.7, g = 0.4, b = 0.4},
    order = "a[fluid]-s[sludge]"
  },

  -- === ENTITIES ===

  -- Industrial Piggery (5x5)
  {
    type = "assembling-machine",
    name = "industrial-piggery",
    icon = "__base__/graphics/icons/assembling-machine-3.png", -- Placeholder
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "industrial-piggery"},
    max_health = 1000,
    corpse = "big-remnants",
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -3.0}, {2.5, 2.5}},
    crafting_categories = {"piggery"},
    crafting_speed = 1.0,
    energy_source = {
      type = "heat",
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "2MW",
      pipe_connections = {
        {position = {0, -2.5}, direction = defines.direction.north},
        {position = {0, 2.5}, direction = defines.direction.south},
        {position = {-2.5, 0}, direction = defines.direction.west},
        {position = {2.5, 0}, direction = defines.direction.east},
      },
      production_allowed = true
    },
    energy_usage = "500kW",
    module_specification = {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "quality"},
    animation = {
        layers = {
            {
                filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
                priority = "high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                scale = 1.5 -- Make it look bigger (5x5 approx)
            }
        }
    },
    working_visualisations = {
        {
            effect = "flicker",
            animation = {
                filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-light.png",
                priority = "high",
                width = 108,
                height = 119,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(0, -0.5),
                draw_as_glow = true,
                scale = 1.5
            }
        }
    }
  },

  -- Thermal Radiator
  {
    type = "heat-pipe",
    name = "thermal-radiator",
    icon = "__base__/graphics/icons/heat-pipe.png", -- Placeholder
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "thermal-radiator"},
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    heat_buffer = {
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "1MW"
    },
    connection_sprites = data.raw["heat-pipe"]["heat-pipe"].connection_sprites,
    heat_picture = data.raw["heat-pipe"]["heat-pipe"].heat_picture
  },

  -- Bio-Scanner (Circuit-gate)
  -- For now, we'll use a modified selector or simple gate
  {
    type = "storage-tank", -- Simple container for now that circuit network can read
    name = "bio-scanner",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "bio-scanner"},
    max_health = 500,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box = {
      volume = 1000,
      pipe_connections = {}
    },
    two_direction_only = true,
    flow_length_in_ticks = 360,
    window_bounding_box = {{0, 0}, {0, 0}},
    pictures = {
        picture = {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            width = 110,
            height = 108,
            shift = util.by_pixel(0, 0),
            scale = 0.5
        }
    }
  }
})

-- Register Crafting Category
if not data.raw["item-group"]["porkulus"] then
    data:extend({
        {
            type = "item-group",
            name = "porkulus",
            order = "p",
            icon = "__base__/graphics/icons/fish.png", -- Placeholder
            icon_size = 64,
        },
        {
            type = "item-subgroup",
            name = "piggery",
            group = "porkulus",
            order = "a"
        }
    })
end

data:extend({
    {
        type = "recipe-category",
        name = "piggery"
    }
})

-- === BUILDING ITEMS ===
data:extend({
    {
        type = "item",
        name = "industrial-piggery",
        icon = "__base__/graphics/icons/assembling-machine-3.png",
        icon_size = 64,
        subgroup = "piggery",
        order = "a[piggery]",
        place_result = "industrial-piggery",
        stack_size = 10
    },
    {
        type = "item",
        name = "thermal-radiator",
        icon = "__base__/graphics/icons/heat-pipe.png",
        icon_size = 64,
        subgroup = "piggery",
        order = "b[radiator]",
        place_result = "thermal-radiator",
        stack_size = 50
    },
    {
        type = "item",
        name = "bio-scanner",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64,
        subgroup = "piggery",
        order = "c[scanner]",
        place_result = "bio-scanner",
        stack_size = 20
    }
})

-- === BUILDING RECIPES ===
data:extend({
    {
        type = "recipe",
        name = "industrial-piggery",
        enabled = false,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 20},
            {type = "item", name = "concrete", amount = 50},
            {type = "item", name = "electronic-circuit", amount = 20},
            {type = "item", name = "pipe", amount = 10}
        },
        results = {{type = "item", name = "industrial-piggery", amount = 1}}
    },
    {
        type = "recipe",
        name = "thermal-radiator",
        enabled = false,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 5},
            {type = "item", name = "copper-plate", amount = 10}
        },
        results = {{type = "item", name = "thermal-radiator", amount = 1}}
    },
    {
        type = "recipe",
        name = "bio-scanner",
        enabled = false,
        ingredients = {
            {type = "item", name = "electronic-circuit", amount = 10},
            {type = "item", name = "iron-plate", amount = 10}
        },
        results = {{type = "item", name = "bio-scanner", amount = 1}}
    }
})

-- === TECHNOLOGIES ===

data:extend({
  {
    type = "technology",
    name = "porkulus-industrialization",
    icon = "__porkulus__/graphics/icons/porkulus-planet.png",
    icon_size = 256,
    effects = {
      { type = "unlock-recipe", recipe = "industrial-piggery" },
      { type = "unlock-recipe", recipe = "thermal-radiator" },
      { type = "unlock-recipe", recipe = "bio-scanner" }
    },
    prerequisites = {"steel-processing", "space-science-pack"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30
    },
    order = "p-a"
  }
})

-- Add autoplace controls
data:extend({
    { type = "autoplace-control", name = "thermal-veins", richness = true, order = "b-e", category = "resource" },
    { type = "autoplace-control", name = "sludge-pits", richness = true, order = "b-f", category = "resource" },
    { type = "autoplace-control", name = "gristle-crags", richness = true, order = "b-g", category = "resource" },
})

-- === RESOURCES ===

data:extend({
  -- Thermal Veins (Natural heat source)
  -- In this design, we'll treat them as a 'generator' or 'heat source' entity that can be built on
  -- OR a resource that can be 'mined' for heat?
  -- Let's stick to the user's "Areas of the map that provide natural ground heat"
  -- We'll implement this by checking tile properties in control.lua
  -- But we need a decorative/resource to mark them.
  {
    type = "resource",
    name = "porkulus-thermal-vein",
    icon = "__base__/graphics/icons/fluid/steam.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    category = "basic-solid",
    order = "a-b-a",
    infinite = true,
    highlight = true,
    minimum = 1000,
    normal = 1000,
    infinite_depletion_amount = 0,
    resource_patch_search_radius = 12,
    minable = {
      mining_time = 1,
      result = "stone", -- Can't really mine heat, just for marker
    },
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    autoplace = {
        control = "thermal-veins",
        sharpness = 1,
        max_probability = 0.3,
        richness_base = 100,
        richness_multiplier = 1.0,
        probability_expression = "max(0, (basis_noise{x = x, y = y, seed0 = 1011, seed1 = 1, input_scale = 1/80, output_scale = 1} - 0.7) * 10)",
    },
    stage_counts = {1},
    stages = {
      sheet = {
        filename = "__base__/graphics/entity/geyser/geyser.png",
        width = 128,
        height = 128,
        frame_count = 1,
        variation_count = 1,
        tint = {r = 1, g = 0.5, b = 0.5} -- Pinkish glow
      }
    },
    map_color = {r = 1, g = 0.5, b = 0.5}
  },

  -- Organic Sludge Pits
  {
    type = "resource",
    name = "porkulus-sludge-pit",
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order = "a-b-b",
    infinite = true,
    highlight = true,
    minimum = 50000,
    normal = 300000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    minable = {
      mining_time = 1,
      results = {{type = "fluid", name = "porkulus-sludge", amount_min = 10, amount_max = 10, probability = 1}},
    },
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    autoplace = {
        control = "sludge-pits",
        sharpness = 1,
        max_probability = 0.1,
        richness_base = 10000,
        richness_multiplier = 1.0,
        probability_expression = "max(0, (basis_noise{x = x, y = y, seed0 = 2022, seed1 = 1, input_scale = 1/150, output_scale = 1} - 0.85) * 5)",
    },
    stage_counts = {0},
    stages = {
      sheet = {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        width = 148,
        height = 120,
        frame_count = 1,
        variation_count = 1,
        tint = {r = 0.8, g = 0.4, b = 0.4} -- Pinkish brown
      }
    },
    map_color = {r = 0.8, g = 0.4, b = 0.4}
  },

  -- Gristle Crags (Frozen Organic Matter)
  {
    type = "resource",
    name = "porkulus-gristle-crag",
    icon = "__base__/graphics/icons/stone.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    category = "basic-solid",
    order = "a-b-c",
    infinite = false,
    highlight = true,
    minable = {
      mining_time = 1,
      result = "porkulus-gristle",
    },
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    autoplace = {
        control = "gristle-crags",
        sharpness = 1,
        max_probability = 0.2,
        richness_base = 500,
        richness_multiplier = 1.0,
        probability_expression = "max(0, (basis_noise{x = x, y = y, seed0 = 3033, seed1 = 1, input_scale = 1/100, output_scale = 1} - 0.8) * 8)",
    },
    stage_counts = {1},
    stages = {
      sheet = {
        filename = "__base__/graphics/entity/stone/stone.png",
        width = 64,
        height = 64,
        frame_count = 1,
        variation_count = 1,
        tint = {r = 0.9, g = 0.6, b = 0.6} -- Fleshy stone
      }
    },
    map_color = {r = 0.9, g = 0.6, b = 0.6}
  }
})

-- Add autoplace controls
data:extend({
    { type = "autoplace-control", name = "thermal-veins", richness = true, order = "b-e", category = "resource" },
    { type = "autoplace-control", name = "sludge-pits", richness = true, order = "b-f", category = "resource" },
    { type = "autoplace-control", name = "gristle-crags", richness = true, order = "b-g", category = "resource" },
})
