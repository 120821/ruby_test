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
