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
if [ "$(md5sum $BASENAME/$FILENAME)" == "$(cat $BASENAME/md5sum-previous-file)" ]
then
echo no change
exit
else
md5sum $BASENAME/$FILENAME > $BASENAME/md5sum-previous-file
echo changed!
printf "$CONTENT" | mail -s "$SUBJECT" -S from="$SENDER" $RECEIVER
fi

