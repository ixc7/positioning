#!/usr/local/bin/bash

source utils.sh

termW=$(tput cols)
termH=$(tput lines)

boxW=10
boxH=5

startX=12
startY=15

endX=$(( $startX + $boxW ))
endY=$(( $startY + $boxH ))

charX="="
charY="|"

outerCol=$(repeatStr $charX $boxW)
innerCol=$charY$(repeatStr " " $(( $boxW - 2 )))$charY
innerCols=$(repeatStr "${innerCol}\n" $(( $boxH - 2 )))

boxOutline="
$outerCol
$innerCols
$outerCol
"

echo "$boxOutline"

