local wezterm = require("wezterm")

local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.macos_window_background_blur = 30
-- config.disable_default_key_bindings = true
-- config.enable_kitty_graphics = true
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.font_size = 16
config.font = wezterm.font("JetBrains Mono")
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
-- config.foreground_text_hsb = {
--     hue = 1.0,
--     saturation = 1.0,
--     brightness = 1.0,
-- }

-- config.launch_menu = {
--     -- Add your launch menu items here if any
-- }

config.keys = {
    {
        key = "V",
        mods = "CTRL",
        action = act.PasteFrom("Clipboard"),
    },
    {
        key = "f",
        mods = "CTRL",
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = "'",
        mods = "CTRL",
        action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
    },
}

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        event = { Down = { streak = 3, button = "Left" } },
        mods = "NONE",
        action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
    },
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
            end
        end),
    },
}

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the default when opening Wezterm
-- config.default_domain = "WSL:Ubuntu-22.04"

-- Check if the operating system is Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "x86_64-pc-windows-gnu" then
    -- Set WSL2 Ubuntu-22.04 as the default domain only on Windows
    config.default_domain = "WSL:Ubuntu-22.04"
end

return config
