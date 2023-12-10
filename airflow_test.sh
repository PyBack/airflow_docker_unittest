#!/bin/bash

airflow dags list
airflow dags list-import-errors > error_output

threshold=1

# Check if it's a regular file
if [[ -f "$file" ]]; then
  # Get the file line count
  file_line_cnt=$(wc -l error_output | awk '{print $1}')

  # Check if file size exceeds threshold
  if [[ $file_line_cnt -gt $threshold ]]; then
    echo "Error: airflow dags list import"
    cat error_output
    exit -1
  fi
fi

echo "airflow dags list compile test complete!!"
exit 0