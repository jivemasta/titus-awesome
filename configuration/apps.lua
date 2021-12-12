local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'kitty',
    screenshot = 'flameshot screen -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    delayed_screenshot = 'flameshot screen -p ~/Pictures -d 5000',
    browser = 'firefox',
    editor = 'code', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'pcmanfm',
    music = rofi_command 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'volumeicon', --Mixer icon in the systray
    'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    'xfce4-power-manager', -- Power manager
    'feh --randomize --bg-fill ~/.wallpapers/*',
    '/usr/bin/variety',
    'cbatticon',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}