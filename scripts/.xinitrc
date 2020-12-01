xbacklight -set 100
xset b off
libinput-gestures-setup start
synclient TapButton1=1
synclient TapButton2=3
setxkbmap fr
undervolt_script
hdd_script
dunst &
dwmbar &
compton &
redshift &
feh --bg-scale /home/rr/Pictures/wallpaper.jpg &
exec dwm
pulseaudio --start
amixer set Capture nocap
