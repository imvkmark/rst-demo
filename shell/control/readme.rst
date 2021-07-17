控制语句
--------

条件语句
^^^^^^^^

跟其它程序设计语言一样，Bash 中的条件语句让我们可以决定一个操作是否被执行。结果取决于一个包在 ``[[ ]]`` 里的表达式。

由 ``[[ ]]`` （ ``sh`` 中是 ``[ ]`` ）包起来的表达式被称作 **检测命令** 或 **基元** 。这些表达式帮助我们检测一个条件的结果。这里可以找到有关 `bash 中单双中括号区别 <http://serverfault.com/a/52050>`_ 的答案。

共有两个不同的条件表达式： ``if`` 和 ``case`` 。

``if``
~~~~~~~~~~

``if`` 在使用上跟其它语言相同。如果中括号里的表达式为真，那么 ``then`` 和 ``fi`` 之间的代码会被执行。 ``fi`` 标志着条件代码块的结束。同样，可以使用 ``if..else`` 语句 或者 ``if..elif..else`` ，使用起来也很方便。

.. include:: code/operation.sh
    :code: sh


``case``
~~~~~~~~~~~~

如果你需要面对很多情况，分别要采取不同的措施，那么使用 ``case`` 会比嵌套的 ``if`` 更有用。使用 ``case`` 来解决复杂的条件判断，看起来像下面这样：

.. include:: code/case.sh
    :code: sh

每种情况都是匹配了某个模式的表达式。 ``|`` 用来分割多个模式， ``)`` 用来结束一个模式序列。第一个匹配上的模式对应的命令将会被执行。 ``*`` 代表任何不匹配以上给定模式的模式。命令块儿之间要用 ``;;`` 分隔。

循环语句
^^^^^^^^

循环其实不足为奇。跟其它程序设计语言一样，bash 中的循环也是只要控制条件为真就一直迭代执行的代码块。

Bash 中有四种循环： ``for`` ， ``while`` ， ``until`` 和 ``select`` 。

``for`` 循环
~~~~~~~~~~~~~~~

``for`` 与它在 C 语言中的姊妹非常像。看起来是这样：

.. code-block:: text

   for arg in elem1 elem2 ... elemN
   do
     ### 语句
   done

在每次循环的过程中， ``arg`` 依次被赋值为从 ``elem1`` 到 ``elemN`` 。这些值还可以是通配符或者 `大括号扩展 <https://github.com/denysdovhan/bash-handbook/blob/master/translations/zh-CN/README.md#%E5%A4%A7%E6%8B%AC%E5%8F%B7%E6%89%A9%E5%B1%95>`_ 。

当然，我们还可以把 ``for`` 循环写在一行，但这要求 ``do`` 之前要有一个分号，就像下面这样：

.. code-block:: text

   for i in {1..5}; do echo $i; done

还有，如果你觉得 ``for..in..do`` 对你来说有点奇怪，那么你也可以像 C 语言那样使用 ``for`` ，比如：

.. code-block:: text

   for (( i = 0; i < 10; i++ )); do
     echo $i
   done

当我们想对一个目录下的所有文件做同样的操作时， ``for`` 就很方便了。举个例子，如果我们想把所有的 ``.bash`` 文件移动到 ``script`` 文件夹中，并给它们可执行权限，我们的脚本可以这样写：

