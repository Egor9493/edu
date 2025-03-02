#!/bin/bash

#sudo apt-install jq

if [ -n "$1" ]; then
  path_to_source=$1
else
  path_to_source='../ex00/hh.json'
fi
path_to_filter="./filter.jq"
path_to_result='./hh.csv'

if [ -f $path_to_source ]; then
  if jq -r -f $path_to_filter  $path_to_source > $path_to_result; then
    echo "Скрипт выполнен успешно"
    echo "Результат в файле $path_to_result"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi
else
  echo "Файл $path_to_source не найден."
fi



