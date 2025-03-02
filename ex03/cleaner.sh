#!/bin/bash

#sudo apt-install awk

if [ -n "$1" ]; then
  path_to_source=$1
else
  path_to_source='../ex02/hh_sorted.csv'
fi

path_to_result='./hh_positions.csv'

if [ -f $path_to_source ]; then
  if (awk '
    BEGIN{
      FS = "\",|,\"|\",\""
      OFS = "\",\""
    }

    {
      str = "-"

      if (index($3, "Junior") != 0)
        {str = "Junior"}

      if (index($3, "Middle") != 0)
        {
          if (str != "-")
            {str = str "/Middle"}
          else
            {str = "Middle"}
        }

      if (index($3, "Senior") != 0)
        {
          if (str != "-")
              {str = str "/Senior"}
          else
            {str = "Senior"}
        }

      if (FNR == 1)
        {$6 = "name"}
      else
        {$6=str}

      print $1, $2, $6, $4, $5
    }' $path_to_source) > $path_to_result; then
    echo "Скрипт выполнен успешно"
    echo "Результат в файле $path_to_result"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi
else
  echo "Файл $path_to_source не найден."
fi
