curl -k -H 'User-Agent: api-test-agent' 'https://api.hh.ru/vacancies?text="data%20scientist"&professional_role=165' | jq .items[0:20] > hh.json
