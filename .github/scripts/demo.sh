#!/bin/bash

# 宣告變數的三種模式
variable1=value
# 若是值內有空白則需要使用 '' 或 "" 包裹起來
variable2='value 2'
variable3="value 3"

# 若要使用變數則用${}刮起來
echo ${variable3}

# 更新變數直接重新 assign 值即可
variable3="variable-3"
echo ${variable3}

# 刪除變數使用 unset
unset variable3
echo ${variable3} # 會印出空值

# 運算
# 在 Bash Shell 中內建原生不支援運算式，但我們可以使用 expr、awk 等指令來支援實現運算式。

result=`expr 10 + 2`

echo "Result: $result"

# 條件判斷
# if 條件判斷
x=20
y=30

# 記得比較條件需要放在 [] 中，前後要留空白
if [ $x == $y ]; then
    echo "value x is equal to value y"
fi

if [ $x != $y ]; then
    echo "value x is not equal to value y"
fi

if [ $x -gt $y ]; then # -gt => greater than
    echo "value x is greater than value y"
else
    echo "value x is not greater than value y"
fi

if [ $x -lt $y ]; then # -lt => less than
    echo "value x is not less than value y"
else
    echo "value x is not less than value y"
fi

if [ $x -ge $y ]; then # -ge => greater equal
    echo "value x is greater or equal than value y"
else
    echo "value x is not greater than value y"
fi

if [ $x -le $y ]; then # -le => less equal
    echo "value x is not less or equal than value y"
else
    echo "value x is not less or equal than value y"
fi

value1=20
value2=30
value3=30

if [ $value1 -gt $value2 ]; then
    echo "value1 is greater than value2"
elif [ $value1 == $value3 ]; then
    echo "value1 is equal to value3"
else
    echo "other result"
fi

# case(switch) 條件判斷
language='Java123'

case $language in
    Java*) echo "Java！"
            ;;
    Python*) echo "Python！"
            ;;
    C*)     echo "C！"
            ;;
    *)      echo "no match..."
esac

# 迴圈
# for loop
for loop in 1 2 3; do
    echo "number: $loop"
done

# while loop
counter=0
while [ $counter -le 5 ]; do
    counter=`expr $counter + 1`
    echo $counter
done

# util loop
# 從 0 印出數字直到 10
counter=0
until [ $counter -gt 10 ]; do
    echo $counter
    counter=`expr $counter + 1`
done

# 函式
# input args start with 1. 0 is the filepath.
function echoHello() {
    # hello world, rock!!
    echo "${0} hello ${1}, ${2}!!"
    echo "$#"
    echo "$*"
}

echoHello 'world' 'rock'

# 特殊變數
echo "$0" # 目前的檔案名
echo "$1" # $n => n 從 1 開始，代表第幾個參數
echo "$#" # 傳遞到程式或函式目前有幾個參數
echo "$*" # 傳遞到程式或函式所有參數
echo "$@" # 類似 $* 但是在被雙引號包含時有些許不同
echo "$?" # 上一個指令退出狀態或是函式的返回值
echo "$$" # 目前 process PID