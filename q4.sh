#!/bin/bash

num=(`echo $1 | awk -v OFS=" " -F "," '{$1=$1}1'`)
number=${#num[@]}
bubblesort() {
	number=$1
	shift
	num=("$@")
	if [ "$number" == 1 ]
	then
	{
		return 0
        }
	else
	{	
		i=0
		while (($i<$number-1))
		do
			if [ "${num[i]}" -gt "${num[i+1]}" ]
			then
				let temp=${num[i]}
				let num[i]=${num[i+1]}
				let num[i+1]=$temp
			fi
			let i=$i+1
		done
		let number=$number-1
		bubblesort "$number" "${num[@]}"
	}
	fi
}

bubblesort "$number" "${num[@]}"
echo ${num[@]}
