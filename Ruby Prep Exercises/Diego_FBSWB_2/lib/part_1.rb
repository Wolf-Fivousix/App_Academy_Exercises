def my_reject (array, &block)
    array.select {|element| !block.call(element)}
end

def my_one? (array, &block)
    array.select {|element| block.call(element)}.length === 1
end

def hash_select (hash, &block)
    new_hash = Hash.new()
    hash.each {|key, value| new_hash[key] = value if block.call(key, value)}
    new_hash
end

def xor_select (array, proc1, proc2)
    array.select {|element| (proc1.call(element) && !proc2.call(element)) || !proc1.call(element) && proc2.call(element)}
end

def proc_count (value, proc_array)
    counter = 0
    proc_array.each {|proc| counter += 1 if proc.call(value)}
    counter
end