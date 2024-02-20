# ruby 元编程
## ruby元编程介绍和使用场景
元编程DSL： 高度抽象化。
ruby的高级特性。
例如， user.email就是利用了ruby的元编程实现的。
## ruby的类结构
```
#class B
module B
  def hi
    p 'hi b'
  end
end
#class A < B
class A
  include B
  def hi
    super
    p 'hi a'
  end
end
#p A.class.class
A.new.hi
# p A.ancestors
```
一个类和一个class很大程度上是一致的，可以理解为：
一个类是一个特殊的module，能实例化的class。
### ruby的方法查找
super是调用父类的同名方法，但是在上面的例子里并不是调用父类的同名方法。
ancestors可以查找当前的类的注入继承的关系。

基础方法使用：include extend prepend
区别和作用

## 单例方法 Singleton Method
```
class A
  def self.hi
  end
end
A.hi
```
在ruby里，类方法实际上就是单例方法，在写代码的效果上看最终都是一致的,用法是完全一致的。
定义单例方法的方式：

```

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
```
例如:
```
irb
irb(main):001> a = "a"
=> "a"
irb(main):002* def a.hi
irb(main):003*   p "hi"
irb(main):004> end
=> :hi
irb(main):005> a.hi
"hi"
=> "hi"
irb(main):006>
```
例如:
```
class A
irb(main):007> end
=> nil
irb(main):008* def A.hi
irb(main):009*   p "hi"
irb(main):010> end
=> :hi
irb(main):011> A.hi
"hi"
=> "hi"
irb(main):012> A.singleton_methods
=> [:hi]
irb(main):013* class B
irb(main):014*   def self.hello
irb(main):015*   end
irb(main):016> end
=> :hello
irb(main):017> B.singleton_methods
=> [:hello]
irb(main):018* class A
irb(main):019*   def self.hello
irb(main):020*   end
irb(main):021> end
=> :hello
irb(main):022> A.singleton_methods
=> [:hi, :hello]
irb(main):023> A
=> A
 a.singleton_class
=> #<Class:#<String:0x000055a541034b98>>
irb(main):027> A.singleton_class
=> #<Class:A>
```
### self
```
class A
  p self
  class << self
    p self
  end

  def hello
    p self
  end
end
A.new.hello

```
output:

```
ruby self.rb
A
#<Class:A>
#<A:0x00005614efbc8798>
```
### bariables变量
```
class B
  # 类的实例变量
  #@a = 1 一般不这样写
  # 类变量
  @@b = 2

  def initialize
    # 实例的实例变量
    @c = 3
    # 类变量
    @@d = 4
  end

  class << self
    @e = 5
    @@f = 6
  end

  def a
    @a
  end

  def c
  end
  def self.a
    @a
  end
  def c_variables
    [@@b, @@d, @@f]
  end

  b = B.new
  p B.instance_variables
  p B.class_variables
  p b.instance_variables
  p B.singleton_class.instance_variables
  p B.singleton_class.class_variables
end
```

## block的进阶使用
```
def counter n
  proc {n += 1}
end
a = counter(10)
#a => 11
#a => 12
p a.call
p a.call
p a.call
p a.call
```
输出：
```
ruby block.rb
11
12
13
14
```

使用ruby元编程写：
```
class EnuTest
end

enu = EnuTest.new do |x|
  x << 1
  x << 3
  x << proc {"hello"}
end
enu.next  # => 1
enu.next  # => 3
enu.next  # => "hello"
enu.next  # => raise error "EOF"
```
答案：
```
# 答案
class EnuTest

  def initialize &block
    @eb = EnuBlock.new
    yield @eb
  end

  def next
    @eb.next
  end

end

class EnuBlock

  def initialize
    @blocks = []
  end

  def << obj
    if obj.is_a? Proc
      @blocks << obj
    else
      @blocks << proc { obj }
    end
  end

  def next
    if @blocks.empty?
      raise "EOF"
    else
      @blocks.shift.call
    end
  end

end
```

## method_missing 和 define_method
一般不使用这2个方法，因为排错的时候不是很方便，会带来问题

