def hipsterfy(word)
    vowels = "aeiou"
    last_vowel = -1
    # vowels.each_char {|vowel| last_vowel = word.index(vowel) if last_vowel < word.index(vowel)}
    (0...word.length).each do |i|
        last_vowel = i if vowels.include?(word[i]) && last_vowel < i 
    end
    
    last_vowel == -1? word : word[0...last_vowel] + word[last_vowel + 1..-1]
    # if word.split("").any? {|char| vowels.include?(char)}
    #     word[0...last_vowel] + word[last_vowel + 1..-1]
    # else
    #     word
    # end
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char {|letter| hash[letter] += 1 if vowels.include?(letter)}
    hash
end

def caesar_cipher(message, num)
    alpha = ("a".."z").to_a
    new_message = []
    message.each_char {|char| alpha.include?(char) ? new_message << alpha[(alpha.index(char) + num) % 26] : new_message << char}
    new_message.join("")
end