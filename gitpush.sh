#!/bin/bash

# Initialize variables
commit=$@
verbose=false


# Usage message
usage() {
	echo "Usage: $0 -[vh] \"you commit...\"" >&2
	echo "   -v     verbose" >&2
	echo "   -h     help" >&2
}

while getopts "vh" opt; do
	if [[ $opt == "h" ]];then
		usage
		exit 0
	elif [[ $opt == "v" ]];then
		verbose=true
	else
		echo "Invalid option: -$OPTARG" >&2
		usage
		exit 1
	fi
done
shift $((OPTIND-1))


# add files to the git
#git add programmation
#git add README.md

for file in /home/mattieu/github/neesegit.github.io/; do
	if [[ "${file}" == "gitpush.sh" ]]; then
		echo "this file cannot be added"
		continue
	fi
	git add $file
done

if $verbose; then
	echo "-----------------------------------EVERYTHING HAS BEEN ADDED TO CITADELLE PROJECT--------------------------------------"
fi

# put the commit and push
git commit -m "$commit"
git push origin main


if $verbose; then
	echo "-----------------------------------EVERYTHING HAS BEEN PUSHED---------------------------------"
fi
