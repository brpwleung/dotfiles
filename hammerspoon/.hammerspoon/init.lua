s_frame_gap = 30
s_lattice_x_num_steps = 20
s_lattice_y_num_steps = 20

function move_window(d)
    return function ()
        local w = hs.window.focusedWindow()
        local w_frame = w:frame()
        local s_frame = w:screen():frame()

        s_frame.w = s_frame.w - 2 * s_frame_gap
        s_frame.h = s_frame.h - 2 * s_frame_gap
        s_frame.x = s_frame.x + s_frame_gap
        s_frame.y = s_frame.y + s_frame_gap

        local s_lattice_x_step_size = math.floor(s_frame.w / s_lattice_x_num_steps)
        local s_lattice_y_step_size = s_frame.h / s_lattice_y_num_steps

        if string.find(d, "l") then
            local placeholder = w_frame.x - s_frame.x
            placeholder = math.floor(placeholder / s_lattice_x_step_size)
            placeholder = math.max(placeholder - 1, 0) * s_lattice_x_step_size
            w_frame.x = placeholder + s_frame.x
        end
        if string.find(d, "u") then
            local placeholder = w_frame.y - s_frame.y
            placeholder = math.floor(placeholder / s_lattice_y_step_size)
            placeholder = math.max(placeholder - 1, 0) * s_lattice_y_step_size
            w_frame.y = placeholder + s_frame.y
        end
        if string.find(d, "r") then
            local placeholder = -1 * ((w_frame.x + w_frame.w) - (s_frame.x + s_frame.w))
            placeholder = math.floor(placeholder / s_lattice_x_step_size)
            placeholder = math.max(placeholder - 1, 0) * s_lattice_x_step_size
            w_frame.x = -1 * placeholder + (s_frame.x + s_frame.w) - w_frame.w
        end
        if string.find(d, "d") then
            local placeholder = -1 * ((w_frame.y + w_frame.h) - (s_frame.y + s_frame.h))
            placeholder = math.floor(placeholder / s_lattice_y_step_size)
            placeholder = math.max(placeholder - 1, 0) * s_lattice_y_step_size
            w_frame.y = -1 * placeholder + (s_frame.y + s_frame.h) - w_frame.h
        end

        w:setFrame(w_frame)
    end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "h", move_window("l"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "j", move_window("d"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "k", move_window("u"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", move_window("r"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "y", move_window("ul"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "u", move_window("ur"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "b", move_window("dl"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", move_window("dr"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "g",
    function ()
        local w = hs.window.focusedWindow()
        local w_frame = w:frame()
        local s_frame = w:screen():frame()

        w_frame.x = s_frame.w / 2 - w_frame.w / 2
        w_frame.y = s_frame.h / 2 - w_frame.h / 2

        w:setFrame(w_frame)
    end
)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r",
    function ()
        hs.reload()
    end
)
