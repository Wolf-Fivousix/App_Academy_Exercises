# My Each
# Extend the Array class to include a method named my_each that takes a block,
# calls the block on every element of the array,
#  and returns the original array.
# Do not use Enumerable's each method. I want to be able to write:
# My Select
# Now extend the Array class to include my_select that takes a block 
# and returns a new array containing only elements that satisfy the block. 
# Use your my_each method!

# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

# My Zip
# Write my_zip to take any number of arguments. 
# It should return a new array containing self.length elements.
# Each element of the new array should be an array with a length of the
#  input arguments + 1 and contain the merged elements at that index. 
#  If the size of any argument is less than self, nil is returned 
#  for that location.

# My Rotate
# Write a method my_rotate that returns a new array containing all 
# the elements of the original array in a rotated order. By default, the array should rotate by one element. 
# If a negative value is given, the array is rotated in the opposite direction.

# My Join
# my_join returns a single string containing all the elements of the array, 
# separated by the given string separator. If no separator is given, an empty string is used.

# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

class Array
    def my_each(&prc)
        self.map { |element| prc.call(element) }
        self
    end
    
    def my_select(&prc)
        new_array = []
        self.my_each { |element| new_array << element if prc.call(element) }
        new_array
        #self.inject([]) { |new_array, element| prc.call(element) ? new_array += [element] : new_array }
    end

    def my_reject(&prc)
        self.inject([]) { |new_arr, element| !prc.call(element) ? new_arr += [element] : new_arr }
        # self.inject([]) { |new_arr, element| prc.call(element) ? new_arr : new_arr += [element] }
    end

    def my_any?(&prc)
        self.my_each { |element| return true if prc.call(element) }
        false
    end

     def my_all?(&prc)
       self.my_each { |element| return false if !prc.call(element) }
        true 
    end

    def my_flatten
        return [self] if !self.is_a?(Array)
        result = []
        self.each do |sub|
            # sub = 1
            # sub = [1]
            if !sub.is_a?(Array)
                result += [sub]
            else
                result += sub.my_flatten
            end
        end
        result
    end

    def my_zip(*arrays)
        result = []
        self.each.with_index do |ele, idx|
            temp = []
            temp << self[idx]
            #arrays.each { |arr| temp << arr[idx] } #if you can't find it, it also gives nil 
             temp += arrays.map { |arr| arr[idx]  } #map gives automatically nil
            result << temp
        end
        result
    end

    def my_rotate(num = 1)
        new_array = self.map {|i| i}
        if num > 0
            num.times do
                l1 = new_array.shift
                new_array.push(l1)
            end
        else
            (-num).times do
                l2 = new_array.pop
                new_array.unshift(l2)
            end
        end
        new_array
    end

    def my_join(separator = "")
        #self.inject("") { |new_string, char| new_string += char + separator }
        new_string = ""
        (0...self.length-1).each do |idx|
            new_string += self[idx] + separator
        end
        new_string += self[-1]
        new_string
        
    end

    def my_reverse
        # Iteractive Method
        # return self if self.length == 1
        # new_arr = []
        # i = self.length - 1
        # while (i >= 0)
        #     new_arr << self[i]
        #     i -= 1
        # end
        # new_arr

        # Recursive Method
        return self if self.length == 1
        [self[-1]] + self[0..-2].my_reverse
    end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# Example:
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# Example:

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# Example:
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]