names = Array.new(20)
puts names.size  # 返回 20
puts names.length # 返回 20

names = Array.new(4, "mac")

puts "#{names}"

nums = Array.new(10) { |e| e = e * 2 }

puts "#{nums}"

nums = Array.[](1, 2, 3, 4,5)
puts "#{nums}"


nums = Array[1, 2, 3, 4,5]
puts "#{nums}"

digits = Array(0..9)

puts "#{digits}"

digits = Array(0..9)

num = digits.at(6)

puts "#{num}"

array = [1, 2, 3]
array.push(4)  # 添加元素4到数组末尾
puts array  # 输出 [1, 2, 3, 4]

array.pop  # 删除数组末尾的元素
puts array  # 输出 [1, 2, 3]

array.shift  # 删除数组第一个元素
puts array  # 输出 [2, 3]

array.unshift(1)  # 在数组开头添加元素1
puts array  # 输出 [1, 2, 3]

array.each do |element|
  puts element
end
# 依次输出1, 2, 3

array.map do |element|
  element * 2
end
# 返回一个新数组，其中每个元素都是原数组对应元素的2倍

array.select do |element|
  element > 2
end
# 返回一个新数组，其中包含原数组中所有大于2的元素

array.sort  # 返回一个新数组，其中元素按升序排列
