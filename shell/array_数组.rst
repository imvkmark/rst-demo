
数组
----

bash 只支持一维数组。

数组下标从 0 开始，下标可以是整数或算术表达式，其值应大于或等于 0。

创建数组
^^^^^^^^
.. image:: /_static/images/2020/0319/131240.png
.. code-block:: text

   # 创建数组的不同方式
   nums=([2]=2 [0]=0 [1]=1)
   colors=(red yellow "dark blue")

访问数组元素
^^^^^^^^^^^^


* **访问数组的单个元素：**

.. code-block:: text

   echo ${nums[1]}
   # Output: 1


* **访问数组的所有元素：**

.. code-block:: text

   echo ${colors[*]}
   # Output: red yellow dark blue

   echo ${colors[@]}
   # Output: red yellow dark blue

上面两行有很重要（也很微妙）的区别：

为了将数组中每个元素单独一行输出，我们用 ``printf`` 命令：

.. code-block:: text

   printf "+ %s\n" ${colors[*]}
   # Output:
   # + red
   # + yellow
   # + dark
   # + blue

为什么\ ``dark``\ 和\ ``blue``\ 各占了一行？尝试用引号包起来：

.. code-block:: text

   printf "+ %s\n" "${colors[*]}"
   # Output:
   # + red yellow dark blue

现在所有的元素都在一行输出 —— 这不是我们想要的！让我们试试\ ``${colors[@]}``

.. code-block:: text

   printf "+ %s\n" "${colors[@]}"
   # Output:
   # + red
   # + yellow
   # + dark blue

在引号内，\ ``${colors[@]}``\ 将数组中的每个元素扩展为一个单独的参数；数组元素中的空格得以保留。


* **访问数组的部分元素：**

.. code-block:: text

   echo ${nums[@]:0:2}
   # Output:
   # 0 1

在上面的例子中，\ ``${array[@]}`` 扩展为整个数组，\ ``:0:2``\ 取出了数组中从 0 开始，长度为 2 的元素。

访问数组长度
^^^^^^^^^^^^

.. code-block:: text

   echo ${#nums[*]}
   # Output:
   # 3

向数组中添加元素
^^^^^^^^^^^^^^^^

向数组中添加元素也非常简单：

.. code-block:: text

   colors=(white "${colors[@]}" green black)
   echo ${colors[@]}
   # Output:
   # white red yellow dark blue green black

上面的例子中，\ ``${colors[@]}`` 扩展为整个数组，并被置换到复合赋值语句中，接着，对数组\ ``colors``\ 的赋值覆盖了它原来的值。

从数组中删除元素
^^^^^^^^^^^^^^^^

用\ ``unset``\ 命令来从数组中删除一个元素：

.. code-block:: text

   unset nums[0]
   echo ${nums[@]}
   # Output:
   # 1 2

数组示例源码
^^^^^^^^^^^^

**:keyboard: 『示例源码』** `array-demo.sh <https://github.com/dunwu/os-tutorial/tree/master/codes/shell/demos/array-demo.sh>`_
