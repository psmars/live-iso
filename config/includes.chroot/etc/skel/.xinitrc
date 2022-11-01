#!/bin/sh
export XIM="fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="xim"
export XMODIFIERS="@im=fcitx"
export LC_ALL=fr_FR.UTF-8
export MM_CHARSET=UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8
export BROWSER=firefox
session=${1:-mate}

case $session in
    fluxbox) exec /usr/bin/startfluxbox ;;
    mate) exec mate-session;;
    *) exec $1;;
esac
