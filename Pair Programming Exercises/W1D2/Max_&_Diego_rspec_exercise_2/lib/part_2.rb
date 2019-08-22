def palindrome?(string)
    start = 0
    ending = string.length - 1
    while start < ending
        return false if string[start] != string[ending]
        start += 1
        ending -= 1
    end
    true
end

def substrings(string)
    variation = []
    (0...string.length).each do |i1|
        (i1...string.length).each do |i2|
            variation << string[i1..i2]
        end
    end
    variation
end

def palindrome_substrings(string)
    substrings(string).select {|word| word.length > 1 && palindrome?(word)}
end