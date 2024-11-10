#!/bin/bash

# Check if the input file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <ip_list_file>"
  echo "Example: $0 ips.txt"
  exit 1
fi

ip_list_file="$1"
output_file="os_scan_results.txt"

# Check if the IP list file exists
if [ ! -f "$ip_list_file" ]; then
  echo "Error: File $ip_list_file not found!"
  exit 1
fi

# Clear or create the output file
> "$output_file"

echo "Starting OS detection scan on IPs listed in $ip_list_file..."
while IFS= read -r ip; do
  if [[ -n "$ip" ]]; then
    echo "Scanning $ip for OS detection..."
    echo "Results for $ip:" >> "$output_file"
    nmap -O "$ip" >> "$output_file"
    echo -e "\n-----------------------------------\n" >> "$output_file"
  fi
done < "$ip_list_file"

echo "OS detection scan complete. Results saved in $output_file"
