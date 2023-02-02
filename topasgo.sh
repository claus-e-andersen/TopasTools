#!/bin/bash
# Script topago.sh
# Created: February 1, 2023
# Revised: February 2, 2023
# Name   : Claus E. Andersen

# This script is for bash / linux.

# Objective: To run a Topas with output and logfiles
# in well-organized subfolders. Development was
# motivated by the space computations due to the
# > 100 outfiles from each run. 

# 1. Make a timestamp file
# 2. Copy the topas parameter file to the timestamped data folder
# 3. Also copy files included using the include = ... in the main parameter file
# 4. The chain of include files i 4 generations is copied. 
# 5. Run topas with a copy of consule output.
# 6. Mode all output to the timestamped folder (csv to data folder)
# 7. Remove timestamp file

# Sample calls:
# ./topasgo.sh space10016.txt 1
# arg = 1 means "Run Topas"

# ./topasgo.sh space10016.txt 0
# arg = 0 means "Do not run Topas"
 
filename=$1
runtopas=$2


if [ -z "$filename" ]
then
      echo "\$filename is empty"
      filename="nonexistintfile-7890.txt"
fi

if [ -z "$runtopas" ]
then
      echo "\$runtopas is empty"
      runtopas=99
fi


current_time=$(date "+%Y.%m.%d-%H.%M.%S")
outputfolder=output-$filename-$current_time
datafolder=output-$filename-$current_time/data

filenamecopy=$filename-$current_time

echo "-------------------------------------------------"
echo "Welcome to topasgo, version 0.1"
echo "Current Time : $current_time"
echo "Output folder: " "$outputfolder"
echo "Data folder (for csv files): " "$datafolder"
echo "-------------------------------------------------"

if [ ! -e "$outputfolder" ]; then
      echo "Create the output folder, if it does not already exist."
      mkdir "$outputfolder"
      echo "Create the data folder, if it does not already exist."
      mkdir "$datafolder"
fi


# Copy main script to outputfolder
echo "Copy the main script ($1) to outputfolder"
cp $1 $outputfolder

# Make a point such that everything that will be created after that will also be copied.
touch script-begin-timestamp.xyz
sleep 0.3
cp $1 $filenamecopy
#######################3
# Now run Topas
# and get output

#touch catest101$current_time.keep
#touch catest102$current_time.csv
#touch catest103$current_time.csv
#touch catest104$current_time.csv

cp $filename $filenamecopy


###includefile = space-components-9001.txt
reallogfile=topasgo-logfile.txt
logfile=list-of-infludefiles.txt
logfile2=list-of-infludefiles2.txt
logfile3=list-of-infludefiles3.txt
logfile4=list-of-infludefiles4.txt
logfile5=list-of-infludefiles5.txt

echo "" > $logfile
echo "" > $logfile2
echo "" > $logfile3
echo "" > $logfile4
echo "" > $logfile5

echo "Copy all files used in the main script (includeFiles = ..) and 3 generations thereafter!"

###################################################################################
# Generation 1
###################################################################################
# Identify the includeFiles in the main file
# Put these lines in logfile
echo "-------------------------------------------------"
grep "[iI][nN][cC][lL][uU][dD][eE][fF][iI][lL][eE][ =]*" $filenamecopy >> $logfile 

# Read all lines into array
declare -a array 
while read -r line
do
  array+=("$(echo "$line")")
done<$logfile
#arguments.txt

