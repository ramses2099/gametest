local Colors = {
    -- Basic Colors
  WHITE = {1, 1, 1, 1},
  BLACK = {0, 0, 0, 1},
  RED = {1, 0, 0, 1},
  GREEN = {0, 1, 0, 1},
  BLUE = {0, 0, 1, 1},
  YELLOW = {1, 1, 0, 1},
  CYAN = {0, 1, 1, 1},
  MAGENTA = {1, 0, 1, 1},

  -- Extended Basic Colors
  GRAY = {0.5, 0.5, 0.5, 1},
  LIGHT_GRAY = {0.75, 0.75, 0.75, 1},
  DARK_GRAY = {0.25, 0.25, 0.25, 1},
  SILVER = {0.75, 0.75, 0.75, 1},

  -- Red Variants
  DARK_RED = {0.55, 0, 0, 1},
  LIGHT_RED = {1, 0.7, 0.7, 1},
  CRIMSON = {0.86, 0.08, 0.24, 1},
  MAROON = {0.5, 0, 0, 1},
  PINK = {1, 0.75, 0.8, 1},
  HOT_PINK = {1, 0.41, 0.71, 1},
  DEEP_PINK = {1, 0.08, 0.58, 1},
  ROSE = {1, 0, 0.5, 1},

  -- Green Variants
  DARK_GREEN = {0, 0.39, 0, 1},
  LIGHT_GREEN = {0.56, 0.93, 0.56, 1},
  LIME = {0, 1, 0, 1},
  LIME_GREEN = {0.2, 0.8, 0.2, 1},
  FOREST_GREEN = {0.13, 0.55, 0.13, 1},
  OLIVE = {0.5, 0.5, 0, 1},
  MINT = {0.6, 1, 0.6, 1},
  SPRING_GREEN = {0, 1, 0.5, 1},

  -- Blue Variants
  DARK_BLUE = {0, 0, 0.55, 1},
  LIGHT_BLUE = {0.68, 0.85, 0.9, 1},
  NAVY = {0, 0, 0.5, 1},
  ROYAL_BLUE = {0.25, 0.41, 0.88, 1},
  SKY_BLUE = {0.53, 0.81, 0.92, 1},
  STEEL_BLUE = {0.27, 0.51, 0.71, 1},
  MIDNIGHT_BLUE = {0.1, 0.1, 0.44, 1},
  CORNFLOWER_BLUE = {0.39, 0.58, 0.93, 1},

  -- Orange/Brown Variants
  ORANGE = {1, 0.65, 0, 1},
  DARK_ORANGE = {1, 0.55, 0, 1},
  ORANGE_RED = {1, 0.27, 0, 1},
  BROWN = {0.65, 0.16, 0.16, 1},
  SADDLE_BROWN = {0.55, 0.27, 0.07, 1},
  CHOCOLATE = {0.82, 0.41, 0.12, 1},
  PERU = {0.8, 0.52, 0.25, 1},
  TAN = {0.82, 0.71, 0.55, 1},

  -- Purple Variants
  PURPLE = {0.5, 0, 0.5, 1},
  DARK_PURPLE = {0.3, 0, 0.3, 1},
  LIGHT_PURPLE = {0.8, 0.6, 0.8, 1},
  VIOLET = {0.93, 0.51, 0.93, 1},
  INDIGO = {0.29, 0, 0.51, 1},
  PLUM = {0.87, 0.63, 0.87, 1},
  LAVENDER = {0.9, 0.9, 0.98, 1},
  ORCHID = {0.85, 0.44, 0.84, 1},

  -- Yellow Variants
  DARK_YELLOW = {0.8, 0.8, 0, 1},
  LIGHT_YELLOW = {1, 1, 0.88, 1},
  GOLD = {1, 0.84, 0, 1},
  KHAKI = {0.94, 0.9, 0.55, 1},
  LEMON = {1, 0.97, 0, 1},
  CREAM = {1, 0.99, 0.82, 1},

  -- Nature Colors
  GRASS_GREEN = {0.48, 0.99, 0, 1},
  SEA_GREEN = {0.18, 0.55, 0.34, 1},
  OCEAN_BLUE = {0, 0.42, 0.58, 1},
  SAND = {0.96, 0.87, 0.7, 1},
  EARTH = {0.45, 0.29, 0.07, 1},
  SUNSET_ORANGE = {1, 0.4, 0.2, 1},
  SUNRISE_YELLOW = {1, 0.8, 0.2, 1},

  -- Gaming UI Colors
  HEALTH_RED = {0.8, 0.2, 0.2, 1},
  MANA_BLUE = {0.2, 0.4, 0.8, 1},
  XP_YELLOW = {1, 0.9, 0.2, 1},
  DAMAGE_RED = {1, 0.1, 0.1, 1},
  HEAL_GREEN = {0.2, 0.8, 0.2, 1},
  UI_BACKGROUND = {0.1, 0.1, 0.15, 0.8},
  UI_BORDER = {0.3, 0.3, 0.4, 1},
  BUTTON_NORMAL = {0.2, 0.3, 0.5, 1},
  BUTTON_HOVER = {0.3, 0.4, 0.6, 1},
  BUTTON_PRESSED = {0.1, 0.2, 0.4, 1},

  -- Transparent variants (useful for overlays)
  TRANSPARENT = {0, 0, 0, 0},
  WHITE_TRANSPARENT = {1, 1, 1, 0.5},
  BLACK_TRANSPARENT = {0, 0, 0, 0.5},
  RED_TRANSPARENT = {1, 0, 0, 0.5},
  GREEN_TRANSPARENT = {0, 1, 0, 0.5},
  BLUE_TRANSPARENT = {0, 0, 1, 0.5},

}

function Colors:rgb(r, g, b, a)
  local a = a or 255
  return {r/255, g/255, b/255, a}  
end

function Colors:random(alpha)
  local alpha = alpha or 1
  return { love.math.random(),love.math.random(),love.math.random(), alpha }
end

return Colors