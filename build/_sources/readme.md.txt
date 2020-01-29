## 说明

本文使用 [Sphinx Doc](http://www.sphinx-doc.org/en/master/index.html) 生成

### Mac 安装

```sh
# Sphinx
$ brew install python3
$ pip3 install -U Sphinx

# markdown
$ pip3 install --upgrade recommonmark

# theme
$ pip3 install sphinx_rtd_theme
$ pip3 install msmb_theme
```

### 使用快速工具来初始化项目

```
$ sphinx-quickstart

欢迎使用 Sphinx 2.3.1 快速配置工具。

请输入接下来各项设置的值（如果方括号中指定了默认值，直接
按回车即可使用默认值）。

已选择根路径：.

布置用于保存 Sphinx 输出的构建目录，有两种选择。
一是在根路径下创建“_build”目录，二是在根路径下创建“source”
和“build”两个独立的目录。
> 独立的源文件和构建目录（y/n） [n]: 

项目名称会出现在文档的许多地方。
> 项目名称: Lang-Shell
> 作者名称: Duoli
> 项目发行版本 []: 1.0.0

If the documents are to be written in a language other than English,
you can select a language here by its language code. Sphinx will then
translate text that it generates into that language.

For a list of supported codes, see
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-language.
> 项目语种 [en]: zh

创建文件 ./conf.py。
创建文件 ./index.rst。
创建文件 ./Makefile。
创建文件 ./make.bat。

完成：已创建初始目录结构。

你现在可以填写主文档文件 ./index.rst 并创建其他文档源文件了。 用 Makefile 构建文档，像这样：
 make builder
此处的“builder”是支持的构建器名，比如 html、latex 或 linkcheck。
```


### 生成Html

```
$ make html

正在运行 Sphinx v2.3.1
正在加载翻译 [zh]... 完成
制作输出目录... 完成
构建 [mo]： 0 个 po 文件的目标文件已过期
构建 [html]： 1 个源文件的目标文件已过期
更新环境: [新配置] 已添加 1，0 已更改，0 已移除
阅读源... [100%] index                                                                                                                                     
查找当前已过期的文件... 没有找到
pickling环境... 完成
检查一致性... 完成
准备文件... 完成
写入输出... [100%] index                                                                                                                                    
generating indices...  genindex完成
writing additional pages...  search完成
复制静态文件... ... 完成
copying extra files... 完成
dumping search index in Chinese (code: zh)... 完成
dumping object inventory... 完成
构建 成功.

HTML 页面保存在 _build/html 目录。
```


```sh
# 生成
sphinx-build -b html source build
```