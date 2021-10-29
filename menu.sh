#!/usr/local/bin/bash

clear &&
tput cup 0 0 

declare -A menu=(
  [1st]="option A"
  [2nd]="option B"
  [3rd]="option C"
  [4th]="option D"
)

for i in "${!menu[@]}"; do 
  echo "${i}: ${menu[$i]}"
done
