#!/bin/bash

VCMD1='i2cget -y 1 0x50 0x40'
VCMD2='i2cget -y 1 0x50 0x41'
VCMD3='i2cget -y 1 0x50 0x42'
VCMD4='i2cget -y 1 0x50 0x43'

V1=$(eval $VCMD1)
V2=$(eval $VCMD2)
V3=$(eval $VCMD3)
V4=$(eval $VCMD4)

printf "\x$(printf %x ${V1})"
printf "\x$(printf %x ${V2})"
printf "\x$(printf %x ${V3})"
printf "\x$(printf %x ${V4})"
