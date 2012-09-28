#!/bin/bash

# folder with proto files
PROTO_DIR=../proto

# folder for AS3 code saving
OUTPUT_DIR=../output









# DO NOT MODIFY IT
# wrap protoc command line
while [ true ]
do
	clear	
	echo - - - - - - - - - - - - -
	echo Type proto file name:
	read PROTO_FILE
	
	PROTO_FILE=$PROTO_DIR/$PROTO_FILE
	echo 
	
	# check proto exist
	if [[ -f $PROTO_FILE ]]
	then
		echo -\> $PROTO_FILE
	else
		PROTO_FILE=$PROTO_FILE.proto
	fi
	
	# auto add file suffix
	if [[ -f $PROTO_FILE ]]
	then
		echo -\> $PROTO_FILE
	else
		echo $PROTO_FILE does not exist, press ENTER key to try again...
		read pause
		continue
	fi
	
	# create folder if not exist
	if [[ -d $OUTPUT_DIR ]]
	then
		echo - - - - -
	else
		mkdir $OUTPUT_DIR
		echo -+-+-+-+-
	fi
	
	echo
	
	# generate AS3 code from proto
	protoc --proto_path=$PROTO_DIR --as3_out=$OUTPUT_DIR $PROTO_FILE
	
	# enter another loop
	echo DONE! Press ENTER key to continue...
	read pause
done