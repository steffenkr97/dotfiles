local wezterm = require("wezterm")
local xdg_config_home = os.getenv("xdg_config_home")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,

  -- mac os only
  native_macos_fullscreen_mode = true,
  -- window_decorations = "TITLE | RESIZE",
  -- default_cursor_style = "BlinkingBar",
  color_scheme = "Nord (Gogh)",
  font_size = 12.5,
  font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  background = {
    -- layer 1 bild offen
    {
      source = {
        File = "/Users/steffenkroll/.config/wezterm/image2.jpg"
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
    },

    -- layer 2 background
    {
      source = {
        Color = "#282c35"
      },
      width = "100%",
      height = "100%",
      opacity = 0.50
    },

  },
  window_padding = {
    left = 3,
    right = 3,
    top = 0,
    bottom = 0,
  },

  keys = {
    {
      key = 'f',
      mods = 'CMD|CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
  }
}

return config
