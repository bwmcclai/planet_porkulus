-- Amazonia Items

data:extend({
  -- Rubber item
  {
    type = "item",
    name = "rubber",
    icon = "__porkulus__/graphics/icons/rubber.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[rubber]",
    stack_size = 100
  },
  
  -- Floating crate item
  {
    type = "item",
    name = "floating-crate",
    icon = "__porkulus__/graphics/icons/floating-crate.png",
    icon_size = 64,
    subgroup = "storage",
    order = "a[items]-c[floating-crate]",
    place_result = "floating-crate",
    stack_size = 10
  },
  
  -- Catch-net building
  {
    type = "item",
    name = "catch-net",
    icon = "__porkulus__/graphics/icons/catch-net.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "d[catch-net]",
    place_result = "catch-net",
    stack_size = 20
  },
  
  -- Siphon pump
  {
    type = "item",
    name = "siphon-pump",
    icon = "__porkulus__/graphics/icons/siphon-pump.png",
    icon_size = 64,
    subgroup = "extraction-machine",
    order = "c[siphon-pump]",
    place_result = "siphon-pump",
    stack_size = 20
  },
  
  -- World-Root removed
  
  -- Nutrient solution
  {
    type = "item",
    name = "nutrient-solution",
    icon = "__porkulus__/graphics/icons/nutrient-solution.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[nutrient-solution]",
    stack_size = 50
  },
  
  -- Biological fertilizer
  {
    type = "item",
    name = "biological-fertilizer",
    icon = "__porkulus__/graphics/icons/biological-fertilizer.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[biological-fertilizer]",
    stack_size = 50
  },
  
  -- Rubber seals
  {
    type = "item",
    name = "rubber-seals",
    icon = "__porkulus__/graphics/icons/rubber-seals.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[rubber-seals]",
    stack_size = 100
  }
})
