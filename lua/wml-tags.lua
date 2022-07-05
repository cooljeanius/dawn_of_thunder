wml_actions = wesnoth.wml_actions
helper = wesnoth.require 'lua/helper.lua'

function alpha_print(text, size, alpha)
	local c = mathx.round(255 * alpha)

	if (wesnoth.game_config.debug) and (c < 0) then
		wesnoth.message(string.format("alpha %0.1f, step %d", alpha ,c))
	end

	wml_actions.print({
		text = text,
		size = size,
		red = c, green = c, blue = c,
		duration = 1000
	})

	wesnoth.interface.delay(20)

	wml_actions.redraw({})
end

function wml_actions.interim_text(cfg)
	local title = cfg.title
	local text = cfg.text
	local duration = cfg.duration
	if (wesnoth.game_config.debug) then
		local fade_duration = cfg.fade_duration
	end

	if text == nil then
		text = ""
	end

	if title ~= nil then
		text = "<span size='larger' weight='bold'>" .. title .. "</span>\n\n" .. text;
	end

	if duration == nil then
		duration = 500
	end

	for alpha = 0.0, 1.0, 0.1 do
		alpha_print(text, 20, alpha)
	end

	wesnoth.interface.delay(duration)

	for alpha = 1.0, 0.0, -0.1 do
		alpha_print(text, 20, alpha)
	end

	wesnoth.interface.delay(750)
end

function wml_actions.clear_print()
	wml_actions.print({
		text = " ",
		duration = 1
	})
	
	wesnoth.interface.delay(20)

	wml_actions.redraw({})
end
