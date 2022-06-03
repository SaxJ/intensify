#!/bin/bash
image_file=$1
for ((i=1; i<=50; i++))
do
    x=$(shuf -i 10-200 -n 1)
    y=$(shuf -i 10-200 -n 1)
    convert "$image_file" -page +"$x"+"$y" -background none -flatten "${i}${image_file}"
    convert -background white -alpha remove -layers OptimizePlus -delay 25x100 "*${image_file}" -loop 0 output.gif
done
