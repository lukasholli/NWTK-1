#!/bin/bash

network="192.168.111.0/24"  
output_file="allIPs.txt"

echo "Scanning network $network ..."
nmap -sn "$network" | grep "Nmap scan report for" | awk '{print $NF}' | tr -d '()' | grep -Ev '\.(0|[1-9]|10)$' > "$output_file"

echo "Scan complete. Results saved in $output_file"
