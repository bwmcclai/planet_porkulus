-- Amazonia Fluids

data:extend({
  -- Raw latex fluid
  {
    type = "fluid",
    name = "raw-latex",
    icon = "__porkulus__/graphics/icons/raw-latex.png",
    icon_size = 64,
    default_temperature = 25,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {r = 0.9, g = 0.9, b = 0.8},
    flow_color = {r = 1.0, g = 1.0, b = 0.9},
    order = "a[fluid]-f[raw-latex]"
  },
  
  -- Oceanic brine
  {
    type = "fluid",
    name = "oceanic-brine",
    icon = "__porkulus__/graphics/icons/oceanic-brine.png",
    icon_size = 64,
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.3kJ",
    base_color = {r = 0.2, g = 0.4, b = 0.5},
    flow_color = {r = 0.3, g = 0.5, b = 0.6},
    order = "a[fluid]-g[oceanic-brine]"
  }
})
