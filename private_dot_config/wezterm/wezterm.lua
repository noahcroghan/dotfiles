local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action
local target_triple = wezterm.target_triple

config.max_fps = 120

if target_triple:find('windows') then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
  config.window_background_opacity = 0
  config.win32_system_backdrop = 'Tabbed'

  wezterm.on('gui-startup', function(cmd)
    local screen = wezterm.gui.screens().active
    local screen_width = screen.width
    local screen_height = screen.height

    local window_width = screen_width * 0.75
    local window_height = screen_height * 0.75

    local x = math.floor((screen_width - window_width) / 2)
    local y = (math.floor((screen_height - window_height) / 2)) - 48

    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():set_inner_size(window_width, window_height)
    window:gui_window():set_position(x, y)
  end)
elseif target_triple:find('darwin') then
  config.font_size = 16
  config.window_decorations = 'RESIZE'
  config.hide_tab_bar_if_only_one_tab = true
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.color_scheme = 'GruvboxDarkHard'

  config.keys = {
      {
        key = 'f',
        mods = 'CMD',
        action = act.Search { CaseInSensitiveString = '' },
      },
    }

  wezterm.on('gui-startup', function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end)
end


return config
