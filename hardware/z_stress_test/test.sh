#!/bin/sh

clear

for f in {1..7}
  do
    vcgencmd measure_temp
    sysbench --test=cpu --cpu-max-prime=25000 --num-threads=4 
  done
vcgencmd measure_temp
