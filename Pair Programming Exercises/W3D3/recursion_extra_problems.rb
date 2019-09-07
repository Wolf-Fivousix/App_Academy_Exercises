#Problem 1: 

def sum_recur(array)
    return 0 if array.empty?
    array.last + sum_recur(array.take(array.length - 1))
end
p sum_recur([1,2,3,4,5])
p sum_recur([2,4,6,8])

#Problem 2: 

def includes?(array, target)
    return false if array.empty?
    return true if array.first == target
    includes?(array.drop(1), target)
end
p includes?([1,2,3,4,5], 3)
p includes?([2,4,6,8], 10)

# Problem 3: 

def num_occur(array, target)
    return 0 if array.empty?
    current_element = (array.first == target ? 1 : 0)
    current_element + num_occur(array.drop(1), target)
end
p num_occur([], 2)
p num_occur([2], 2)
p num_occur([1], 2)
p num_occur([1,2,2,2,4,5,6,2,2], 2)
p num_occur([5,1,2,3,6,5,5,152,6], 5)


# Problem 4: 

def add_to_twelve?(array)
    return false if array.length < 2
    return true if (array[0] + array[1]) == 12
    add_to_twelve?(array.drop(1))
end
puts "   Problem 4:"
p add_to_twelve?([1,2,3,4,5])
p add_to_twelve?([6,5,5,7])
p add_to_twelve?([0,0,0,0,0,12])

# Problem 5: 

def sorted?(array)
    return true if array.length < 2
    return false if array[0] > array[1]
    sorted?(array.drop(1))
end
puts "   Problem 5:"
p sorted?([1,2,3,4,5])
p sorted?([6,5,5,7])
p sorted?([0,0,0,0,0,12])
p sorted?([5,1,2,3,6,5,5,152,6])

# Problem 6: 

def reverse(string)
    return "" if string.empty?
    reverse(string[1..-1]) + string[0]
end
puts "   Problem 6:"
p reverse("Cachorro")
p reverse("Pupper")
