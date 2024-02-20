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
