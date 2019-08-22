# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def swapper(arr, idx_1, idx_2)
    temp_1 = arr[idx_2]
    temp_2 = arr[idx_1]
    arr[idx_1] = temp_1
    arr[idx_2] = temp_2
    arr
end

def is_sorted(arr)
    (1...arr.length).each do |index|
        return false if arr[index] < arr[index - 1]
    end
    true
end

def bubble_sort(array)
    while !is_sorted(array)
        (1...array.length).each do |index|
            swapper(array, index, index - 1) if array[index] < array[index - 1]
        end
    end
    array
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]
