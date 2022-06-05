#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/applets/android"
rofi_command="rofi -theme $dir/six.rasi"

# Links
discord=""
files=""
editor=""
browser=""
music=""
settings=""

# Error msg
msg() {
	rofi -theme "$dir/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$browser\n$music\n$discord\n$editor\n$files\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $discord)
		if [[ -f /usr/bin/discord ]]; then
			discord &
		elif [[ -f /usr/bin/discord-canary ]]; then
			discord-canary &
		else
			msg "No suitable terminal found!"
		fi
        ;;
    $files)
		if [[ -f /usr/bin/nautilus ]]; then
			nautilus &
		elif [[ -f /usr/bin/pcmanfm ]]; then
			pcmanfm &
		else
			msg "No suitable file manager found!"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/kitty ]]; then
			kitty -e  fish -c 'nvim'
		elif [[ -f /usr/bin/leafpad ]]; then
			leafpad &
		elif [[ -f /usr/bin/mousepad ]]; then
			mousepad &
		elif [[ -f /usr/bin/code ]]; then
			code &
		else
			msg "No suitable text editor found!"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/google-chrome-stable ]]; then
			google-chrome-stable &
		elif [[ -f /usr/bin/chromium ]]; then
			chromium &
		elif [[ -f /usr/bin/midori ]]; then
			midori &
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $music)
		if [[ -f /usr/bin/spotify ]]; then
			spotify &
		else
			msg "No suitable music player found!"
		fi
        ;;
    $settings)
		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
			xfce4-settings-manager &
		else
			msg "No suitable settings manager found!"
		fi
        ;;
esac

