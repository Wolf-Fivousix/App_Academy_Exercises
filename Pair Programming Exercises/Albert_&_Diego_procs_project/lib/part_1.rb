def my_map(array, &prc)
    new_array = []
    array.each {|element| new_array << prc.call(element)}
    new_array
end

def my_select(array, &prc)
    new_array = []
    array.each {|element| new_array << element if prc.call(element)}
    new_array
end

def my_count(array, &prc)
    count = 0
    array.each {|element| count += 1 if prc.call(element)}
    count
end

def my_any?(array, &prc)
    array.each {|element| return true if prc.call(element) == true}
    false
end

def my_all?(array, &prc)
    array.each {|element| return false if prc.call(element) == false}
    true
end

def my_none?(array, &prc)
    array.each {|element| return false if prc.call(element) == true}
    true
end
    