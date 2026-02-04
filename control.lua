-- Porkulus Control Script
-- Core Mechanics: Heat Requirement, Vaccine Loop, and Quality Tiering

local HEAT_FREEZING = 10
local HEAT_OPTIMAL_MIN = 18
local HEAT_OPTIMAL_MAX = 25
local HEAT_STRESS = 35

-- Handle planet initialization and player spawn
script.on_event(defines.events.on_player_created, function(event)
  local player = game.get_player(event.player_index)
  if not player then return end
  
  local surface = player.surface
  if surface.name ~= "porkulus" then return end
  
  -- Find a Thermal Vein to start near
  local veins = surface.find_entities_filtered{
    name = "porkulus-thermal-vein",
    limit = 10
  }
  
  if #veins > 0 then
    local start_vein = veins[math.random(#veins)]
    local spawn_pos = surface.find_non_colliding_position("character", start_vein.position, 50, 1)
    if spawn_pos then
      player.teleport(spawn_pos, surface)
      game.print("Welcome to Porkulus. The industrial heart of the galaxy. Stay near the Thermal Veins—it's cold out there.")
    end
  end
end)

-- Main logic loop: Run every 60 ticks (1 second)
script.on_nth_tick(60, function(event)
  for _, surface in pairs(game.surfaces) do
    if surface.name == "porkulus" then
      update_piggeries(surface)
      update_contamination(surface)
    end
  end
end)

-- Update status and efficiency of all Industrial Piggeries
function update_piggeries(surface)
  local piggeries = surface.find_entities_filtered{name = "industrial-piggery"}
  
  for _, entity in pairs(piggeries) do
    local current_temp = get_piggery_temperature(entity)
    
    -- logic for "Freezing"
    if current_temp < HEAT_FREEZING then
      entity.active = false
      if event and event.tick % 300 == 0 then
        surface.create_entity{name = "flying-text", position = entity.position, text = "FREEZING - PRODUCTION STOPPED", color = {r=0, g=0.5, b=1}}
      end
    -- logic for "Heat Stress"
    elseif current_temp > HEAT_STRESS then
      entity.active = true
      -- Reduce quality or increase spoilage (future implementation)
      if event and event.tick % 300 == 0 then
        surface.create_entity{name = "flying-text", position = entity.position, text = "HEAT STRESS - QUALITY DROPPING", color = {r=1, g=0.5, b=0}}
      end
    -- Optimal range
    else
      entity.active = true
    end
  end
end

-- Calculate effective temperature for a piggery
function get_piggery_temperature(entity)
  -- 1. Check if connected to heat pipes (entity.temperature)
  local heat = entity.temperature or 0
  
  -- 2. Check if on a thermal vein (ground heat)
  -- We'll assume veins provide a base 25C if nearby
  local veins = entity.surface.find_entities_filtered{
    name = "porkulus-thermal-vein",
    position = entity.position,
    radius = 10,
    limit = 1
  }
  
  local ground_heat = (#veins > 0) and 25 or -23 -- Base planet temp is -23C
  
  return math.max(heat, ground_heat)
end

-- Global contamination logic
function update_contamination(surface)
  if not storage.porkulus_contamination then storage.porkulus_contamination = 0 end
  
  local piggeries_count = surface.count_entities_filtered{name = "industrial-piggery"}
  
  -- Contamination increases with scale
  storage.porkulus_contamination = storage.porkulus_contamination + (piggeries_count * 0.01)
  
  -- Random Swine Flu outbreak risk
  if storage.porkulus_contamination > 50 and math.random() < (storage.porkulus_contamination / 10000) then
    trigger_outbreak(surface)
  end
  
  -- Contamination decays slowly if scrubbed (future implementation with vaccines)
end

function trigger_outbreak(surface)
  game.print("SWINE FLU OUTBREAK! Biosecurity compromised on Porkulus.")
  -- Logic to damage piggeries or destroy pig items on belts
  storage.porkulus_contamination = storage.porkulus_contamination / 2 -- Reset partially after outbreak
end

-- Initialize storage
script.on_init(function()
  storage.porkulus_contamination = 0
end)
