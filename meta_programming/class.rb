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
#A.new.hi
p A.ancestors
