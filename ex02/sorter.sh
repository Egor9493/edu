#!/bin/bash
(head -n1 hh.csv && tail -n +2 hh.csv | sort -k2,2 -k1,1 -t ',') > ./hh_sorted.csv