# Process array
for i in "${array[@]}"
do
# extract the file names after = (like in includeFiles = catest1.txt catest2.txt catest3.txt
  temp=${i#*=} 
  #echo "Found = $temp in $i (this/these file/s will be copied to the timestamped folder)"
#  cp $temp $datafolder

  # split $temp into individual filenames using space as delimiter
  fnames=$(echo $temp | tr " " "\n")
   
  # process each item (i.e. each file name)
  for fn in $fnames
  do
    echo "Found : $fn"
    cp $fn $outputfolder
    grep "[iI][nN][cC][lL][uU][dD][eE][fF][iI][lL][eE][ =]*" $fn >> $logfile2 
  done
  #fnames done 
done
# array done

echo "Generation 1. Now all includefiles in the main scrips has been copied and recorded."

###################################################################################
# Generation 2
###################################################################################
# Read all lines into array
echo "-------------------------------------------------"
declare -a array2 
while read -r line
do
  array2+=("$(echo "$line")")
done<$logfile2

# Process array
for i in "${array2[@]}"
do
  # extract the file names after = (like in includeFiles = catest1.txt catest2.txt catest3.txt
  temp=${i#*=} 
  #echo "Found = $temp in $i (this/these file/s will be copied to the timestamped folder)"
  #cp $temp $datafolder

  # split $temp into individual filenames using space as delimiter
  fnames=$(echo $temp | tr " " "\n")
   
  # process each item (i.e. each file name)
  for fn in $fnames
  do
    cp $fn $outputfolder
    echo "Found : $fn"
    grep "[iI][nN][cC][lL][uU][dD][eE][fF][iI][lL][eE][ =]*" $fn >> $logfile3 
  done
  #fnames done 
done
# array done

echo "Generation 2. Now all includefiles to the include files in the main scrip have also been copied and recorded."

###################################################################################
# Generation 3
###################################################################################
# Read all lines into array
echo "-------------------------------------------------"
declare -a array3 
while read -r line
do
  array3+=("$(echo "$line")")
done<$logfile3


# Process array
for i in "${array3[@]}"
do
# extract the file names after = (like in includeFiles = catest1.txt catest2.txt catest3.txt
  temp=${i#*=} 
  #echo "Found = $temp in $i (this/these file/s will be copied to the timestamped folder)"
  #cp $temp $datafolder

  # split $temp into individual filenames using space as delimiter
  fnames=$(echo $temp | tr " " "\n")
   
  # process each item (i.e. each file name)
  for fn in $fnames
  do
    cp $fn $outputfolder
    echo "Found : $fn"
    grep "[iI][nN][cC][lL][uU][dD][eE][fF][iI][lL][eE][ =]*" $fn >> $logfile4 
   done
   #fnames done 
done
# array done
 echo "Generation 3. Now all includefiles to the includefiles to the includefiles in the main scrips have also been copied and recorded."
echo "-------------------------------------------------"

###################################################################################
# Generation 4
###################################################################################
# Read all lines into array
echo "-------------------------------------------------"
declare -a array4 
while read -r line
do
  array4+=("$(echo "$line")")
done<$logfile4


# Process array
for i in "${array4[@]}"
do
# extract the file names after = (like in includeFiles = catest1.txt catest2.txt catest3.txt
  temp=${i#*=} 
  #echo "Found = $temp in $i (this/these file/s will be copied to the timestamped folder)"
  #cp $temp $datafolder

  # split $temp into individual filenames using space as delimiter
  fnames=$(echo $temp | tr " " "\n")
   
  # process each item (i.e. each file name)
  for fn in $fnames
  do
    cp $fn $outputfolder
    echo "Found : $fn"
    grep "[iI][nN][cC][lL][uU][dD][eE][fF][iI][lL][eE][ =]*" $fn >> $logfile5 
   done
   #fnames done 
done
# array done
 echo "Generation 4. Now all includefiles .... in the main scrips have also been copied and recorded."
echo "-------------------------------------------------"


if [ $runtopas -gt 0 ]; then
      echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      echo "RUN TOPAS (second arg in call was = <$2> )"
      topas $filename | tee $reallogfile
      echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
else
      echo "!!!! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      echo "DO NOT RUN TOPAS  (second arg in call was <$2> )"
      echo "!!!! XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
fi



# The -prune option seems to be improtant as not to get the "same file error".
# See https://unix.stackexchange.com/questions/713442/mv-a-and-b-are-the-same-file
#find . -type f -newer script-begin-timestamp.xyz -exec mv "{}" -prune  $datafolder \;

#find . -path ./MOV -prune -o -type f -iname '*.MOV' -exec sh -c 'mv "$@" MOV' sh {} +

# maxdepth is to avoid searching any subfolders!
find . -maxdepth 1 -path $outputfolder -prune -o -type f -newer script-begin-timestamp.xyz -exec mv "{}" $outputfolder \;

#mv output-$filename-$current_time/*.csv $datafolder 

# Move the csv files deeper into the data suv-folder
mv $outputfolder/*.csv $datafolder 

sleep 0.1
rm script-begin-timestamp.xyz
echo "ByeBye from" $filename
echo "Output folder: " "$datafolder"
echo "--ByeBye from topasgo -----------------------------------------------"
