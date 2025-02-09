#!/bin/bash
 
tail -n+2 hh_positions.csv | awk -F ',' '{print $3}'| sort | uniq -c | awk -F ' ' 'BEGIN{FS=" "; OFS=","; print "\"" "name" "\"", "\"" "count" "\""};{print $2, $1}' > hh_uniq_positions.csv

