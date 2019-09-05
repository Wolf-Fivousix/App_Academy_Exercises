require "byebug"
def deep_dup(arr)
    copy_array = []
    arr.each do |ele|
        temporary_array = []
        if ele.is_a?(Array)
            temporary_array << deep_dup(ele)
        else
            temporary_array << ele
        end
        copy_array += temporary_array
    end
    copy_array
end

# arr = [[1,2],[3,4]]
arr = [[[1,2],[3,4],5]]
arr2 = deep_dup(arr)

# p arr.object_id == arr2.object_id       # => False
# p arr[0].object_id == arr2[0].object_id # => False
# p arr[0][1].object_id == arr2[0][1].object_id # => False
# p "Loop array"
# arr.each.with_index do |array, i|
#     p arr[i].object_id == arr2[i].object_id
# end




robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

# robot_parts_copy = deep_dup(robot_parts)
# robot_parts_copy[1] << "LEDs"
# p robot_parts[1] # => ["capacitors", "resistors", "inductors"]
# p robot_parts
# p "____________"
# p robot_parts_copy
# p robot_parts[0].object_id == robot_parts_copy[0].object_id
# robot_parts[0][0] = "ALmonds"
# puts
# p robot_parts
# p "____________"
# p robot_parts_copy

## Food for thought for later...
# require "byebug"
# def deep_dup2(arr)
#     return [] if arr == nil
#     return [arr] unless arr.is_a?(Array) 
#     # debugger
#     new_array = []
#     new_array << deep_dup2(arr.first)
#     new_array << deep_dup2(arr[1..-1])
#     new_array
#     # deep_dup2(arr.first) + deep_dup2(arr[1..-1])

# end
# p "-------------"
# # p robot_parts
# p deep_dup2(robot_parts)

require "byebug"
def bsearch(array, target)
    return nil if array.empty?
    mid = array.length / 2
    return mid if target == array[mid]

    left_side = array[0...mid]
    right_side = array[mid+1..-1]
    # debugger
    if target > array[mid]
        if bsearch(right_side, target) == nil
            return nil
        else
            mid + 1 + bsearch(right_side, target)
        end
    else
        bsearch(left_side, target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil


def merged_sort(arr)
    return arr if arr.length <= 1
    left_arr = arr[0...arr.length/2]
    right_arr = arr[arr.length/2..-1]
    
    combine(merged_sort(left_arr), merged_sort(right_arr))
end

def combine(left_sorted, right_sorted)
    sorted = []
    until left_sorted.empty? || right_sorted.empty?
        # sorted << (left_sorted[0] < right_sorted[0]) ? left_sorted.shift : right_sorted.shift
        if left_sorted[0] < right_sorted[0]
            sorted << left_sorted.shift
        else
            sorted << right_sorted.shift
        end
    end
    sorted + left_sorted + right_sorted
end

# p merged_sort([1, 6, 3, 3, 5, 2])
# p merged_sort([-3, 6, 12, -1, 0, 9, 15, 25, 0, 8, 13, 11, 90, 1564])

def array_subsets(arr)
    return [[]] if arr.empty?
    partial_subset = array_subsets(arr[0..-2])
    addition = partial_subset.map {|ele| ele + [arr[-1]]}
    partial_subset + addition
end

# p array_subsets([])
# p array_subsets([1])
# p array_subsets([1,2])
# p array_subsets([1,2,3])
# p array_subsets([1,2,3,4])

def permutation(array)
    return array if array.length == 1

    smaller = permutation(array[0...-1])
    combination_array = []
    (smaller.length + 1).times do |index|
        combination_array += smaller.dup.insert(index, array[-1])
        # debugger
    end
    combination_array
end

#It is! See the result?? =D

p [1].permutation.to_a #=> [[1]]
# p [1,2].permutation.to_a
# p [1,2,3].permutation.to_a
# p [1,2,3,4].permutation.to_a

# p permutation([1])
# p permutation([1,2])
# p permutation([1,2,3])
# p permutation([1,2,3,4])

# [1]

# [1,2],      [2,1]


# [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]