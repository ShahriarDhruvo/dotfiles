-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14
config.color_scheme = "Ef-Night"

-- and finally, return the configuration to wezterm
return config
