#!/bin/sh

# requires:
#   compton, feh, mpd, mpDris2, mpd-notification, pulseaudio, i3, xrandr
#
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# autostart
xrdb -I$HOME -DORANGE -load ~/.Xresources
mpd
mpDris2 &
pulseaudio --start
sh ~/.fehbg
xrandr --rate 75
compton --config ~/.config/compton/compton.conf &
mpd-notification &

# start window manager or desktop enviroment
exec i3
