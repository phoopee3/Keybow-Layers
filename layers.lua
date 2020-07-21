require "keybow"

active_layer = 0

-- colors

black       = { 0, 0, 0}
blue        = { 0, 109, 177 }
blue_dark   = { 0, 72, 116 }
blue_light  = { 0, 155, 249 }
fuschia     = { 255, 0, 255 }
green       = { 84, 140, 33 }
green_dark  = { 60, 99, 24 }
green_light = { 126, 209, 51 }
orange      = { 253, 146, 48 }
pink        = { 184, 9, 187 }
pink_dark   = { 139, 7, 141 }
pink_light  = { 245, 11, 249 }
purple      = { 155, 95, 249 }
yellow      = { 255, 240, 115 }

-- set up colors
layer = {}
layer[0] = {}
layer[0][0] = orange
layer[0][1] = orange
layer[0][2] = orange
layer[0][3] = blue_light
layer[0][4] = orange
layer[0][5] = blue_light
layer[0][6] = purple
layer[0][7] = purple
layer[0][8] = purple
layer[1] = {}
layer[1][0] = yellow
layer[1][1] = yellow
layer[1][2] = yellow
layer[1][3] = blue_dark
layer[1][4] = yellow
layer[1][5] = blue
layer[1][6] = blue_light
layer[1][7] = blue_light
layer[1][8] = blue_light
layer[2] = {}
layer[2][0] = pink_dark
layer[2][1] = pink_dark
layer[2][2] = pink_dark
layer[2][3] = pink
layer[2][4] = pink
layer[2][5] = pink
layer[2][6] = pink_light
layer[2][7] = pink_light
layer[2][8] = pink_light

-- Custom Colors --
function setup() -- Set custom lights up
    keybow.auto_lights(false)
    keybow.clear_lights()

    -- rgb(253, 146, 48) orange
    -- rgb(0, 155, 249) blue
    -- rgb(84, 140, 33) green
    -- rgb(155, 95, 249) purple

    --[[
        9 10 11
        6  7  8
        3  4  5
        0  1  2
    ]]

    for i = 0,11,1
    do
        keybow.set_pixel( i, green[1], green[2], green[3] )
    end
end

function set_active_layer_lights()
    active_button = active_layer + 9
    for i = 9,11,1
    do
        if i == active_button then
            keybow.set_pixel( i, green_light[1], green_light[2], green_light[3] )
        else
            keybow.set_pixel( i, green_dark[1], green_dark[2], green_dark[3] )
        end
    end
end

function set_layer_lights()
    for i = 0,8,1
    do
        keybow.set_pixel( i, layer[active_layer][i][1], layer[active_layer][i][2], layer[active_layer][i][3] )
    end
end

-- Key mappings --

function handle_key_00(pressed)
    if active_layer == 0 then
        keybow.set_key(keybow.LEFT_ARROW, pressed)
    end
    if active_layer == 1 then
        keybow.text([[layer 1, key 00]])
    end
    if active_layer == 2 then
        keybow.text([[layer 2, key 00]])
    end
end

function handle_key_01(pressed)
    if active_layer == 0 then
        keybow.set_key(keybow.DOWN_ARROW, pressed)
    end
end

function handle_key_02(pressed)
    if active_layer == 0 then
        keybow.set_key(keybow.RIGHT_ARROW, pressed)
    end
end

-- row

function handle_key_03(pressed)
    if active_layer == 0 then
        keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
        keybow.set_key("`", pressed)
        keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_PREV, pressed)
    end
end

function handle_key_04(pressed)
    if active_layer == 0 then
        keybow.set_key(keybow.UP_ARROW, pressed)
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_PLAYPAUSE, pressed)
    end
end

function handle_key_05(pressed)
    if active_layer == 0 then
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
        keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
        keybow.set_key("v", pressed)
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)
        keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_NEXT, pressed)
    end
end

-- row

function handle_key_06(pressed)
    if active_layer == 0 then
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
        keybow.set_key("x", pressed)
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)        
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_VOL_DOWN, pressed)
    end
end

function handle_key_07(pressed)
    if active_layer == 0 then
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
        keybow.set_key("c", pressed)
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_MUTE, pressed)
    end
end

function handle_key_08(pressed)
    if active_layer == 0 then
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_DOWN)
        keybow.set_key("v", pressed)
        keybow.set_modifier(keybow.LEFT_META, keybow.KEY_UP)
    end
    if active_layer == 2 then
        keybow.set_media_key(keybow.MEDIA_VOL_UP, pressed)
    end
end

-- row

function handle_key_09(pressed)
    if pressed then
        active_layer = 0
        set_layer_lights()
        set_active_layer_lights()
    end
end

function handle_key_10(pressed)
    if pressed then
        active_layer = 1
        set_layer_lights()
        set_active_layer_lights()
    end
end

function handle_key_11(pressed)
    if pressed then
        active_layer = 2
        set_layer_lights()
        set_active_layer_lights()
    end
end

