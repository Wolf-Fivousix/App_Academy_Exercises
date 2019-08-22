def my_map (array, &block)
    new_array = []
    array.each {|element| new_array << block.call(element)}
    new_array
end

def my_select (array, &block)
    new_array = []
    array.each {|element| new_array << element if (block.call(element))}
    new_array
end

def my_count (array, &block)
    my_select(array, &block) .length
end

def my_any?(array, &block)
    my_select(array, &block).length > 0 ? true : false
end

def my_all?(array, &block)
    my_select(array, &block) === array
end

def my_none? (array, &block)
    !my_any?(array, &block)
end