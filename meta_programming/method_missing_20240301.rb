class B
  def initialize
    @b = A.new
  end

  def method_missing(method_name, *args, &block)
    @b.send(method_name, *args, &block)
  end
end

class A
  def hi
    puts "Hi from #{self.class}"
  end
end

# 创建一个 B 的实例
b = B.new
# 调用不存在的方法
b.hi

