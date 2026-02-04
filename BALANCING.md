# Amazonia - Balance & Tuning Guide

This document explains all the configurable values in the mod for balancing.

## Map Generation

**File**: `prototypes/noise-programs.lua`

```lua
-- Map size assumption (affects gradient)
local map_size = 2000  // Default: 2000 tiles

-- Western elevation (highlands)
local base_elevation_west = 50  // Default: 50

-- Eastern elevation drop
local elevation_drop = 60  // Default: 60 (results in -10 at Eastern edge)

-- Elevation variation
local variation_amount = 10  // Default: 10

-- River width
local base_river_width = 0.02  // Default: 0.02
local river_width_scaling = 0.03  // Default: 0.03 (wider in East)

-- Tree density in Western jungle
local tree_density_base = 0.3  // Default: 0.3 (30% coverage)
```

## River Drifting

**File**: `control.lua`

```lua
-- Floating crate update frequency
script.on_nth_tick(5)  // Default: 5 ticks
// Lower = faster checks, higher UPS cost
// Recommended range: 5-15

-- Drift speed
local drift_speed = 0.1  // Default: 0.1 tiles per check
// At 5 ticks = ~360 tiles per minute
```

## Catch-Net Mechanics

**File**: `control.lua`

```lua
-- Catch-net update frequency
script.on_nth_tick(60)  // Default: 60 ticks (1 second)
// Lower = more responsive, higher UPS cost
// Recommended range: 30-120

-- Search radius
local search_area = {
  {position.x - 3, position.y - 3},
  {position.x + 3, position.y + 3}
}
// Default: 3x3 area around catch-net
// Larger = more area covered, higher UPS cost
```

## Overgrowth System

**File**: `control.lua`

```lua
-- Overgrowth update frequency
script.on_nth_tick(1200)  // Default: 1200 ticks (20 seconds)
// Lower = more aggressive, higher UPS cost
// Recommended range: 600-3600

-- Damage per tick
entity.damage(5, "player", "physical")  // Default: 5
// Affects how quickly unprotected buildings decay
// Recommended range: 1-10

-- Entities processed per tick (UPS optimization)
limit = 10  // Default: 10
// Lower = less UPS impact, slower overgrowth
// Recommended range: 5-50

-- Vine spawn radius
local vine_pos = {
  x = position.x + math.random(-2, 2),
  y = position.y + math.random(-2, 2)
}
// Default: ±2 tiles
// Larger = more spread out vines
```

## Resources

**File**: `prototypes/entity.lua`

### Ancient Hevea Trees
```lua
minimum = 5000,     // Minimum yield
normal = 10000,     // Normal yield
// Higher = longer-lasting resources

mining_time = 1,    // Can't mine directly (use siphon pump)
resource_patch_search_radius = 12,  // Patch clustering
```

## Recipes

**File**: `prototypes/recipe.lua`

### Rubber from Latex
```lua
energy_required = 5,
ingredients = {
  {type = "fluid", name = "raw-latex", amount = 50},
  {type = "item", name = "sulfur", amount = 1}
},
results = {
  {type = "item", name = "rubber", amount = 10}
}
// 50 latex + 1 sulfur = 10 rubber in 5 seconds
// Ratio: 5:1 latex to rubber
```

### Rubber Seals
```lua
energy_required = 3,
ingredients = {
  {type = "item", name = "rubber", amount = 5},
  {type = "item", name = "plastic-bar", amount = 2}
},
results = {
  {type = "item", name = "rubber-seals", amount = 10}
}
// 5 rubber + 2 plastic = 10 seals in 3 seconds
```

### World-Root Phase 1
```lua
energy_required = 60,  // 1 minute to build
ingredients = {
  {type = "item", name = "nutrient-solution", amount = 50},
  {type = "item", name = "biological-fertilizer", amount = 50},
  {type = "item", name = "steel-plate", amount = 100}
}
// Megaproject scale - adjust for difficulty
```

### Biological Launch
```lua
energy_required = 30,
ingredients = {
  {type = "item", name = "satellite", amount = 1},
  {type = "fluid", name = "oceanic-brine", amount = 500},
  {type = "item", name = "rubber-seals", amount = 100}
}
// Alternative to rocket launch
// Same satellite requirement, different materials
```

## Technologies

**File**: `prototypes/technology.lua`

### Research Costs

```lua
-- Amazonia Exploration
count = 1000,
ingredients = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1}
},
time = 60

-- Rubber Processing
count = 500,
time = 45

-- Biological Engineering
count = 1500,
time = 60

-- Biological Launch
count = 3000,
time = 60
```

Adjust `count` for difficulty:
- Lower = faster unlock
- Higher = longer progression

## Buildings

**File**: `prototypes/entity.lua`

### Floating Crate
```lua
inventory_size = 16,  // Default: 16 slots
max_health = 150,
// Adjust inventory for capacity vs. spam balance
```

### Catch-Net
```lua
crafting_speed = 0.5,  // Not used for catching
max_health = 300,
// Mostly decorative values
```

### Siphon Pump
```lua
energy_usage = "90kW",  // Power consumption
mining_speed = 1,       // Extraction rate
module_slots = 2,       // Upgrade potential
```

### World-Root
```lua
energy_usage = "1MW",   // Massive power requirement
crafting_speed = 2,     // Production speed
module_slots = 4,       // High upgrade potential
```

## Planet Properties

**File**: `prototypes/planet.lua`

```lua
gravity_pull = 9,       // Affects movement, 10 = Earth
distance = 15,          // Starmap distance
solar_power = 80,       // Solar panel efficiency (%)
pressure = 150,         // Atmospheric pressure
gravity = 9,            // Surface gravity
magnetic_field = 75,    // Magnetic field strength (%)
```

## Recommended Balance Changes

### For Easier Gameplay:
- Increase rubber output (10 → 15 per recipe)
- Reduce research costs by 50%
- Reduce overgrowth damage (5 → 2)
- Increase overgrowth interval (1200 → 2400 ticks)

### For Harder Gameplay:
- Decrease rubber output (10 → 6)
- Increase research costs by 2x
- Increase overgrowth damage (5 → 10)
- Decrease overgrowth interval (1200 → 600 ticks)
- Add concrete requirement to recipes

### For Better UPS:
- Increase on_nth_tick intervals (all by 2x-3x)
- Reduce entity process limits
- Remove overgrowth system entirely (comment out)
- Reduce catch-net search radius

## Testing Commands

```lua
-- Give all tech
/c game.player.force.research_all_technologies()

-- Give test items
/c game.player.insert{name="rubber", count=1000}
/c game.player.insert{name="floating-crate", count=100}

-- Teleport to Amazonia
/c game.player.teleport({0, 0}, "amazonia")

-- Check UPS impact
/c game.print(game.forces.player.item_production_statistics.get_input_count("rubber"))
```

## Performance Profiling

Monitor in-game with F4 menu:
- Show FPS/UPS
- Show entity counts
- Show time usage

Target: 60 UPS with 1000+ floating crates

---

These values have been chosen for balanced gameplay. Adjust based on your playtesting!
