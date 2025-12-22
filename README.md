### hello-world-atatata Bash編の保存リポジトリ

[paiza.io](https://paiza.io/projects/jre8iuobfB-6vTRjNe2LPg) (Bash環境) で実際に動かしてみることができる．

```bash
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
```

