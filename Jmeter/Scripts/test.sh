#!/bin/bash
# Threads Number & Ramp Time
: <<'Jmeter_Variables'
re='^[0-9]+$'
while echo "Number of threads (users)"; do
    read num_threads

    if ! [[ $num_threads =~ $re ]]; then
        echo "$num_threads: Is not a number"
    else
        break
    fi
done
while echo "Ramp-Up Period (in seconds)"; do
    read ramp_time

    if ! [[ $ramp_time =~ $re ]]; then
        echo "$ramp_time: Is not a number"
    else
        break
    fi
done

#echo "Number of threads= $num_threads" ; echo "Ramp-Up Period= $ramp_time" # -Jthreads=$num_threads -Jrampup=$ramp_time
Jmeter_Variables