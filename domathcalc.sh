#!/bin/bash

#Wolframstuff
#The wolfram command
readonly WOLFRAM="/opt/Wolfram/WolframEngine/10.0/Executables/math"
#Ensures wolfram can do graphical magic without running a physical display
tightvncserver :42
export DISPLAY=:42

#General global variables
#Makes the date a writeable string without colons and whitespaces
currentTime="$(date | tr -d " \t\r" | sed '${s/\://g;}')"
#outputs folder of next input, unless empty
currentFolder=$(ls -lt inputs/ | grep '^d' | tail -1 | sed '${s/.* //;}') 


#The main program, should run inside eternal loop

#Checks whether the users destination folder exists, if not creates it
if [ ! -d "./outputs/$currentFolder" ]; then
  mkdir outputs/$currentFolder
fi 

#Create new folder for the current calculation
mkdir outputs/$currentFolder/$currentTime
#Copies the input program to the output folder so that it can be run there
cp -r inputs/$currentFolder/* outputs/$currentFolder/$currentTime 

#Enter the output folder, execute the script, and return to the project root
cd outputs/$currentFolder/$currentTime

MFILE="$(ls *.m | tail -1)" 
$WOLFRAM -script $MFILE

cd ../../../ 

#Remove job that has just been processed and go to the next iteration
rm -r inputs/$currentFolder






#ls -l inputs sortbyDate check
#sortByDate.pop check
#cd toDIR 
#if -e ../outputs/toDIR
#  mkdir ../outputs/toDIR/datetime
#cp -r til outputs
#execute i outputs
#rm -rf inputs/toDIR
#DONE
#

