sxhkd -f 100 &
urxvtd -q -o -f &

xrdb -load ~/.Xresources

xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr

feh --bg-fill /home/saul/Pictures/reflection.png
compton &
unclutter &
xmodmap ~/.xmodmaprc
synclient MaxTapTime=0

exec bspwm
