# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pairs = []
    words.each.with_index do |word, index|
        words[index+1..-1].each do |word2|
            hits = vowels(word) + vowels(word2)
            pairs << (word + " " + word2) if hits.uniq.length === 5
        end
    end

    pairs
end

def vowels(word)
    vowels = "aeiou"
    word.chars.select {|char| vowels.include?(char)}
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
require "prime"
def composite?(num)
    !Prime.prime?(num)
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    #Find the Bigrams
    pairs = []
    str.each_char.with_index do |char, index|
        break if index+1 === str.length
        pair = str[index] + str[index+1]
        pairs << pair if bigrams.include?(pair)
    end
    pairs.uniq!
    #Sort based on the original Array order.
    bigrams.select {|duo| pairs.include?(duo)}
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|key, value| key === value}

        self.select(&prc)
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs_array = []
        if length
            self.each_char.with_index do |char, index|
                break if index+length > self.length
                subs_array << self[index...index+length]
            end
        else
            self.each_char.with_index do |char, index1|
                self.each_char.with_index do |char, index2|
                    subs_array << self[index1..index2] if index2 >= index1
                end
            end
        end
        subs_array
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        self.chars
            .map {|letter| ((letter.ord + num - 96) % 26 + 96).chr}
            .join("")
    end
end
