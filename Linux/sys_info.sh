#!/bin/bash

outputFolder=~/research
outputFile=$outputFolder/sys_info.txt


echo $outputFolder
echo $outputFile

if [ ! -d $outputFolder ] 
then 
  mkdir $outputFolder 
fi

if [ -f $outputFile ]
then 
rm $outputFile
fi

echo "A Quick System Audit Script" >> $outputFile
date >> ~/research/sys_info.txt
echo "" >> ~/research/sys_info.txt
echo "Machine Type Info" >> ~/research/sys_info.txt
echo $MACHTYPE >> ~/research/sys_info.txt
echo -e "Uname info: $(uname -a)\n" >> ~/research/sys_info.txt
echo -e "IP info: $(ip addr | grep inet | tail -2 | head -1) \n!" >> ~/research/sys_info.txt
echo "Hosatname: $(hostname -s) " >> ~/research/sys_info.txt
echo -e " \nThe files 777:" 
#find / -type f -perm 777 >> ~/research/sys_info.txt
echo -e "\n The 10 processes are:\n"
ps aux -m | awk {'print $1, $2,$3,$4,$11'} | head >> ~/research/sys_info.txt

# Useful Loops

# Part1
paths=('/etc/shadow' '/etc/passwd')
# Part 2
for path in ${paths[@]} 
do
  echo $(ls -lah $path)
done

# Bonus One 


