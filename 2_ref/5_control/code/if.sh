#!/usr/bin/env bash

# if 语句
# ----------------------------------------
# 一行的表达式
if [[ 1 -eq 1 ]]; then
    echo "1 -eq 1 result is: true"
fi

# Test 方法
if test 1 -eq 1; then
    echo "1 -eq 1 result is: true"
fi

# 换行写法
if
    1 -eq 1
then
    echo "1 -eq 1 result is: true"
fi
# Output: 1 -eq 1 result is: true

# if 快捷写法
# ----------------------------------------
[ 1 -eq 1 ] && echo '1 = 1'

# 条件是 0 也会输出数据
# if [ i –ne 0 ] 可以替代为 0 的情况
# ----------------------------------------
i=0
if [ $i ]; then
    echo "即使是 0 , 这里也会输出"
fi

# 写成多行
var='abc'
if [[ "${var}" -eq "abc" ]]; then
    echo "abc -eq abc result is: true"
fi
# Output: abc -eq abc result is: true

# if else 语句
# ----------------------------------------
if [[ 2 -ne 1 ]]; then
    echo "true"
else
    echo "false"
fi
# Output: true

# if elif else 语句
# ----------------------------------------
x=10
y=20
if [[ ${x} > ${y} ]]; then
    echo "${x} > ${y}"
elif [[ ${x} < ${y} ]]; then
    echo "${x} < ${y}"
else
    echo "${x} = ${y}"
fi
# Output: 10 < 20
