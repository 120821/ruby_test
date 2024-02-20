
class A
  B = "b"
  @@a = 1

  def a
    @@a
  end

end
A.class_eval "@@a = 2"
A.class_eval "B.replace('b2')"
#A.class_exec "@@a = 2" # error
# 不支持代码块访问类变量和常量,可以使用字符串
#A.class_eval {B.replace('b2')}
p A.new.a
p A::B

module B
  def self.included base
    p 'included...'
    base.class_eval do
      set_logger :hi
    end
  end
  def hi
    p 'hi'
  end
end

class C
  def self.set_logger method_name
    # ...
  end
end
