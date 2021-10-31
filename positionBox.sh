#!/usr/local/bin/bash

source utils.sh

setTrap

termW=$(tput cols)
termH=$(tput lines)

defineBox () { 
  boxW=$1
  boxH=$2
  charX="$3"
  charY="$4"
}

defineBox 15 7 "☠" "☠" 

drawOutline () {
  # require defineBox ...
  
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

  tput setaf $3
  draw "$outer"
  while [ $cur -lt $(($boxH - 2)) ]
  do
    draw "$inner"
    ((cur++))
  done
  draw "$outer"
}

# drawContents () { ... }

# drawBox () { drawOutline & drawContents && ... }

runTests () {
  clear && reset && tput civis
  drawOutline 10 15 1
  drawOutline 16 25 12
  drawOutline 4 6 3
  drawOutline 56 13 7
  drawOutline 65 10 196
  drawOutline 1 1 78
  drawOutline $(( $(( $termW - $boxW )) / 2 )) 4 12
  drawOutline $(( $termW - $boxW - 1 )) $(( $termH - $boxH - 1)) 67
  drawOutline $(( $termW - $boxW - 40 )) $(( $termH - $boxH - 1)) 99
  tput cup $termH 0 && tput cnorm && tput sgr0
}

runTests
