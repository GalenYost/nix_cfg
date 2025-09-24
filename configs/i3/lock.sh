#!/bin/bash

img="/home/user/.config/wallpaper.jpg"
scrot "$img"

i3lock \
  -i "$img" \
  --inside-color=00000088 \
  --ring-color=ffffffcc \
  --line-color=00000000 \
  --keyhl-color=88c0d0cc \
  --bshl-color=bf616acc \
  --separator-color=00000000 \
  --ring-width=4 \
  --radius=120 \
  --time-color=ffffffff \
  --date-color=ffffffff \
  --layout-color=ffffffff \
  --verif-color=88c0d0ff \
  --wrong-color=bf616aff \
  --noinput-text="" \
  --verif-text="Verifying…" \
  --wrong-text="Wrong!" \
  --time-str="%H:%M:%S" \
  --date-str="%A, %d %B"

rm "$img"
systemctl suspend
