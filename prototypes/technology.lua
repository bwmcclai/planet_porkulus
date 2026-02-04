-- Amazonia Technologies

data:extend({
  -- Amazonia exploration
  {
    type = "technology",
    name = "amazonia-exploration",
    icon = "__porkulus__/graphics/technology/amazonia-exploration.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "floating-crate"
      },
      {
        type = "unlock-recipe",
        recipe = "catch-net"
      }
    },
    prerequisites = {"space-science-pack"},
    unit = {
      count = 1000,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    order = "c-a"
  },
  
  -- Rubber processing
  {
    type = "technology",
    name = "rubber-processing",
    icon = "__porkulus__/graphics/technology/rubber-processing.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "siphon-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "rubber-from-latex"
      },
      {
        type = "unlock-recipe",
        recipe = "rubber-seals"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-transport-belt-rubber"
      }
    },
    prerequisites = {"amazonia-exploration", "advanced-oil-processing"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 45
    },
    order = "c-b"
  },
  
  -- Biological engineering
  {
    type = "technology",
    name = "biological-engineering",
    icon = "__porkulus__/graphics/technology/biological-engineering.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "nutrient-solution"
      },
      {
        type = "unlock-recipe",
        recipe = "biological-fertilizer"
      },
      -- {
      --   type = "unlock-recipe",
      --   recipe = "world-root-phase-1"
      -- }
    },
    prerequisites = {"rubber-processing"},
    unit = {
      count = 1500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    order = "c-c"
  },
  
  -- Biological launch system
  {
    type = "technology",
    name = "biological-launch",
    icon = "__porkulus__/graphics/technology/biological-launch.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "oceanic-brine"
      },
      {
        type = "unlock-recipe",
        recipe = "biological-launch"
      }
    },
    prerequisites = {"biological-engineering", "rocket-silo"},
    unit = {
      count = 3000,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    order = "c-d"
  }
})
