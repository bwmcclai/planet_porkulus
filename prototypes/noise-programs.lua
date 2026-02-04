-- Porkulus Noise Programs
-- Theme: Sub-Zero Industrial Tundra with Thermal Veins and Ammonia Seas

data:extend({
  -- 1. ELEVATION: Flat industrial barrens with sharp mesas
  {
    type = "noise-expression",
    name = "porkulus_elevation",
    intended_property = "elevation",
    expression = "(5 * sin(x / 100) * cos(y / 100))" ..                     -- Base rolling hills
                 " + (20 * basis_noise{x = x, y = y, seed0 = 123, seed1 = 1, input_scale = 1/400, output_scale = 1})" .. -- Macro landmasses
                 " + (10 * basis_noise{x = x, y = y, seed0 = 456, seed1 = 1, input_scale = 1/50, output_scale = 1})" -- Mesas/Cliffs
  },

  -- 2. MOISTURE: Frozen/Dry planet
  {
    type = "noise-expression",
    name = "porkulus_moisture",
    intended_property = "moisture",
    expression = "0.2 + (0.3 * basis_noise{x = x, y = y, seed0 = 789, seed1 = 1, input_scale = 1/100, output_scale = 1})"
  },

  -- 3. WATER: Ammonia Seas (Liquid Ammonia)
  {
    type = "noise-expression",
    name = "porkulus_water",
    intended_property = "water",
    -- Ammonia seas are in the lowest depressions
    expression = "-porkulus_elevation - 5" 
  },

  -- 4. TEMPERATURE (The Thermal Veins)
  -- Base temp is sub-zero (-23C). Veins are +50C relative to base.
  {
    type = "noise-expression",
    name = "porkulus_temperature",
    intended_property = "aux",
    expression = "250" .. -- Base 250K (-23C)
                 " + (max(0, 50 * (basis_noise{x = x, y = y, seed0 = 1011, seed1 = 1, input_scale = 1/80, output_scale = 1} - 0.7)))" -- Thermal Veins
  },

  -- 5. BASIS FIXES
  { type = "noise-expression", name = "moisture_basis", expression = "1.0" },
  { type = "noise-expression", name = "elevation_basis", expression = "0.5" }
})
