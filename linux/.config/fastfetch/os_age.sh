#!/bin/bash

file_path="/"
current_time=$(date +%s)
file_time=$(stat -c %Y "$file_path")
time_difference=$((current_time - file_time))

years=$((time_difference / 31536000))
months=$(((time_difference % 31536000) / 2628000))
days=$(((time_difference % 2628000) / 86400))
hours=$(((time_difference % 86400) / 3600))

echo -n
[[ $years -gt 0 ]] && echo -n "$years years, "
[[ $months -gt 0 ]] && echo -n "$months months, "
[[ $days -gt 0 ]] && echo -n "$days days, "
[[ $hours -gt 0 ]] && echo -n "$hours hours"
echo
