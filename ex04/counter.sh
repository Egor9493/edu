#!/bin/bash

#sudo apt-install awk
#sudo apt-install sort
#sudo apt-install uniq

if [ -n "$1" ]; then
  path_to_source=$1
else
  path_to_source='../ex03/hh_positions.csv'
fi

path_to_result='./hh_uniq_positions.csv'

if [ -f $path_to_source ]; then
  echo '"name"', '"count"' > hh_uniq_positions.csv

  if (tail -n+2 $path_to_source | awk -F ',' '{print $3}'| sort | uniq -c | awk -F ' ' 'BEGIN{OFS=","} {print $2, $1}') >> $path_to_result; then
    echo "Скрипт выполнен успешно"
    echo "Результат в файле $path_to_result"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi
else
  echo "Файл $path_to_source не найден."
fi
