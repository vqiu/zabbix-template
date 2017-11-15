#!/bin/bash

curl=/usr/bin/curl
URL=$1

function active() {
	$curl "$URL" 2>/dev/null| grep 'Active' | awk '{print $NF}'
}

function reading() {
	$curl "$URL" 2>/dev/null| grep 'Reading' | awk '{print $2}'
}

function writing() {
	$curl "$URL" 2>/dev/null| grep 'Writing' | awk '{print $4}'
}

function waiting() {
	$curl "$URL" 2>/dev/null| grep 'Waiting' | awk '{print $6}'
}

function accepts() {
	$curl "$URL" 2>/dev/null| awk NR==3 | awk '{print $1}'
}

function handled() {
	$curl "$URL" 2>/dev/null| awk NR==3 | awk '{print $2}'
}

function requests() {
	$curl "$URL" 2>/dev/null| awk NR==3 | awk '{print $3}'
}

case $2 in 
	active)
		active
		;;
	reading)
		reading
		;;
	writing)
		writing
		;;
	waiting)
		waiting
		;;
	accepts)
		accepts
		;;
	handled)
		handled
		;;
	requests)
		requests
		;;
	*)
		echo "Usage: `basename $0` active | reading | writing | accepts | handled | requests."
esac	
