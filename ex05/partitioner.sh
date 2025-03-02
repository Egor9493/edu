#!/bin/bash

#sudo apt-install sort
#sudo apt-install awk

if [ -n "$1" ]; then
  path_to_source=$1
else
  path_to_source='../ex03/hh_positions.csv'
fi

if [ -f $path_to_source ]; then
  awk 'BEGIN{FS=",";OFS=","}{$6=substr($2, 2, 10); print $0}' $path_to_source | sort -u -t, -k6 -r | awk 'BEGIN{FS=","; header="" }{if (NR == 1) header=$1","$2","$3","$4","$5; else print header > $6".csv"}'
  if awk 'BEGIN{FS=","}{if (NR != 1) print $0 >> substr($2, 2, 10)".csv"}' $path_to_source; then
    echo "Скрипт выполнен успешно"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi
fi
