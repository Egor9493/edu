#!/bin/bash

#sudo apt-get install jq

path_to_result='./hh.json'

if (curl -k -H 'User-Agent: api-test-agent' 'https://api.hh.ru/vacancies?text="data%20scientist"&professional_role=165' | jq .items[0:20]) > $path_to_result; then
    echo "Скрипт выполнен успешно"
    echo "Результат в файле $path_to_result"
  else
    echo "При выполнении скрипта произошли ошибки"
  fi

