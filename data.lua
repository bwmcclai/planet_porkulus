-- Load all prototype definitions
require("prototypes.planet")
require("prototypes.noise-programs")
require("prototypes.porkulus")

-- require("prototypes.item")
-- require("prototypes.fluid")
-- require("prototypes.entity")
-- require("prototypes.recipe")
-- require("prototypes.technology")

-- Register with Any Planet Start (must be in data.lua, before data-updates)
if APS and APS.add_planet then
  APS.add_planet({
    name = "porkulus",
    filename = "__porkulus__/aps-compat"
    -- No technology needed - available from start
  })
end
