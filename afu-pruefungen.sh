#!/bin/bash
source afu-pruefungen.vars
cd $DATADIR
wget -O afu-pruefungen-files/Termine_Afu_Pruefungen.pdf $URL 
if [ "$(md5sum afu-pruefungen-files/Termine_Afu_Pruefungen.pdf)" == "$(cat $MD5SUM)" ]
then
echo no change
exit
else
md5sum afu-pruefungen-files/Termine_Afu_Pruefungen.pdf > $MD5SUM
echo changed!
printf "$CONTENT" | mail -s "$SUBJECT" -S from="$SENDER" $RECEIVER
fi

