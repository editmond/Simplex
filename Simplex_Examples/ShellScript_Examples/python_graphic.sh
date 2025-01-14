#!/bin/zsh

while [ -n "$1" ]; do
case "$1" in 
*) #echo "Option $1 not recognized"
FILENAME=$1
OUTPUT="${FILENAME%.*}"
rm "${OUTPUT}.ppm"
python3 "$FILENAME" 
./"${FILENAME%.*}" > "${OUTPUT}.ppm"
;;
esac
shift 1
done
