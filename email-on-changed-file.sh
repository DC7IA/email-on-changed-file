#!/bin/bash
if [ -n "$1" ]
then
source $1
else
echo "please specify the parameter file like this: ./email-on-changed-file.sh email-on-changed-file.vars"
exit 1
fi
BASENAME="${1%.*}"
cd $DATADIR
curl -sS $URL -o $1/$FILENAME
if [ "$(md5sum $1/$FILENAME)" == "$(cat $MD5SUM)" ]
then
echo no change
exit
else
md5sum $1/$FILENAME > $MD5SUM
echo changed!
printf "$CONTENT" | mail -s "$SUBJECT" -S from="$SENDER" $RECEIVER
fi

