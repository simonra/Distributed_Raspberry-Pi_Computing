#!/bin/bash
readonly $PATH="../website/uploads"
readonly $PIIP="129.241.210.141"
currentFile="$(ls -lt $PATH | grep '^d' | tail -1 | sed '${s/.* //;}')"
targetFolderName=$currentFile | sed 's/.*\.//'
targetFileName=$currentFile | sed 's/\.[^.]*$//'

#remember to add key for ssh
cp -r $currentFile pi@$PIIP:~/calculations/inputs/$targetFolderName/$targetFileName
cp -r $PATH/$currentFile ../website/processing/$targetFolderName/$targetFileName
rm $PATH/$currentFile

