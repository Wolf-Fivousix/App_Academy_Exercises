def average(value1, value2)
    p (value1 + value2) / 2.0
end

def average_array(num_Array)
    (num_Array.sum * 1.0) / num_Array.length
end

def repeat(string, number)
    string * number
end

def yell(string)
    string.upcase + "!"
end

def alternating_case (sentence)
    sentence.split(" ")
            .map
            .with_index {|word, index| index.even? ? word.upcase : word.downcase}
            .join(" ")
end