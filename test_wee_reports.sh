#!/bin/sh
# mao need to be able to test if the python script (wee_reports) worked

# Debug mode
#set -x
                                       
wee_reports --config=FAIL 2> errors.txt

if grep -q -i err errors.txt
then
  echo "Founds errors"
  exit 1
elif grep -q -i traceback errors.txt
then
  echo "Found traceback"
  exit 2
elif [ ! -s errors.txt ]
then
  echo "Looks clean"
  exit 0
else
  echo "Should be clean"
  exit 0
fi

cat errors.txt

