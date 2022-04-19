#!/bin/bash

read input
length=$(expr length "$input")
for ((i=length-1;i>=0;i--))
do
	echo -n ${input:i:1}
done
echo
for ((i=length-1;i>=0;i--))
do
	char=`printf "%d" "'${input:i:1}"`
	echo $char | awk '{printf("%c",$1+1)}'
done
echo
read inputagain
length=$(expr length "$inputagain")
echo $length
for ((i=(length/2)-1;i>=0;i--))
do
	echo -n ${inputagain:i:1}
done
for ((i=length/2;i<length;i++))
do
	echo -n ${inputagain:i:1}
done
