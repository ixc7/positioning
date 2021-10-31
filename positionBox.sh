#!/usr/local/bin/bash

source utils.sh

termW=$(tput cols)
termH=$(tput lines)

boxW=10
boxH=5


# endX=$(($startX + $boxW))
# endY=$(($startY + $boxH))

charX="="
charY="|"


drawOutline () {
  startX=$1
  startY=$2
  cur=0
  outer=$(printf "$(repeatStr $charX $boxW)")
  inner=$(printf "$charY$(repeatStr " " $(( $boxW - 2 )))$charY")

  draw () {
    tput cup $startY $startX &&  
    startY=$((startY + 1)) &&
    echo "$1"
  }
  
  draw "$outer"
  while [ $cur -lt $(($boxH - 2)) ]
  do
    draw "$inner"
    ((cur++))
  done
  draw "$outer"
}

# drawContents () { ... }

clear
drawOutline 10 15
drawOutline 16 25
drawOutline 4 43
drawOutline 56 13
drawOutline 1 1
tput cup $termH 0