.. code-block:: text

   DIR=/home/zp
   for FILE in ${DIR}/*.sh; do
     mv "$FILE" "${DIR}/scripts"
   done
   # 将 /home/zp 目录下所有 sh 文件拷贝到 /home/zp/scripts

**:keyboard: 『示例源码』** `for-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/for-demo.sh>`_

``while`` 循环
~~~~~~~~~~~~~~~~~

``while`` 循环检测一个条件，只要这个条件为 *真* ，就执行一段命令。被检测的条件跟 ``if..then`` 中使用的 `基元 <https://github.com/denysdovhan/bash-handbook/blob/master/translations/zh-CN/README.md#%E5%9F%BA%E5%85%83%E5%92%8C%E7%BB%84%E5%90%88%E8%A1%A8%E8%BE%BE%E5%BC%8F>`_ 并无二异。因此一个 ``while`` 循环看起来会是这样：

.. code-block:: text

   while [[ condition ]]
   do
     ### 语句
   done

跟 ``for`` 循环一样，如果我们把 ``do`` 和被检测的条件写到一行，那么必须要在 ``do`` 之前加一个分号。

比如下面这个例子：

.. code-block:: text

   ### 0到9之间每个数的平方
   x=0
   while [[ ${x} -lt 10 ]]; do
     echo $((x * x))
     x=$((x + 1))
   done
   #  Output:
   #  0
   #  1
   #  4
   #  9
   #  16
   #  25
   #  36
   #  49
   #  64
   #  81

**:keyboard: 『示例源码』** `while-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/while-demo.sh>`_

``until`` 循环
~~~~~~~~~~~~~~~~~

``until`` 循环跟 ``while`` 循环正好相反。它跟 ``while`` 一样也需要检测一个测试条件，但不同的是，只要该条件为 *假* 就一直执行循环：

.. code-block:: text

   x=0
   until [[ ${x} -ge 5 ]]; do
     echo ${x}
     x=`expr ${x} + 1`
   done
   #  Output:
   #  0
   #  1
   #  2
   #  3
   #  4

**:keyboard: 『示例源码』** `until-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/until-demo.sh>`_

``select`` 循环
~~~~~~~~~~~~~~~~~~

``select`` 循环帮助我们组织一个用户菜单。它的语法几乎跟 ``for`` 循环一致：

.. code-block:: text

   select answer in elem1 elem2 ... elemN
   do
     ### 语句
   done

``select`` 会打印 ``elem1..elemN`` 以及它们的序列号到屏幕上，之后会提示用户输入。通常看到的是 ``$?`` （ ``PS3`` 变量）。用户的选择结果会被保存到 ``answer`` 中。如果 ``answer`` 是一个在 ``1..N`` 之间的数字，那么 ``语句`` 会被执行，紧接着会进行下一次迭代 —— 如果不想这样的话我们可以使用 ``break`` 语句。

一个可能的实例可能会是这样：

.. code-block:: text

   #!/usr/bin/env bash

   PS3="Choose the package manager: "
   select ITEM in bower npm gem pip
   do
   echo -n "Enter the package name: " && read PACKAGE
   case ${ITEM} in
     bower) bower install ${PACKAGE} ;;
     npm) npm install ${PACKAGE} ;;
     gem) gem install ${PACKAGE} ;;
     pip) pip install ${PACKAGE} ;;
   esac
   break # 避免无限循环
   done

这个例子，先询问用户他想使用什么包管理器。接着，又询问了想安装什么包，最后执行安装操作。

运行这个脚本，会得到如下输出：

.. code-block:: text

   $ ./my_script
   1) bower
   2) npm
   3) gem
   4) pip
   Choose the package manager: 2
   Enter the package name: gitbook-cli

**:keyboard: 『示例源码』** `select-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/select-demo.sh>`_

``break`` 和 ``continue``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

如果想提前结束一个循环或跳过某次循环执行，可以使用 shell 的 ``break`` 和 ``continue`` 语句来实现。它们可以在任何循环中使用。

..

   ``break`` 语句用来提前结束当前循环。

   ``continue`` 语句用来跳过某次迭代。


**:keyboard: 『示例源码』** `break-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/break-demo.sh>`_

.. code-block:: text

   # 查找 10 以内第一个能整除 2 和 3 的正整数
   i=1
   while [[ ${i} -lt 10 ]]; do
     if [[ $((i % 3)) -eq 0 ]] && [[ $((i % 2)) -eq 0 ]]; then
       echo ${i}
       break;
     fi
     i=`expr ${i} + 1`
   done
   # Output: 6

**:keyboard: 『示例源码』** `continue-demo.sh <https://github.com/dunwu/os-tutorial/blob/master/codes/shell/demos/statement/continue-demo.sh>`_

.. code-block:: text

   # 打印10以内的奇数
   for (( i = 0; i < 10; i ++ )); do
     if [[ $((i % 2)) -eq 0 ]]; then
       continue;
     fi
     echo ${i}
   done
   #  Output:
   #  1
   #  3
   #  5
   #  7
   #  9
