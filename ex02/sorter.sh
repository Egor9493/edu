#!/bin/bash

if [ -n "$1" ]; then
  path_to_source=$1
else
  path_to_source='../ex01/hh.csv'
fi

path_to_result='./hh_sorted.csv'

if [ -f $path_to_source ]; then
  if (head -n1 $path_to_source && tail -n +2 $path_to_source | sort -k2,2 -k1,1 -t ',') > $path_to_result; then
    echo "Скрипт выполнен успешно"
    echo "Результат в файле $path_to_result"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi
else
  echo "Файл $path_to_source не найден."
fi

