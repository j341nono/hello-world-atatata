#!/bin/bash

hako=""
running=true

while [ "$running" = true ]; do
    x=$((RANDOM % 2))
    
    if [ "$x" = 0 ]; then
        char="あ"
    else
        char="た"
    fi

    # -n をつけて改行しないようにする
    echo -n "$char"

    hako="${hako}${char}"

    if [[ "$hako" =~ "あたたたた"$ ]]; then
        echo ""
        echo "お前はもう死んでいる"
        running=false
    fi
done
