-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config = {
	scrollback_lines = 10000,
	--color_scheme = 'Breeze',
	color_scheme = 'Belge (terminal.sexy)',
	use_fancy_tab_bar = true,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	switch_to_last_active_tab_when_closing_tab = true,
	window_background_opacity = 0.9,
	enable_scroll_bar = true,
	font = wezterm.font(
		"Source Code Pro",
		{
			weight="Medium",
			stretch="Normal",
			style="Normal"
		}
	),
	font = wezterm.font_with_fallback{
		{ family = "Source Code Pro", weight = "DemiBold" },
		{ family = "Noto Sans CJK TC", weight = "Medium" },
	},
	font_size = 10,
	cursor_blink_rate = 550,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	initial_rows = 40,
	initial_cols = 110,
	-- key binding
	leader = { key="a", mods="CTRL", timeout_milliseconds = 1000 },
	keys = {
	{
		key = '%',
    	mods = 'LEADER|SHIFT',
    	action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = '"',
    	mods = 'LEADER|SHIFT',
    	action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
    {
    	key = "LeftArrow",
    	mods = "LEADER",
    	action = wezterm.action{ActivatePaneDirection="Left"}
    },
    {
    	key = "DownArrow",
    	mods = "LEADER",
    	action = wezterm.action{ActivatePaneDirection="Down"}
    },
    {
    	key = "UpArrow",
    	mods = "LEADER",
    	action = wezterm.action{ActivatePaneDirection="Up"}
    },
    {
    	key = "RightArrow",
    	mods = "LEADER",
    	action = wezterm.action{ActivatePaneDirection="Right"}
    }, 
    {
    	key = "UpArrow",
    	mods = "CTRL|ALT",
    	action = wezterm.action{AdjustPaneSize={"Up", 5}}
    },
    {
    	key = "DownArrow",
    	mods = "CTRL|ALT",
    	action = wezterm.action{AdjustPaneSize={"Down", 5}}
    },
    {
    	key = "LeftArrow",
    	mods = "CTRL|ALT",
    	action = wezterm.action{AdjustPaneSize={"Left", 5}}
    },
    {
    	key = "RightArrow",
    	mods = "CTRL|ALT",
    	action = wezterm.action{AdjustPaneSize={"Right", 5}}
    },
    {
			key = "c",
			mods = "LEADER",
			action = wezterm.action{SpawnTab="CurrentPaneDomain"}
	},
    {
    	key = "p",
    	mods = "LEADER",
    	action = wezterm.action{ActivateTabRelative=-1}
    },
    {
    	key = "n",
    	mods = "LEADER",
    	action = wezterm.action{ActivateTabRelative=1}
    },
		{
    	key = 'e',
    	mods = 'CTRL|SHIFT',
    	action = wezterm.action.ShowLauncher,
  	},
		{
    	key = 'a',
    	mods = 'LEADER|CTRL',
  	 	action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  	},
	},
	mouse_bindings = {
    -- Disable the default click behavior
    -- {
    --   event = { Up = { streak = 1, button = "Left"} },
    --   mods = "NONE",
    --   action = wezterm.action.Nop,
    -- },
    -- {
    --   event = { Down = { streak = 1, button = "Left"} },
    --   mods = "NONE",
    --   action = wezterm.action.DisableDefaultAssignment,
    -- },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.Nop,
    },
	},
}
-- and finally, return the configuration to wezterm
return config
