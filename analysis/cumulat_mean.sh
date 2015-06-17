#!/bin/bash
set -e

echo "***************************************************"
echo "* Calculating data files                          *"
echo "***************************************************"
python calculator.py
cp *.mdat mean/
rm *.mdat
FILES_TO_PLOT=$(find mean/ -type f)
echo "Done!"

echo "***************************************************"
echo "* Drawing files...                                *"
echo "***************************************************"
for COMMAND in $FILES_TO_PLOT
do
	echo "File to graph:"
	echo $COMMAND
	# Saving result to $FILENAME external file:
	testPage=$(echo $COMMAND | awk -F[/] '{print $2}')
	FILENAME_GRAPH="${testPage}_${NUMBERTESTS}_mgraph.png"
	echo $FILENAME_GRAPH
	gnuplot -e "set term png; plot '$COMMAND' w l;  set output 'graph.png'; replot;"
        cp graph.png mean/$FILENAME_GRAPH
        rm graph.png
done

echo "==============================================="
echo " DONE! ALL GRAPHS HAS BEEN CREATED SUSCESFULLY!"
echo "==============================================="
