#!/bin/bash

rm -f speech.txt
while IFS= read -r line
do
	num=`echo $line | wc -w`
	if [ "$num" -eq 0 ]
	then	
		echo >> speech.txt
		continue
	fi
	echo $line | awk -F '~' '{print $2 " once said, \"" $1 "\""}' >> speech.txt
done < quotes.txt
