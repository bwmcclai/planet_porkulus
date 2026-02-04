# Porkulus Mod - Setup & Installation Guide

## Quick Start

### 1. Install the Mod

Copy the entire `porkulus` folder to your Factorio mods directory:

**Mac (your system):**
```bash
cp -r /Users/bmac/FACTORIO/Porkulus ~/Library/Application\ Support/factorio/mods/porkulus
```

**Windows:**
```
Copy to: %appdata%\Factorio\mods\porkulus
```

**Linux:**
```bash
cp -r porkulus ~/.factorio/mods/
```

### 2. Graphics Note

⚠️ **This mod uses placeholder graphics from base Factorio.**

All entities are currently using base game sprites (assembling machines, heat pipes, storage tanks, etc.). The game will NOT crash - everything will load correctly, just with placeholder graphics.

### 3. Start a New Game

1. Launch Factorio
2. Enable the "Porkulus - Industrial Tundra" mod in the Mods menu
3. Start a new Space Age game
4. Once you unlock space science, you'll be able to travel to Porkulus!
5. **Alternatively**: Use "Any Planet Start" and select Porkulus to start there immediately.

## Folder Structure

```
porkulus/
├── info.json               - Mod metadata and dependencies
├── data.lua                - Loads all prototypes
├── control.lua             - Runtime game logic (Heat/Disease)
├── README.md               - Full documentation
├── SETUP.md               - This file
├── locale/
│   └── en/
│       └── porkulus.cfg    - English translations
├── graphics/               - Graphics folder (using placeholders)
│   ├── icons/
│   ├── technology/
│   ├── entity/
│   └── terrain/
└── prototypes/             - All game definitions
    ├── planet.lua          - Planet definition
    ├── noise-programs.lua  - Map generation
    ├── porkulus.lua        - Core Porkulus entities & items
    └── ...                 - Supplemental definitions

```

## Testing the Mod

### In-Game Console Commands (for testing)

Press `~` to open the console, then use:

```lua
-- Unlock all Porkulus technologies
/c game.player.force.research_all_technologies()

-- Give yourself test items
/c game.player.insert{name="industrial-piggery", count=10}
/c game.player.insert{name="thermal-radiator", count=20}
/c game.player.insert{name="porkulus-pig", count=50}

-- Travel to Porkulus (if available)
/c game.player.teleport({0, 0}, "porkulus")
```

## Features to Test

1. **Thermal Regions**: Find Thermal Veins (warm spots) to start your base.
2. **Piggery Heat**: Build an Industrial Piggery and connect it to a heat source. Check status (FREEZING / OPTIMAL / OVERHEAT).
3. **Biological Sludge**: Find Sludge Pits and pump out organic matter.
4. **Gristle Mining**: Mine Gristle Crags for raw feeding material.
5. **Any Planet Start**: Verify the planet is selectable in the mod's startup menu.

## Known Limitations

### Graphics
- All icons and sprites are placeholders from base game
- Piggeries use Assembling Machine 3 sprites
- Radiators use Heat Pipe sprites
- Bio-Scanners use Storage Tank sprites

### Gameplay
- Swine Flu events are currently calculated but have internal-only effects (spoilage).
- Visual "Heat Haze" is partially implemented via planet atmospheric shaders.

---

**The mod is fully functional and ready for industrialization!** 🐷🏭
