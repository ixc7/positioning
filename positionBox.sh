#!/usr/local/bin/bash

source utils.sh

termW=$(tput cols)
termH=$(tput lines)

boxW=10
boxH=5

startX=12
startY=15

endX=$(($startX + $boxW))
endY=$(($startY + $boxH))

charX="="
charY="|"


drawOutline () {
  draw () {
    tput cup $startY $startX &&  
    startY=$((startY + 1)) &&
    echo "$1"
  }

  outer=$(printf "$(repeatStr $charX $boxW)")
  inner=$(printf "$charY$(repeatStr " " $(( $boxW - 2 )))$charY")
  cur=0
  
  draw "$outer"
  while [ $cur -lt $(($boxH - 2)) ]
  do
    draw "$inner"
    ((cur++))
  done
  draw "$outer"
}


drawOutline
