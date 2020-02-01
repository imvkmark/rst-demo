#!/usr/bin/env bash

#--------------------------------------------
# echo demo
#--------------------------------------------

#-------------- 输出普通字符串   --------------

echo "hello, world"

#------------- 输出含变量的字符串 --------------

name="duoli"
echo "hello, \"${name}\""
# Output: hello, "duoli"

#------------- 输出含换行符的字符串 ------------

echo "YES\nNO"
#  Output: YES\nNO

echo -e "YES\nNO" # -e 开启转义
#  Output:
#  YES
#  NO

echo "YES"
echo "NO"
#  Output:
#  YES
#  NO

echo -e "YES\c" # -e 开启转义 \c 不换行
echo "NO"
#  Output:
#  YESNO

#------------- 输出重定向到文件 ------------

# 输出到 `shell/_output/syntax-text.txt` 文件中
work_path=$(cd "$(dirname "$0")" && pwd)
echo "test" >"${work_path}/../_output/syntax-test.txt"