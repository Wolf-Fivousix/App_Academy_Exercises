def select_even_nums(numbers)
    numbers.select(&:even?)
end

def reject_puppies (dog_hashes_array)
    dog_hashes_array.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(my_array)
    my_array.count {|ar| ar.sum > 0}
end

def aba_translate(string)
    translation = ""
    string.chars.each do |letter|
        if ("aeiou".include?(letter.downcase))
            translation << letter
            translation << "b"
        end
        translation << letter
    end
    translation
end

def aba_array (words_array)
    words_array.map {|word| aba_translate(word)}
end