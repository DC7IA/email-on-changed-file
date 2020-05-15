#!/bin/bash
if [ -n "$1" ]
then
source $1
else
echo "please specify the parameter file like this: ./email-on-changed-file.sh email-on-changed-file.vars"
exit 1
fi
BASENAME="${FILENAME%.*}"
cd $DATADIR
wget -O $BASENAME/$FILENAME $URL 
if [ "$(md5sum $1/$FILENAME)" == "$(cat $MD5SUM)" ]
then
echo no change
exit
else
md5sum afu-pruefungen-files/Termine_Afu_Pruefungen.pdf > $MD5SUM
echo changed!
printf "$CONTENT" | mail -s "$SUBJECT" -S from="$SENDER" $RECEIVER
fi

