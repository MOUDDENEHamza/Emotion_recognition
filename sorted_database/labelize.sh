#!/bin/bash

CLASS=( neutral smiley sad angry surprised)

for ((i = 0; i < ${#CLASS[@]}; i++)); do
	j=1
	for file in ${CLASS[$i]}/*
	do
		extension="${file##*.}"
		mv $file "${CLASS[$i]}/${CLASS[$i]}$j.$extension"
		((j=j + 1))
	done
done
