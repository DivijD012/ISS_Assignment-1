#!/bin/bash

wc -c < $1
wc -l < $1
wc -w < $1

let i=1
while IFS= read -r line
do
	echo "$line" > intermediate3d.txt
	echo -n "Line no: $i - "
	wc -w < intermediate3d.txt
	rm intermediate3d.txt
	let i=$i+1
done < $1

grep -wo '[[:alnum:]]\+' $1 > intermediate3e.txt
cat -n intermediate3e.txt | sort -k2 | uniq -cdf1 | sort -nk2 > intermediate3e2.txt
awk -F' ' '{print "Word: " $3 " - Count of repitition: " $1}' intermediate3e2.txt
rm intermediate3e.txt
rm intermediate3e2.txt
