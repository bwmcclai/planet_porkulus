-- Amazonia Recipes

data:extend({
  -- Process raw latex into rubber
  {
    type = "recipe",
    name = "rubber-from-latex",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "raw-latex", amount = 50},
      {type = "item", name = "sulfur", amount = 1}
    },
    results = {
      {type = "item", name = "rubber", amount = 10}
    },
    icon = "__porkulus__/graphics/icons/rubber.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[rubber]"
  },
  
  -- Floating crate recipe
  {
    type = "recipe",
    name = "floating-crate",
    enabled = false,
    energy_required = 2,
    ingredients = {
      {type = "item", name = "wood", amount = 10},
      {type = "item", name = "iron-plate", amount = 5}
    },
    results = {{type = "item", name = "floating-crate", amount = 1}}
  },
  
  -- Catch-net recipe
  {
    type = "recipe",
    name = "catch-net",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 20},
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "iron-gear-wheel", amount = 10}
    },
    results = {{type = "item", name = "catch-net", amount = 1}}
  },
  
  -- Siphon pump recipe
  {
    type = "recipe",
    name = "siphon-pump",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type = "item", name = "steel-plate", amount = 20},
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "iron-gear-wheel", amount = 15},
      {type = "item", name = "pipe", amount = 10}
    },
    results = {{type = "item", name = "siphon-pump", amount = 1}}
  },
  
  -- Rubber seals
  {
    type = "recipe",
    name = "rubber-seals",
    enabled = false,
    category = "crafting",
    energy_required = 3,
    ingredients = {
      {type = "item", name = "rubber", amount = 5},
      {type = "item", name = "plastic-bar", amount = 2}
    },
    results = {{type = "item", name = "rubber-seals", amount = 10}}
  },
  
  -- Advanced transport belt with rubber
  {
    type = "recipe",
    name = "fast-transport-belt-rubber",
    enabled = false,
    category = "crafting",
    energy_required = 2,
    ingredients = {
      {type = "item", name = "transport-belt", amount = 1},
      {type = "item", name = "rubber", amount = 5},
      {type = "item", name = "iron-gear-wheel", amount = 5}
    },
    results = {{type = "item", name = "fast-transport-belt", amount = 1}}
  },
  
  -- Nutrient solution
  {
    type = "recipe",
    name = "nutrient-solution",
    enabled = false,
    category = "chemistry",
    energy_required = 5,
    ingredients = {
      {type = "item", name = "wood", amount = 10},
      {type = "fluid", name = "water", amount = 50}
    },
    results = {{type = "item", name = "nutrient-solution", amount = 5}}
  },
  
  -- Biological fertilizer
  {
    type = "recipe",
    name = "biological-fertilizer",
    enabled = false,
    category = "crafting-with-fluid",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "coal", amount = 5},
      {type = "item", name = "iron-ore", amount = 5},
      {type = "fluid", name = "water", amount = 100}
    },
    results = {{type = "item", name = "biological-fertilizer", amount = 10}}
  },
  
  -- World-Root Phase 1 removed
  
  -- Oceanic brine extraction (offshore pump variant - manual recipe for demo)
  {
    type = "recipe",
    name = "oceanic-brine",
    enabled = false,
    category = "chemistry",
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "water", amount = 100}
    },
    results = {{type = "fluid", name = "oceanic-brine", amount = 50}}
  },
  
  -- Biological Launch (the megaproject reward)
  {
    type = "recipe",
    name = "biological-launch",
    enabled = false,
    category = "crafting-with-fluid",
    energy_required = 30,
    ingredients = {
      {type = "item", name = "satellite", amount = 1},
      {type = "fluid", name = "oceanic-brine", amount = 500},
      {type = "item", name = "rubber-seals", amount = 100}
    },
    results = {},  -- Items sent to orbit
    icon = "__base__/graphics/icons/satellite.png",
    icon_size = 64,
    subgroup = "space-related",
    order = "m[rocket-part]-c[biological-launch]"
  }
})
