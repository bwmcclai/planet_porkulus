-- Porkulus Planet Definition

data:extend({
  {
    type = "planet",
    name = "porkulus",
    icon = "__porkulus__/graphics/icons/porkulus-planet.png",
    icon_size = 256,
    starmap_icon = "__porkulus__/graphics/icons/porkulus-starmap.png",
    starmap_icon_size = 512,
    gravity_pull = 12, -- Slightly heavier than Earth/Amazonia
    distance = 25,     -- Further out, colder
    orientation = 0.45,
    magnitude = 1.2,
    order = "d[porkulus]",
    subgroup = "planets",
    
    -- Planet properties
    map_gen_settings = {
      property_expression_names = {
        ["elevation"] = "porkulus_elevation",
        ["moisture"] = "porkulus_moisture",
        ["water"] = "porkulus_water",
        ["aux"] = "porkulus_temperature", -- Custom climate (aux) for thermal veins
        
        ["moisture_basis"] = "moisture_basis",
        ["elevation_basis"] = "elevation_basis",
        
        -- Control settings
        ["control-setting:moisture:frequency:multiplier"] = 1.0,
        ["control-setting:moisture:bias"] = -0.2, -- Dryer, frozen
        ["control-setting:aux:frequency:multiplier"] = 1.0,
        ["control-setting:aux:bias"] = 0.0,
        
        -- Industrial Piggery needs
        ["control-setting:trees:frequency:multiplier"] = 0.5, -- Sparse frozen trees
        ["control-setting:trees:bias"] = -1.0,
        
        -- NO ENEMIES (as requested)
        ["control-setting:enemy-base:frequency:multiplier"] = 0,
        ["control-setting:enemy-base:size:multiplier"] = 0,
      },
      
      terrain_segmentation = 4.0,
      water = 2.0, -- Ammonia Seas
      
      starting_area = 1.0,
      peaceful_mode = true,
      
      autoplace_controls = {
        ["trees"] = {},
        ["thermal-veins"] = {},
        ["sludge-pits"] = {},
        ["gristle-crags"] = {},
      },
      autoplace_settings = {
        ["decorative"] = {
          settings = {
            ["small-rock"] = {}, 
            ["tiny-rock"] = {},
          }
        },
        ["entity"] = {
          settings = {
            -- Minimal frozen flora
            ["tree-08"] = {}, -- Sparse frozen trees
            ["tree-09"] = {},
          }
        },
        ["tile"] = {
          settings = {
            -- SLATE GREY & PINKISH "BIOLOGICAL FROST"
            ["volcanic-ash-light"] = {}, -- Slate grey ash
            ["volcanic-ash-dark"] = {},
            ["lowland-pale-dirt"] = {},  -- Pinkish hue from Gleba
            ["snow-flat"] = {},         -- Snow cover
            ["snow-lumpy"] = {},
            ["water"] = {},             -- Will represent Ammonia Seas
            ["deepwater"] = {},
          }
        }
      },
      cliff_settings = {
        name = "cliff-vulcanus", -- Sharp industrial cliffs
        cliff_elevation_0 = 10,
        cliff_elevation_interval = 20,
        richness = 1.0
      }
    },
    
    -- Surface properties
    surface_properties = {
      ["solar-power"] = 15,    -- Very low solar
      ["pressure"] = 1200,     -- Dense industrial atmosphere
      ["gravity"] = 12,
      ["magnetic-field"] = 50,
    },
    
    -- Pollutant properties
    pollutant_type = "pollution", -- Swine flu/contamination handled elsewhere
    
    -- Atmosphere
    asteroid_spawn_influence = 0.5,
    asteroid_spawn_definitions = {},
    
    -- Make planet available as starting location
    auto_save_on_first_trip = true,
    
    -- Visual atmosphere
    draw_orbit = true,
    label_orientation = 0.45,
    
    -- Lighting / Atmosphere shader colors
    surface_render_parameters = {
        fog_color = {0.2, 0.15, 0.2, 0.5}, -- Pinkish/Purple frost haze
        shadow_intensity = 0.8,
        brightness_visual_weight = 0.6,
        day_night_cycle_color_lookup = {
            {0.0, "1A1A26"}, -- Cold night (dark blue-grey)
            {0.5, "CCB2BF"}, -- Muted pinkish day
            {1.0, "1A1A26"}
        }
    },
    
    solar_power_in_space = 20,
  },
  
  -- Space location definition removed (merged or duplicates planet type in this context)
})
