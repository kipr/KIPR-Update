#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "You need to provide four numbers with spaces:  ./wallaby_set_id 1 2 2 4"
	exit
fi

H1="\\$(printf '%x' "'$1")"
H2="\\$(printf '%x' "'$2")"
H3="\\$(printf '%x' "'$3")"
H4="\\$(printf '%x' "'$4")"

CMD1='i2cset -y 1 0x50 0x40 0x'${H1}
CMD2='i2cset -y 1 0x50 0x41 0x'${H2}
CMD3='i2cset -y 1 0x50 0x42 0x'${H3}
CMD4='i2cset -y 1 0x50 0x43 0x'${H4}

echo
echo "Writing to EEPROM..."
eval $CMD1
eval $CMD2
eval $CMD3
eval $CMD4

echo
echo "Double-checking..."
VCMD1='i2cget -y 1 0x50 0x40'
VCMD2='i2cget -y 1 0x50 0x41'
VCMD3='i2cget -y 1 0x50 0x42'
VCMD4='i2cget -y 1 0x50 0x43'

V1=$(eval $VCMD1)
V2=$(eval $VCMD2)
V3=$(eval $VCMD3)
V4=$(eval $VCMD4)

echo
printf "Resulting ID: "

wallaby_get_serial.sh

echo
echo
echo "Done."
