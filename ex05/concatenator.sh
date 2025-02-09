#!/bin/bash

head -n 1 2025-01-17.csv > hh_positions_concatenated.csv
for file in 2025-01-17.csv 2025-01-20.csv 2025-01-21.csv 2025-01-22.csv 2025-01-28.csv 2025-01-31.csv 2025-02-03.csv 2025-02-05.csv 2025-02-06.csv 2025-02-07.csv 2025-02-08.csv
do tail -n +2 $file >> hh_positions_concatenated.csv
done


