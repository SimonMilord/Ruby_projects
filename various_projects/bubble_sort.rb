# frozen_string_literal: true

def bubble_sort(array)
  return array if array.length <= 1

  swapped = true

  while swapped
    swapped = false
    0.upto(array.length - 2) do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end
  end
  array
end

array = [4, 3, 78, 2, 0, 2]

puts(bubble_sort(array))

# Example:
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

# bubble sort : where each element is compared to the one next to it and they are swapped if
# the one on the left is larger than the one on the right.
# This continues until the array is eventually sorted.

# pseudo code:
# 1) check first and second value
# 2) swap them if in order, else continues
# 3) repeat until the array is sorted (either put a counter on swaps or boolean set to false )
