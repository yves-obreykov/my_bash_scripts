#!/bin/bash

# function to sech if it is a number
is_number() {
    re='^[0-9]+([.][0-9]+)?$'
    if [[ $1 =~ $re ]]; then
            return 0
    else
            return 1
    fi
}

# function to print rotating line animation
rotating_line() {
    local chars="/-\|"
    local index=0

    while true; do
            echo -ne "\r${chars:$index:1}"
            index=$(( (index + 1) % ${#chars} ))
            sleep 0.25
    done
}

#function that handle cleanup before exit
cleanup() {
    # stop the rotating animation 
    kill $rotating_line_pid > /dev/null 2>&1
    # show cursor
    tput cnorm
}

#check that the right amount of argumets are passed
if [ "$#" -eq 1 ]; then
        # no custom message provided
        message="Time is up you bitch!" 
elif [ "$#" -eq 2 ]; then
        # timer message is the one given as arguemt 2
        message=$2
else    
        echo "Usage: $0 <timer duration in minutes> <optional string message>"
        exit 1
fi

# check that the argument is correct
if ! is_number "$1"; then
        echo "Error: The provided argument is not a valid number."
        exit 1
fi

trap cleanup EXIT

# hide cursor
tput civis

duration_minutes=$1
duration_seconds=$(echo "$duration_minutes * 60" | bc)

echo "Starting timer for $duration_minutes minutes"

# run the rotationg line animation in the background
rotating_line &

# save the PID of the background process
rotating_line_pid=$!

sleep $duration_seconds
kill $rotating_line_pid > /dev/null 2>&1

# remove last char of the animation
echo 
echo -e "\033[A\033[K"

echo "Time's up!"

loop_count=2
i=0
while [ $i -le $loop_count ]
do
        spd-say "$message"
        wait
#        sleep 1.5 
        #paplay /usr/share/sounds/freedesktop/stereo/complete.oga
        i=$(( $i +1))
done

# show cursor
tput cnorm
exit
