#!/bin/bash
image_file=$1
for ((i=1; i<=5; i++))
do
    x=$(shuf -i 10-100 -n 1)
    y=$(shuf -i 10-100 -n 1)
    convert "$image_file" -page +"$x"+"$y" -background none -flatten "${i}${image_file}"
done
convert -background white -alpha remove -layers OptimizePlus -delay 1x300 "*${image_file}" -loop 0 output.gif

for ((i=1; i<=5; i++))
do
    rm "${i}${image_file}"
done
