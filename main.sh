#!/bin/bash

hako=""
running=true

while [ "$running" = true ]; do
    x=$((RANDOM % 2))
    
    if [ "$x" -eq 0 ]; then
        char="あ"
    else
        char="た"
    fi

    echo -n "$char"

    hako="${hako}${char}"

    if [[ "$hako" =~ あたたたた$ ]]; then
        echo ""
        echo "お前はもう死んでいる"
        running=false
    fi
done