#!/bin/bash

# Name: PHP Constructor Fix
# Author: Marcin Ruciński
# Use this script for replacing deprecated constructor names with __construct
# Create backup file with `.bak` extension
#
# How to use
# sudo php-cf.sh path_to_dir_on_srv

function main() {
    class=false
	className=false
	old=false
	new=false
    
    if [ -z $2 ] ; then 
		showErrMsg "Dir not selected"
    else
		for file in "$2"/*
		do
			if [ ! -d "$file" ] ; then
			if [ ${file: -4} == ".php" ] ; then
				while read line; do
					for word in $line ; do
						if [ $class == true ] && [ "${word}" != " " ] ; then
							className=${word}
							if grep -q "function ${className}" $file ; then
								echo -e "\e[93mChanging '${word}' constructor to __construct in ${file}. Bak file should be created.\e[39m"
								old="function ${word}"
								new="function __construct"
								sed -i.bak "s/${old}/${new}/g" $file
								old=false
								new=false
							fi
							class=false
							className=false
						fi
						
						if [ "${word}" == "class" ] ; then
							class=true
						fi
					done
				done < $file
			fi
			else
				main false "${file}"
			fi
		done
		if [ $1 == true ] ; then
			echo -e "\e[1mDone\e[21m"
		fi
    fi
}

function showErrMsg() {
		echo 
		echo -e " \e[41m      ${1}      \e[49m";
		echo 
}

main true $1