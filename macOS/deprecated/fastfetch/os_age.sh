#!/bin/bash

install_date=$(rpm -qi basesystem | grep "Install Date" | awk -F': ' '{print $2}')
install_time=$(date -d "$install_date" +%s)

current_time=$(date +%s)
time_difference=$((current_time - install_time))

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
