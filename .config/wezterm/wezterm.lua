-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Set default shell
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "duskfoxCVD"
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Catppuccin Mocha"

config.font_size = 15
config.font = wezterm.font({ family = "Fira Code" })
-- config.font = wezterm.font({ family = "Monoid" })
-- config.font = wezterm.font({ family = "Maple Mono" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

config.freetype_load_target = "HorizontalLcd"
config.front_end = "WebGpu"

config.adjust_window_size_when_changing_font_size = false
config.debug_key_events = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.native_macos_fullscreen_mode = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "MACOS_FORCE_ENABLE_SHADOW | RESIZE"
config.window_padding = {
	left = 30,
	right = 30,
	top = 40,
	bottom = 10,
}
local TITLEBAR_COLOR = "#333333"
-- config.window_frame = {
-- 	-- font = wezterm.font({ family = "Hack", weight = "Bold" }),
-- 	font_size = 13.0,
-- 	active_titlebar_bg = "#FFFFFF",
-- 	inactive_titlebar_bg = TITLEBAR_COLOR,
-- }
config.window_background_opacity = 0.9
config.macos_window_background_blur = 1000
config.initial_rows = 50
config.initial_cols = 160
config.keys = {
	{ key = "l", mods = "SUPER", action = act.PaneSelect },
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
config.harfbuzz_features = { "calt" }
config.use_fancy_tab_bar = false

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
}

config.status_update_interval = 1000

local function show_beam_cpu(cells)
	-- Add an entry for each battery (typically 0 or 1)
	local result, stdout, stderr = wezterm.run_child_process({ "ps", "-Ao", "%cpu,command" })
	local sum = 0.0
	local match = false
	for s in string.gmatch(stdout, "[^\r\n]+") do
		if string.match(s, "beam") then
			local number = string.match(s, "^%s*([^ ]+)")
			sum = sum + tonumber(number)
			match = true
		end
	end

	if match then
		table.insert(cells, string.format("%5.1f%% Beam CPU", sum))
	end
end

-- and finally, return the configuration to wezterm
wezterm.on("update-status", function(window, pane)
	local cells = {}

	show_beam_cpu(cells)
	local batt_icons = { "", "", "", "", "" }
	for _, b in ipairs(wezterm.battery_info()) do
		local curr_batt_icon = batt_icons[math.ceil(b.state_of_charge * #batt_icons)]
		table.insert(cells, string.format("%s %.0f%%", curr_batt_icon, b.state_of_charge * 100))
	end

	-- Color palette for each cell
	local text_fg = "#c0c0c0"
	local colors = {
		"#000000",
		"#3c1361",
		"#52307c",
		"#663a82",
		"#7c5295",
		"#b491c8",
	}

	local elements = {}
	while #cells > 0 and #colors > 1 do
		local text = table.remove(cells, 1)
		local prev_color = table.remove(colors, 1)
		local curr_color = colors[1]

		-- table.insert(elements, { Background = { Color = prev_color } })
		table.insert(elements, { Foreground = { Color = curr_color } })
		table.insert(elements, { Text = "" })
		table.insert(elements, { Background = { Color = curr_color } })
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Text = " " .. text .. " " })
	end
	window:set_right_status(wezterm.format(elements))
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
