require_relative 'enumerables'

arr = [1, 2, 3, 4]
arr_1 = [1, 'string', nil, 0.1]
hash = {:a=>1, :b=>2, :c=>3}

# each vs my_each
# puts 'each:'
# arr.each  { |item| puts item }
# puts 'my_each:'
# arr.my_each { |item| puts item}


# each_with_index vs my_each_with_index
# puts 'each_with_index:'
# arr.each_with_index { |value, index| puts value if index.even?}
# puts 'my_each_with_index:'
# arr.my_each_with_index { |value, index| puts value if index.even?}


# select vs my_select
# puts 'select:'
# arr.select { |item| puts item != 2}
# puts 'my_select:'
# arr.my_select { |item| puts item != 2}

# all vs my_all?
puts 'all?:'
arr.all? { |item| puts item.is_a? Integer}
puts 'my_all?:'
arr.my_all? { |item| puts item.is_a? Integer}

# any vs my_any?
puts 'any?:'

puts 'my_any?:'

#  none vs my_none?
puts 'none?:'

puts 'my_none?:'

# count vs my_count?
puts 'count:'

puts 'my_count:'

# map vs my_map
puts 'map:'

puts 'my_map:'

# inject vs my_inject
puts 'inject:'

puts 'my_inject:'

