#!/bin/bash

#echo "from:"
#grep -e url -e "SWAP" .git/config --color

#color not in Linux on Xilinx
if((`cat /proc/cpuinfo | grep Xilinx | wc -l`==0))
then
  color=--color
else
  color=
fi

#echo 'to:'
sed -i 's/#SWAP   url = /#GOTO   url = /;s/        url = /#SWAP   url = /;s/#GOTO   url = /        url = /' .git/config
grep -e url -e "SWAP" .git/config $color

