def foo
  puts "Hello, World!"
end

alias bar foo

bar # 调用别名
