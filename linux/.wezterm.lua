-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 16
config.color_scheme = "Ef-Night"
config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
