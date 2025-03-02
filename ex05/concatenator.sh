#!/bin/bash

path_to_res='../ex05/hh_positions_concatenated.csv'

file_lst=$(ls ./*.csv)

file=$(echo $file_lst | awk -F ' ' '{print $1}')
head -n 1 $file > $path_to_res

if (for file in $file_lst; do
      tail -n +2 $file >> $path_to_res
    done); then
  echo "Скрипт выполнен успешно"
else
  echo "При выполнении скрипта произошли ошибки"
fi




