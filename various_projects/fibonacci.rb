def fibs(n)
  n1 = 0
  n2 = 1
  sequence = [n1, n2]
  while n > 2
    n3 = n1 + n2
    sequence.push(n3)
    n1 = n2
    n2 = n3
    n = n - 1
  end
  puts sequence
end
puts "Fibonacci sequence without recursion:"
fibs(5)
puts "and now recursively:"

def fibs_rec(n, sequence = [0,1])
  if n < 2
    return sequence.slice(0, sequence.length - 1)
  else
    sequence << sequence[-1] + sequence[-2]
  end
  fibs_rec(n -1, sequence)
end

puts fibs_rec(5)

# 0,1,1,2,3,5,8,13,21,34,55,89,144
  # 0 1 2 3 4 5 6 7