```
 irb
irb(main):001* module B
irb(main):002*   def hello
irb(main):003*     p 'hello'
irb(main):004*   end
irb(main):005*   def method_missing name
irb(main):006*     p name
irb(main):007*   end
irb(main):008> end
=> :method_missing
irb(main):009* class A
irb(main):010*   include B
irb(main):011*   def hi
irb(main):012*     p 'hi'
irb(main):013*   end
irb(main):014> end
=> :hi
irb(main):015> a = A.new
=> #<A:0x000055e30dec0478>
irb(main):016> a.hi
"hi"
=> "hi"
irb(main):017> a.hello
"hello"
=> "hello"
irb(main):018> a.hello_word
:hello_word
=> :hello_word
irb(main):019> a.hello_world
:hello_world
=> :hello_world
irb(main):020> a.ascascn
:ascascn
=> :ascascn
irb(main):021> a.sss
:sss
=> :sss
irb(main):022> a.ancestors
:ancestors
=> :ancestors
irb(main):023> A.ancestors
=> [A, B, Object, PP::ObjectMixin, Kernel, BasicObject]
irb(main):024>
```
实现代码
```


# 请实现class A的代码。
class A
end

A.title = "eggman.tv"
A.title # => eggman.tv

# 答案
# 思路，首先实现以下代码：
class A
  @@attributes = {}

  def self.title
    @@attributes[:title]
  end

  def self.title= value
    @@attributes[:title] = value
  end

end


# 然后再使用method_missing来修改:
class A
  @@attributes = {}

  class << self
    def method_missing method_name, *params
      method_name = method_name.to_s

      if method_name =~ /=$/
        @@attributes[method_name.sub('=', '')] = params.first
      else
        @@attributes[method_name]
      end
    end
  end

end

# define_method
class User < ActiveRecord::Base
  STATUS = %w[pending activated suspended]

  STATUS.each do |status|
    define_method "is_#{status}?" do
      self.status == status
    end
  end
end

```

## class_eval 和 instance_eval
class_eval => class_exec
instance_eval => instance_exec
module_eval => module_exec
一般使用eval，不使用exec
```
class A
  B = "b"
  @@a = 1

  def a
    @@a
  end

end
A.class_eval "@@a = 2"
A.class_eval "B.replace('b2')"
p A.new.a
p A::B
```
实际测试：
```
irb
irb(main):001> a = "a"
=> "a"
irb(main):002> a.class_eval
(irb):2:in `<main>': undefined method `class_eval' for "a":String (NoMethodError)
	from /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.8.3/exe/irb:9:in `<top (required)>'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `load'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `<main>'
irb(main):003> a.instance_eval
(irb):3:in `instance_eval': wrong number of arguments (given 0, expected 1..3) (ArgumentError)
	from (irb):3:in `<main>'
	from /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.8.3/exe/irb:9:in `<top (required)>'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `load'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `<main>'
irb(main):004* a.instance_eval do
irb(main):005*   def hi
irb(main):006*     p "hi"
irb(main):007*   end
irb(main):008> end
=> :hi
irb(main):009> a.hi
"hi"
=> "hi"
irb(main):010> "b".hi
(irb):10:in `<main>': undefined method `hi' for "b":String (NoMethodError)
	from /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.8.3/exe/irb:9:in `<top (required)>'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `load'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `<main>'
irb(main):011* class A
irb(main):012> end
=> nil
irb(main):013* A.instance_eval do
irb(main):014*   def hello
irb(main):015*     p 'hello'
irb(main):016*   end
irb(main):017> end
=> :hello
irb(main):018> A.hello
"hello"
=> "hello"
irb(main):019>
irb(main):020* A.class_eval do
irb(main):021*   def hey
irb(main):022*     p 'hey'
irb(main):023*   end
irb(main):024> end
=> :hey
irb(main):025> A.hey
(irb):25:in `<main>': undefined method `hey' for A:Class (NoMethodError)
	from /home/linlin/.asdf/installs/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.8.3/exe/irb:9:in `<top (required)>'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `load'
	from /home/linlin/.asdf/installs/ruby/3.0.3/bin/irb:25:in `<main>'
irb(main):026> A.new.hey
"hey"
=> "hey"
irb(main):027* A.class_eval do
irb(main):028*   def self.haha
irb(main):029*     p 'haha'
irb(main):030*   end
irb(main):031> end
=> :haha
irb(main):032> A.haha
"haha"
=> "haha"

```
