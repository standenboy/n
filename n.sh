#!/bin/sh

set -e
NOTEDIR=~/.cache/notes # change to put notes in a different place
FUZZYFINDER=fzy # change to use a diffrent fuzzy finder EG: fzf
READER=less #change this to use a different reader such as more

if [ -z "$EDITOR" ]; then
	EDITOR=vi
fi

mkdir -p $NOTEDIR

if [ "$1" = "r" ]; then
	noteToRead=$(ls -c $NOTEDIR) 
	if [ -z "$noteToRead" ]; then
		echo "no notes!"
		exit 1
	fi
	noteToRead=$(ls -c $NOTEDIR | $FUZZYFINDER)
	$READER $NOTEDIR/$noteToRead
	exit 0
elif [ "$1" = "d" ]; then
	noteToDel=$(ls -c $NOTEDIR)
	if [ -z "$noteToDel" ]; then
		echo "no notes!"
		exit 1
	fi
	noteToDel=$(ls -c $NOTEDIR | $FUZZYFINDER)
	rm -rf $NOTEDIR/$noteToDel
	exit 0
elif [ "$1" = "p" ]; then
	echo "your notes are: "
	ls -c1 $NOTEDIR 
elif [ "$1" = "e" ]; then
	noteToEdit=$(ls -c $NOTEDIR)
	if [ -z "$noteToEdit" ]; then
		echo "no notes!"
		exit 1
	fi
	noteToEdit=$(ls -c $NOTEDIR | $FUZZYFINDER)
	$EDITOR $NOTEDIR/$noteToEdit
	exit 0
else
	read -p "Note name: " noteName
	noteName=$(echo $noteName | sed "s/ /_/g")
	$EDITOR $NOTEDIR/$noteName
	exit 0
fi
exit 1
