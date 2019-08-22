def partition(array, n)
    lesser = []
    greater = []
    array.each do |element|
        if element < n
            lesser << element
        else
            greater << element
        end
    end
    [lesser, greater]
end

def merge(hash1, hash2)
    union = {}

    hash1.each {|key, value| union[key] = value}
    hash2.each {|key, value| union[key] = value}

    union
end

def censor(sentence, curses)
    sentence.split(" ")
            .map do |word|
                p word
                p curses
                if curses.include?(word.downcase)
                    vowels = "aeiouAEIOU"
                    censored = ""
                    word.chars {|letter| vowels.include?(letter) ? censored += "*" : censored += letter}
                    censored
                else
                    word
                end
    end
            .join(" ")
end

def power_of_two?(number)
    return true if number === 1
    while number.even?
        return true if number === 2
        number = number / 2
    end
    false
end