#!/usr/local/bin/bash

esc="\x1b"

declare -A cursor=(
  [hide]="${esc}[?25l"
  [show]="${esc}[?25h"
)

require () {
  [[ ! -z "${1}" ]] && 
  echo true
}

requireExec () {
  args="${@:2}"
  
  [[ ! -z $(require $args) ]] &&
  [[ $(type -t $1) == function ]] && 
  $1 $args
}

setTrap () {
  [[ ! -z $(require $@) ]] &&
  sig=$@ || sig=SIGINT

  trap cleanup $(echo $sig)

  cleanup () {
    tput cnorm
    tput sgr0
    exit 0
  }
}

printKeys () {
  declare -n arr=$1
  [[ -z ${arr[@]} ]] ||
  for i in "${!arr[@]}"; do
    echo "$i = ${arr[$i]}"
  done
}

isNum () {
  exp='^[+-]?[0-9]+([.][0-9]+)?$'
  ! [[ ${1} =~ ${exp} ]] && exit 1
}

joinStr () {
  printf "${@//[^a-zA-Z0-9]/_}"
}

toUpperCase () {
  printf "${1}" | tr [a-z] [A-Z]
}

header () {
  [[ ! -z $2 ]] && y=$2 || y=$(( $(tput lines) / 2 ))
  startPos=$(( $(( $(tput cols) / 2 )) - $(( ${#1} / 2 )) ))
  tput cup $y ${startPos} && echo -ne "\x1b[2K${1}"
}
