#!/bin/bash

CLASSES=( angry neutral sad smiley surprised)
SRC=sorted_database/
TARGET=IA/validation/
count=0

rm $TARGET${CLASSES[$i]}/*
for (( i = 0 ; i < ${#CLASSES[@]} ; i++ )); do
	FILES=$SRC${CLASSES[$i]}/*
	for f in $FILES; do
		ID=$(echo $f | tr -dc '0-9')
		if [ $ID -gt 86 ] && [ $count -lt 4 ]; then
			EXTENSION="${f##*.}"
			cp $f $TARGET${CLASSES[$i]}/${CLASSES[$i]}$ID.$EXTENSION
			count=$(( count + 1 ))
		fi
	done
	count=0
done
