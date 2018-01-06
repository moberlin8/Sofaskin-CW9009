#!/bin/bash
# mao need to be able to test if the python script (wee_reports) worked

# Debug mode
set -x

cp --verb ./bin/user/historygenerator.py /usr/share/weewx/user/

#mao 2018-Jan-6 More Debug to see what weewx looks like
wee_debug --info --verbosity=2

wee_reports 2> errors.txt 1> output.txt

if grep -q -i err errors.txt
then
  echo "Founds errors"
  cat errors.txt
  exit 1
elif grep -q -i traceback errors.txt
then
  echo "Found traceback"
  cat errors.txt
  exit 2
elif [ ! -s errors.txt ]
then
  echo "Looks clean"
  cat output.txt
else
  echo "Should be clean"
fi

cat errors.txt

cd /tmp/weewx/html
html=( index.html month.html station.html summary.html week.html year.html )
missing = 0
for i in "${html[@]}"
do
	if [ ! -e $i ]
	then
	  echo "Error generating $i"
	  missing = 1
done
if [ missing gt 0 ]
then
  echo "Error generating html"
  exit 3
else
  echo "html files generated successfully"
fi
