def select_even_nums(arr)
    arr.select {|num| num.even?}
    #arr.select(&:even?)
end

def reject_puppies(dogs_arr)
    dogs_arr.reject {|dog| dog["age"] <=2}
end

def count_positive_subarrays(sub_array)
    sub_array.count {|array| array.sum > 0}
end

def aba_translate(word)
    translate = ""
    # word.each_char do |char| 
    #     if "aeiou".include?(char)
    #         translate += char + "b" + char
    #     else
    #         translate += char
    #     end
            
    # end

    word.each_char {|char| 'aeiou'.include?(char)? translate += char + "b" + char : translate += char}
    translate
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end