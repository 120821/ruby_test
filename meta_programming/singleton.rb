class A
  # 这是用的最多的方法
  def self.hi
  end
  # 这样也是可以的
  def << self
    def hello
    end
    def abc
    end
  end
end
A.hi
A.hello
a.abc


# 定义单例方法的方式
# 1
class B
  def self.hi
    p 'hi'
  end
end

# 2
class B
  class << self
    def hello
      p 'hello'
    end
  end
end

# 3
def A.key
  p 'key'
end
# 4
(class << B; self; end).class_eval do
  def you
    p 'you'
  end
end
