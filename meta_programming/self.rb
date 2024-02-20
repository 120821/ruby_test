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
