#!/bin/bash

'''
Given a total count of seconds, convert to HH:MM:SS

BUGS:
- If h=0 or m=0, currently fails with syntax error, because it relies on these
  values to compute the next time unit.

TODO:
- Calc milliseconds
'''

# Input the total seconds
secs_all=$1

# Count hours, and floor
hrs=`echo "$secs_all / 3600" | bc -l`
hrs=${hrs/.*}
# Remaining seconds outside of the hours
hrs_in_secs=`echo "$hrs * 3600" | bc -l`
secs_left=`echo "$secs_all - $hrs_in_secs" | bc -l`

# Count minutes, and floor
mins=`echo "$secs_left / 60" | bc -l`
mins=${mins/.*}
# Remaining seconds outside of the minutes
mins_in_secs=`echo "$mins * 60" | bc -l`
secs_left=`echo "$secs_left - $mins_in_secs" | bc -l`

# Whatever's left is seconds
secs=$secs_left

# HH:MM:SS
echo $hrs"h:"$mins"m:"$secs"s"
