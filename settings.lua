-- Register Porkulus with "Any Planet Start" mod if it's installed
log("Porkulus settings.lua: Checking for APS...")
if APS and APS.add_choice then
  log("Adding porkulus to APS dropdown choices...")
  APS.add_choice("porkulus")
  log("Porkulus added to dropdown!")
end
