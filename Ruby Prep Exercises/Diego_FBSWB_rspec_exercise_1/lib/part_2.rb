def hipsterfy(word)
    vowels = ["a", "e", "i", "o", "u"]
    last_Vowel = -1
    vowels.each do |vowel|
        current_Vowel = word.rindex(vowel)
        current_Vowel === nil ? next : last_Vowel = [last_Vowel, current_Vowel].max
    end
    return word if last_Vowel === -1
    word.slice!(last_Vowel)
    word
end

def vowel_counts(sentence)
    vowels_Hash = Hash.new(0)
    vowels = ["a", "e", "i", "o", "u"]
    sentence.downcase!
    vowels.each do |vowel|
        vowels_Hash[vowel] = sentence.count(vowel) if sentence.include?(vowel)
    end
    vowels_Hash
end

def caesar_cipher(message, cipher)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")

    message.chars
            .map do |letter|
                if alphabet.include?(letter)
                    new_Index = alphabet.index(letter) + cipher
                    new_Index > 25 ? alphabet[new_Index % 26] : alphabet[new_Index]
                else
                    letter
                end
            end
            .join("")
end