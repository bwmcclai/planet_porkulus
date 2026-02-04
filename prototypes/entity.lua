-- Amazonia Entities

-- Helper function to create empty sprite
local function empty_sprite()
  return {
    filename = "__core__/graphics/empty.png",
    width = 1,
    height = 1,
    priority = "extra-high"
  }
end

local function empty_animation()
  return {
    filename = "__core__/graphics/empty.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    priority = "extra-high"
  }
end

data:extend({
  -- Ancient Hevea Tree (Resource)
  {
    type = "resource",
    name = "ancient-hevea-tree",
    icon = "__porkulus__/graphics/icons/ancient-hevea-tree.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    category = "basic-solid",
    order = "a-b-a",
    infinite = false,
    highlight = true,
    minimum = 5000,
    normal = 10000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    minable = {
      mining_time = 1,
      result = "wood",
      required_fluid = "none"
    },
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    stage_counts = {1},
    stages = {
      sheet = {
        filename = "__base__/graphics/entity/tree/tree-08.png",
        width = 150,
        height = 150,
        frame_count = 1,
        variation_count = 1
      }
    },
    map_color = {0.2, 0.6, 0.2},
    map_grid = false
  },
  
  -- Floating Crate
  {
    type = "container",
    name = "floating-crate",
    icon = "__porkulus__/graphics/icons/floating-crate.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "floating-crate"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 16,
    picture = {
      layers = {
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest.png",
          priority = "extra-high",
          width = 62,
          height = 72,
          shift = util.by_pixel(0.5, -2),
          hr_version = {
            filename = "__base__/graphics/entity/wooden-chest/hr-wooden-chest.png",
            priority = "extra-high",
            width = 126,
            height = 146,
            shift = util.by_pixel(0.5, -2),
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  
  -- Catch-Net
  {
    type = "assembling-machine",
    name = "catch-net",
    icon = "__porkulus__/graphics/icons/catch-net.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "catch-net"},
    max_health = 300,
    corpse = "big-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    crafting_categories = {"crafting"},
    crafting_speed = 0.5,
    energy_source = {
      type = "void"
    },
    energy_usage = "1W",
    ingredient_count = 1,
    animation = {
      layers = {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority = "high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version = {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority = "high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations = {},
    fluid_boxes = {},
    module_specification = {
      module_slots = 0
    },
    allowed_effects = {}
  },
  
  -- Siphon Pump
  {
    type = "mining-drill",
    name = "siphon-pump",
    icon = "__porkulus__/graphics/icons/siphon-pump.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "siphon-pump"},
    max_health = 200,
    resource_categories = {"basic-solid"},
    corpse = "big-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source = {
      type = "electric",
      emissions_per_minute = 10,
      usage_priority = "secondary-input"
    },
    energy_usage = "90kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_specification = {
      module_slots = 2
    },
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r = 78, g = 173, b = 255},
    base_picture = {
      sheets = {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
          width = 114,
          height = 113,
          shift = util.by_pixel(6, -6),
          hr_version = {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
            priority = "extra-high",
            width = 228,
            height = 226,
            shift = util.by_pixel(6, -6),
            scale = 0.5
          }
        }
      }
    },
    animations = {
      north = {
        layers = {
          {
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
            priority = "extra-high",
            width = 56,
            height = 100,
            line_length = 8,
            frame_count = 40,
            shift = util.by_pixel(-4, -24),
            hr_version = {
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead.png",
              priority = "extra-high",
              width = 110,
              height = 201,
              line_length = 8,
              frame_count = 40,
              shift = util.by_pixel(-4, -24.25),
              scale = 0.5
            }
          }
        }
      }
    },
    output_fluid_box = {
      volume = 1000,
      base_level = 1,
      pipe_connections = {
        {
          positions = {{-2, 0}, {2, 0}, {0, -2}, {0, 2}}
        }
      }
    }
  },
  
  -- World-Root removed for now to fix bounding box errors
  
  -- Creeping Vine (decoration that damages buildings)
  {
    type = "simple-entity",
    name = "creeping-vine",
    icon = "__porkulus__/graphics/icons/creeping-vine.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-off-grid"},
    minable = {mining_time = 0.5, result = "wood", count = 2},
    max_health = 50,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    render_layer = "object",
    picture = {
      filename = "__base__/graphics/entity/tree/tree-02.png",
      width = 150,
      height = 150,
      shift = util.by_pixel(0, -20),
      scale = 0.3
    }
  }
})
