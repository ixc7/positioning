#!/usr/local/bin/bash

x=$(( $(tput cols) - 1 ))
y=$(( $(tput lines) - 2 ))

declare -A pos=(
  [topL]="0 0"
  [topR]="0 ${x}"
  [btmL]="${y} 0"
  [btmR]="${y} ${x}"
)

declare -A content=(
  [title]="the title"
  [text]="the text"
)

declare -A box=(
  [text]="hello world"
  [char]="#"
  [w]=24
  [h]=10
  [x]=0
  [y]=0
)










runTests () {
  clear
  tput setaf 2
  tput cup ${pos[topL]} && printf "A"
  tput cup ${pos[topR]} && printf "B"
  tput cup ${pos[btmL]} && printf "C"
  tput cup ${pos[btmR]} && printf "D"
  tput sgr0
}

# runTests
