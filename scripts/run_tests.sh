#!/usr/bin/env bash
set -e
# Load configuration file:
source config.conf

# Read the number of the repetitions for each test
NUM_REPETI=1	# Default value
if [[ $# -ne 0 ]] && [[ $1 -gt 0 ]];
  then
    echo "[ INFO ]The tests will be repeated: $1 times."
    NUM_REPETI=$1
fi

# Load the Tests description file
source test.list

# Check if the "results" directory exists. If not, create a new directory.
mkdir -p results

# Launch each test
TOTALTESTS=${#TestFilename[@]}-1
for (( i=0; i<${#TestFilename[@]}; i++ ))
  do
    echo "[ INFO ] Executing test number: $i"

    # Selecting correct port in function of the URL preamble
    if [ ${TestUrlPreamb[$i]} == "http://" ];
      then
        PORT=$HTTP_PORT
    elif [ ${TestUrlPreamb[$i]} == "https://" ];
      then
        PORT=$HTTPS_PORT
    else
        echo "[ ERROR ] Bad URL preamble selected on test number $i."
        continue
    fi
    # Creating the command to be execcuted
    FULL_COMMAND="$NGHTTP2 ${TestParameter[$i]} ${TestTimeOut[$i]} ${TestUrlPreamb[$i]}$URL:$PORT${TestName[$i]}"
    echo "[ COMMAND ] $FULL_COMMAND"

    for(( j= 0; j<$NUM_REPETI; j++ ))
      do
	printf "[ STATUS ] Running test number $i repetition $j... "
        # Test Command Execution and getting the last output line
        TEST_LAST_LINE=$(eval $FULL_COMMAND | tail -n 1)
	echo "[ OK ]"
	# echo "[ DEBUG ] $TEST_LAST_LINE"

	# Getting the test total time
        responseTime=$(echo $TEST_LAST_LINE | awk '{print $2}')	# Get the total time. Example: +34.34s
        responseTime=${responseTime:1}	# Deleting + symbol from the value (first character)

        # Calculating multiplier to parse responseTime to  microseconds (us)
        valueUnit=$(echo $responseTime | tail -c 3)
        # echo "[ DEBUG ] Text of the unit value: $valueUnit"
        case $valueUnit in
            [0-9]*s) multiplier=1000000 ;;
            ms) multiplier=1000 ;;
            us) multiplier=1 ;;
            *) echo "[ERROR] Not valid unit for total test time. Received: $valueUnit"
            	       j=$((j-1))
                       continue;;
        esac
        responseTime=$(echo $responseTime | grep -Po '(\d+.*\d+)')	# Deleting units from the value
        # echo "[ DEBUG ] Response time: $responseTime"
	valueToSave=$(python -c "print $responseTime * $multiplier")	# Parsing time to microseconds
        # echo "[ DEBUG ] Value to save on result file: $valueToSave"

        # Saving test time to results file
        echo "$valueToSave" >> "results/${TestFilename[i]}"
    done

    # Insert blank lines to formatted user output
    echo ""
done
exit 0
