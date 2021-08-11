基本语法
--------

解释器
^^^^^^

前面虽然两次提到了 ``#!`` ，但是本着重要的事情说三遍的精神，这里再强调一遍：

在 shell 脚本， ``#!`` 告诉系统其后路径所指定的程序即是解释此脚本文件的 Shell 解释器。 ``#!`` 被称作 `shebang（也称为 Hashbang ） <https://zh.wikipedia.org/wiki/Shebang>`_ 。

``#!`` 决定了脚本可以像一个独立的可执行文件一样执行，而不用在终端之前输入 ``sh`` , ``bash`` , ``python`` , ``php`` 等。

.. code-block:: sh

   # 以下两种方式都可以指定 shell 解释器为 bash，第二种方式更好
   #!/bin/bash
   #!/usr/bin/env bash

注释
^^^^

注释可以说明你的代码是什么作用，以及为什么这样写。

shell 语法中，注释是特殊的语句，会被 shell 解释器忽略。


* 单行注释 - 以 ``#`` 开头，到行尾结束。
* 多行注释 - 以 ``:<<EOF`` 开头，到 ``EOF`` 结束。

.. include:: code/comment.sh
   :code: sh

echo
^^^^

用于字符串的输出。

.. include:: code/echo.sh
   :code: sh

输出到重定向文件

.. include:: code/output.sh
   :code: sh

printf
^^^^^^

printf 用于格式化输出字符串。

默认，printf 不会像 echo 一样自动添加换行符，如果需要换行可以手动添加 ``\n`` 。

.. include:: code/print_f.sh
   :code: sh



printf 的转义符
~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - 序列
     - 说明
   * - ``\a``
     - 警告字符，通常为 ASCII 的 BEL 字符
   * - ``\b``
     - 后退
   * - ``\c``
     - 抑制（不显示）输出结果中任何结尾的换行字符（只在%b 格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
   * - ``\f``
     - 换页（formfeed）
   * - ``\n``
     - 换行
   * - ``\r``
     - 回车（Carriage return）
   * - ``\t``
     - 水平制表符
   * - ``\v``
     - 垂直制表符
   * - ``\\``
     - 一个字面上的反斜杠字符
   * - ``\ddd``
     - 表示 1 到 3 位数八进制值的字符。仅在格式字符串中有效
   * - ``\0ddd``
     - 表示 1 到 3 位的八进制值字符
