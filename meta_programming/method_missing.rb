# todo
# 请实现class A的代码
# 不使用内置的方法
class A
end
A.title = "haha"
A.title # => "haha"

class A
  @@attributes = {}
  def self.title
    @@attributes[:title]
  end
  def self.title = value
    @@attributes[:title] = value
  end
end

a = "hello"
a.length
String.ancestors

#使用method_missing来修改
class A
  @@attributes = {}
  class << self
    def method_missing method_name, *params
      method_name = method_name.to_s

      if method_name =~ /=$/
        @@attributes[method_name.sub("=", '')] = params
      else
        @@attributes[method_name]
      end

    end
  end
end
# define_method
class User < ActiveRecord::Base
  def is_pending?
    self.status == 'pending'
  end
  def is_activated?
    slef.status == 'activated'
  end
  def is_susended?
    self.status == 'suspended'
  end
end

class User < ActiveRecord::Base
  STATUS = %w[pending activated suspended]
  STATUS.each do |status|
    define_method "is_#{status}?" do
    self.status == status
    end
  end
end
