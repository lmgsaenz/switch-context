#!/bin/bash
#**************************************************************************************************
# Maintainer: Luis Mario García Sáenz
# Version: v1 
# Date: 21/10/2020
#*************************************************************************************************
# Set unnecessary variables
blue=$'\033[34m'; reset=$'\033[0m'

#Set important variables
current_context=$(kubectl config view -o template --template='{{ index . "current-context" }}')
all_contexts=$(kubectl config get-contexts --output name | xargs)

echo "your current context is: $blue $current_context $reset"
read -p "¿Do you want to change the context ? [Y/n]: " answer

if [ $answer = Y ] | [ $answer = y ]
then
	PS3='Select a number: '
	options=($all_contexts)
	select opt in "${options[@]}"; do
		
		case $opt in
			${opt[$1]})
				kubectl config use-context $opt
				break
				;;
		esac
	done
else
	echo "ByeBye SuperHero"
fi

