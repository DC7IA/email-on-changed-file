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
curl -sS $URL -o $BASENAME/$FILENAME
if [ "$(md5sum $1/$FILENAME)" == "$(cat $1/md5sum-previous-file)" ]
then
echo no change
exit
else
md5sum $1/$FILENAME > $MD5SUM
echo changed!
printf "$CONTENT" | mail -s "$SUBJECT" -S from="$SENDER" $RECEIVER
fi

