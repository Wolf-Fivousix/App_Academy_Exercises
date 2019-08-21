def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(string, num)
    string * num
end

def yell(string)
    string += "!"
    string.upcase!
end

def alternating_case(sentence)
    new = sentence.split
    #alternate down and up case.
    new.map! do |word|
        if new.index(word).even?
            word.upcase
        else
            word.downcase
        end
    end
    new.join(" ")
end

