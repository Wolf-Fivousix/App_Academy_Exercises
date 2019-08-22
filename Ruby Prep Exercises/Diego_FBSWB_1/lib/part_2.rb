def element_count(array)
    my_Hash = Hash.new(0)
    array.each {|element| my_Hash[element] += 1}
    my_Hash
end

def char_replace!(string, hash)
    index = 0
    while index < string.length - 1
        string[index] = hash[string[index]] if hash.key?(string[index])
        index += 1
    end
    string
end

# .reduce(:*) is the way to go.
def product_inject(numbers_array)
    numbers_array.inject {|accumulator, element| accumulator *= element}
end