#Instead of implementing my own .reverse method, I'll work with 2 pointers.
def palindrome?(word)
    start = 0
    ending = word.length - 1
    while start < ending
        return false if word[start] != word[ending]
        start += 1
        ending -= 1
    end
    true
end

def substrings(string)
    subs = []
    string.chars.each.with_index do |letter, index|
        (index...string.length).each do |index2|
            subs << string[index..index2]
        end
    end
    subs
end

def palindrome_substrings(sentence)
    subs = substrings(sentence)
    subs.select {|word| word.length > 1 && palindrome?(word)}
end