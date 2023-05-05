### ruby的irb
IRB是一个ruby交互式解释器，它允许用户在命令行界面上输入并执行ruby代码。IRB是一个非常有用的工具，可以帮助开发人员快速测试和调试代码，并且可以实时查看代码执行的结果。IRB提供了许多便捷的特性，例如自动补全和历史记录，可以大大提高开发效率。要启动irb，请在命令行界面上键入“irb”，然后按回车键即可开始使用。
### irb的简单使用
当你在命令行环境内键入“irb”后，即可进入irb环境。

下面是一些irb的简单命令：

1. 打印值：在irb环境中输入任意ruby代码，按下回车键，即可打印出代码执行后得到的结果。

例如：键入`puts 'Hello, World!'`，然后按回车键，即可在终端中打印出“Hello, World!”。

2. 查看帮助文档：键入`help`或`?`即可查看irb的帮助文档。

3. 历史记录：键入`history`可以查看你之前在irb中输入的历史记录。

4. 类和方法文档：键入`help <类名>`或`<类名>.<方法名>`可以查看类和方法的文档。

例如：键入`help Array`或`Array.new`。

5. 退出irb：可以使用`exit`或按下`Ctrl-D`来退出irb环境。

除此之外，还有一些快捷键可用于提高效率：

- Tab键: 自动补全命令、方法和文件名
- 上箭头: 回到上一个命令
- 按住`Ctrl`键加字符“r”: 搜索之前使用过的命令历史记录，然后按下回车键可执行搜索结果。
### curl 保存css或者js
要使用curl保存CSS或JS文件，可以使用以下命令：

1. 下载CSS文件：

```
curl -o style.css https://example.com/style.css
```

这将下载一个来自https://example.com/style.css的CSS文件，并将其保存为当前目录下的style.css文件。如果您想指定另一个目录，请提供该目录的完整路径。

2. 下载JavaScript文件：

```
curl -o script.js https://example.com/script.js
```

这将下载一个来自https://example.com/script.js的JavaScript文件，并将其保存为当前目录下的script.js文件。

您还可以使用-c参数追踪Cookies，并使用#号指定要保存的文件名。例如：

```
curl -c cookies.txt -o style.css# https://example.com/style.css
```

这将下载CSS文件和Cookies，并将其保存在当前目录下的style.css文件和cookies.txt文件中。
### array的简单使用
Ruby中的数组是一组有序的数据集合。下面是一些常见的数组操作：

1. 创建数组

可以使用方括号（[]）或Array.new方法来创建一个空的数组：

```ruby
array1 = []
array2 = Array.new
```

也可以在创建数组的同时添加元素：

```ruby
array3 = [1, 2, 3]
```

2. 访问数组元素

可以使用下标（从0开始）来访问数组元素：

```ruby
array = [1, 2, 3]
puts array[0]  # 输出1
puts array[1]  # 输出2
puts array[2]  # 输出3
```

还可以使用负数下标访问数组末尾的元素，例如：

```ruby
puts array[-1]  # 输出3
puts array[-2]  # 输出2
```

3. 改变数组元素

可以使用下标来改变数组元素的值：

```ruby
array = [1, 2, 3]
array[0] = 4
puts array  # 输出 [4, 2, 3]
```

4. 数组的方法

Ruby中的数组有许多实用的方法，例如：

```ruby
array = [1, 2, 3]
array.push(4)  # 添加元素4到数组末尾
puts array  # 输出 [1, 2, 3, 4]

array.pop  # 删除数组末尾的元素
puts array  # 输出 [1, 2, 3]

array.shift  # 删除数组第一个元素
puts array  # 输出 [2, 3]

array.unshift(1)  # 在数组开头添加元素1
puts array  # 输出 [1, 2, 3]

array.each do |element|
  puts element
end
# 依次输出1, 2, 3

array.map do |element|
  element * 2
end
# 返回一个新数组，其中每个元素都是原数组对应元素的2倍

array.select do |element|
  element > 2
end
# 返回一个新数组，其中包含原数组中所有大于2的元素

array.sort  # 返回一个新数组，其中元素按升序排列
```

上述只是数组操作的一些基础，Ruby中的数组拥有更多的方法和操作，可以根据实际需要进行学习和掌握。
### hash的简单使用
Ruby中的Hash是一种用于储存“键/值”对的数据类型，类似于Python中的字典。以下是Hash的简单使用：

1. 创建一个空的Hash:

```
empty_hash = {}
```

或者使用Hash.new方法创建空的Hash：

```
empty_hash = Hash.new
```

2. 创建一个具有键/值对的Hash：

```
person = {"name" => "John", "age" => 30, "height" => 175}
```

也可以使用冒号（：）来表示键/值对：

```
person = {name: "John", age: 30, height: 175}
```

3. 访问Hash中的值：

```
person["name"]
```

或者使用符号键来访问Hash中的值：

```
person[:name]
```

4. 添加一个键/值对到Hash中：

```
person["weight"] = 70
```

或者使用符号键添加一个键/值对：

```
person[:weight] = 70
```

5. 删除一个键/值对：

```
person.delete("age")
```

或者使用符号键删除一个键/值对：

```
person.delete(:age)
```

6. 遍历Hash：

```
person.each do |key, value|
  puts "#{key}: #{value}"
end
```

或者只遍历键或值：

```
person.keys.each do |key|
  puts key
end

person.values.each do |value|
  puts value
end
```

这些是Ruby中Hash的基础操作，可以帮助您开始使用Hash。
