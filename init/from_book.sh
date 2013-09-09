#!/bin/bash

EXIST_DATA=$1
BOOK_EXISTS=`echo $EXIST_DATA | grep book | wc -l`

if [ $BOOK_EXISTS -eq 1 ]
then

	EXIST_COLLECTION=$(basename $EXIST_DATA)
	EXIST_HOME=/home/fbaumgardt/db/exist
	EXIST_USR=fbaumgardt
	EXIST_PWD=r4nd0m!

	ps ax | grep -v grep | grep db/exist | awk '{print $1}' | xargs kill
	$EXIST_HOME/bin/startup.sh & sleep 10

	$EXIST_HOME/bin/client.sh -ouri=xmldb:exist://127.0.0.1:9090/exist/xmlrpc -u $EXIST_USR -P $EXIST_PWD -m /db/perseus-ocr/$EXIST_COLLECTION -p "$EXIST_DATA"

	ps ax | grep -v grep | grep db/exist | awk '{print $1}' | xargs kill
	$EXIST_HOME/bin/server.sh & sleep 10

else

	echo "Usage: 'load_book_in_exist_db.sh <path to .book-folder>'"
	echo "Please remember to use Federico Boschetti's .book format."

fi