# on output n elements
# if n < 2
#   return
# else
#   sort left half of elements
#   sort right half of elements
#   merge sorted havles

def merge_sort(array)
  # base case
  return array if array.length < 2
  # cut array in half and apply merge sort recursively until array is smaller than 2
  mid = array.length / 2
  left_half = merge_sort(array.slice(0...mid))
  right_half = merge_sort(array.slice(mid..array.length))

  merge(left_half, right_half)

end

def merge(left_half, right_half)
  sorted = []
# select the smallest value and pushes it to the sorted array
  while !left_half.empty? && !right_half.empty? do
    if left_half[0] < right_half[0]
      sorted.push(left_half.shift)
    else
      sorted.push(right_half.shift)
    end
  end
  return sorted.concat(left_half).concat(right_half)
end


puts merge_sort([2,6,9,1,3,5,7,4,8,0])