# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    divisors = []
    (2..num).each do |divisor|
        #debugger
        if num % divisor == 0 && prime?(divisor)
            divisors << divisor
        end
    end
    divisors[-1]
end

def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    return true
end

def unique_chars?(str)
    seen = ""
    #str.each_char {|char| seen.include?(char) ? (return false) : seen += char}
    str.each_char do |char|
        if seen.include?(char)
            return false
        else
            seen += char
        end
    end
    return true
end

def dupe_indices(arr)
    hash = Hash.new{|hash, key| hash[key] = []}

    arr.each.with_index do |ele, index|
        hash[ele] << index
    end

    hash.select {|key, value| hash[key].length > 1}
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new{|hash, key| hash[key] = 0}
    hash_2 = Hash.new(0)
    arr_1.each {|char| hash_1[char] += 1}
    arr_2.each {|char| hash_2[char] += 1}
    #hash_1.each{|key, value| return false if hash_2[key] != value} #This one doesn`t work.
    #true
    hash_1.merge(hash_2) == hash_1 && hash_2.merge(hash_1) == hash_2
    #hash_1 == hash_2 #This Works.
end

# p hash_1 = {"cat" => 1, "wolf" => 5}
# p hash_2 = {"cat" => 100, "dog" => 2}

# p hash_1.merge(hash_2)
# p hash_2.merge(hash_1)


# This solution doesn`t work for the example.
# def ana_array(array_1, array_2)
#     return false if array_1.length != array_2.length
#     array_1.each do |element|
#         if !array_2.include?(element)
#             return false
#         end
#     end
#     array_2.each do |element|
#         if !array_1.include?(element)
#             return false
#         end
#     end
#     true
# end
#p  ana_array(["i","c","e","m","a","n", "a"], ["c","i","n","e","m","a", "m"])