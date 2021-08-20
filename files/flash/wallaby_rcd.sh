#!/bin/bash

BOOT0="/sys/class/gpio/gpio17"
RST="/sys/class/gpio/gpio23"
STM32FLASH='/home/pi/stm32flash/stm32flash'
BINFILE='/home/pi/wallaby_v7.bin'
DEV='/dev/ttyAMA0'

#make sure we can control BOOT0 and RST
if [ ! -d "${BOOT0}" ]; then 
    echo "${BOOT0} - initializing gpio pins" 
    ./wallaby_init_gpio 
fi

if [ ! -d "${RST}" ]; then 
    echo "${RST} missing - initializing gpio pins" 
    ./wallaby_init_gpio 
fi

sleep 1

# BOOT0 low to run program after reset
CMD="echo 0 > ${BOOT0}/value"
echo $CMD
eval $CMD
sleep 1 

# reset co-processor
./wallaby_reset_coproc
