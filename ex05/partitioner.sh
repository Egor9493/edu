#!/bin/bash
awk 'BEGIN{FS=",";OFS=","}{$6=substr($2, 2, 10); print $0}' hh_positions.csv | sort -u -t, -k6 -r | awk 'BEGIN{FS=","; header="" }{if (NR == 1) header=$1","$2","$3","$4","$5; else print header > $6".csv"}'
awk 'BEGIN{FS=","}{if (NR != 1) print $0 >> substr($2, 2, 10)".csv"}' hh_positions.csv
