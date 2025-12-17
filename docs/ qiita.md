
# Hello World あたたたた 2日目 shell script編

この記事は [Hello World あたたたた Advent Calendar 2025](https://qiita.com/advent-calendar/2025/hello-world-atatatata) の2日目の記事です。

今日は shell script で Hello World あたたたた を実装して解説していきます。

そもそも「Hello World あたたたた」が何かは [1日目の記事](https://qiita.com/oyngtmhr/items/e54866a5830d67968ef2) をご覧ください。


## コーディング例
---
paiza.io で実際に動かしてみることができます．

```bash
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

    echo -n "$char"

    hako="${hako}${char}"

    if [[ "$hako" =~ "あたたたた"$ ]]; then
        echo ""
        echo "お前はもう死んでいる"
        running=false
    fi
done
```

## コードと文法の解説



## 変数の宣言と代入

```bash
hako=""
running=true
```
ここは，`hako` に空文字，`running` に boolean型の `true` を代入しています．
shell script では，他のプログラミング言語と同様に変数に値を格納することができますが，注意点として，変数を参照するときに `$` を使用し，`$変数名` と記述します．
また，shell script では，変数の宣言時に変数名と代入値の間に空白を入れることができません．
https://qiita.com/ko1nksm/items/9650ed1fc21d668f2732

前提に，tarminal で実行できるコマンドの集合が bashを形成しており，`hako = ""` を見たときに，これが `python main.py` のように意味のある空白なのか否かを判断できません． 


## while文によるループ

```bash
while [ "$running" = true ]; do
    # 処理内容
done
```

while文を使用することで，指定した条件を達成するまで，while文のブロック内の実行を繰り返し実行することができます．
書き方には注意が必要で，条件文を `[]` な中に記述し，`[` や `]` と変数の間，加えて `=` の前後にも空白が必要となります．
`]` の後には，`;` をつけて，`];` とする必要があります．
比較演算子にも注意が必要で，一般的には，`==` が同値

## 乱数生成
```bash
x=$((RANDOM % 2))
```

疑似乱数の生成には，`RANDOM` という環境変数を使用します．
環境変数なのでターミナルから簡単に利用でき，`echo $RANDOM` を入力すると，毎回ランダムな値が出力されます．
16ビット符号なし整数（2の16乗 - 1）の範囲で，0 から 32767 までの範囲の疑似乱数を生成します．
この乱数を 2 で割った余りを使用し，0 か 1 の乱数としています．

疑似乱数のアルゴリズムについては，，，

公式の[ドキュメント](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html)からも確認できます．
> Each time this parameter is referenced, it expands to a random integer between 0 and 32767. Assigning a value to RANDOM initializes (seeds) the sequence of random numbers. Seeding the random number generator with the same constant value produces the same sequence of values. If RANDOM is unset, it loses its special properties, even if it is subsequently reset.


疑似乱数に使用されるアルゴリズム


```bash
if [ "$x" = 0 ]; then
    char="あ"
else
    char="た"
fi
```

0 か 1 が格納されている変数 `$x` が， 0 ならば，変数 `char` に `あ` を代入し，そうではない場合に `た` を代入します．
if文の書き方として，最後に `fi` を書く必要があります．


```bash
echo -n "$char"
```

echo は変数を標準出力するコマンドです．
`-n` のオプションをつけることで，改行しないようにします．


```bash
hako="${hako}${char}"
```

変数 `hako` の後に，変数`char` を結合します．



```bash
if [[ "$hako" =~ "あたたたた"$ ]]; then
    echo ""
    echo "お前はもう死んでいる"
    running=false
fi
```

変数 `hako` の終端が「あたたたた」ならば，改行しつつ，「お前はもう死んでいる」と出力します．
`[[ ... ]]` は，Bashの拡張テストコマンドで，高度な条件式が書けます．
`=~` は，正規表現マッチを行う演算子です．右側のパターンに一致するかを調べます．

`あたたたた"$` の，`$` は，正規表現のアンカーと呼ばれる記号で，行末（文字列の最後）を意味します．

つまり，最後が「あたたたた」で終わるの場合のみ真（True）になります．


