def say_hi
  puts "hihi"
end

def say_goodbye
  puts "goodbye"
end
# 使用send方式调用方法
name = "say_hi"
send(name)

m = 12.method("+")
# => `method` gets the `+` method defined in the `Fixnum` instance
# m.class
# => Method

m.call(3)    #=> 15
puts m.call(3)
# `3` is passed inside the `+` method as argument
m.call(20)   #=> 32
puts m.call(20)

