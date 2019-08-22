def partition(array, num)
    less = []
    greater = []
    array.each {|n| n >= num ? greater << n : less << n}
    [less, greater]
end

def merge(hash_1, hash_2)
    hash_1.merge(hash_2)
end

def censor(sentence, curse_words)
    sentence.split(" ").map {|word| curse_words.include?(word.downcase)? replace(word) : word}
    .join(" ")
end

def replace(word)
    vowels = "aeiou"
    word.split("").map {|char| vowels.include?(char.downcase)? "*" : char}
    .join("")
end

def power_of_two?(num)
    # [1, 2, 4, 8, 16, 32, 64]
    i = 0
    while (i < num)
        return true if num == 2**i
        i += 1
    end
    false
end
=begin 
def power_of_two?(num)
    return true if num == 1
    while num.even?
        return true if num == 2
        num = num / 2
    end
    false
end
=end