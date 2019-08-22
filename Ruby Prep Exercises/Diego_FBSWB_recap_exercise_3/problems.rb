##### GENERAL PROBLEMS

def no_dupes?(array)
    uniques = []
    array.each {|element| uniques << element if array.count(element) === 1}
    uniques
end
=begin 
# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
=end

def no_consecutive_repeats?(array)
    (0...array.length-1).each {|index| return false if array[index] === array[index+1]}
    true
end
=begin 
# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
=end

def char_indices(sentence)
    hash = Hash.new{|hash, key| hash[key] = []}
    sentence.each_char.with_index {|char, index| hash[char] << index}
    hash
end
=begin 
# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
=end

def longest_streak(string)
    return string if string.length === 1
    repeats = string[0]
    (1...string.length).each do |index|
        if string[index] === string[index-1]
            streak = string[index-1..index]
            index_2 = index+1
            while string[index_2] === string[index] && index_2 < string.length
                streak = string[index-1..index_2]
                index_2 +=1
            end
            repeats = streak if streak.length >= repeats.length
        end
    end
    repeats.length === 1? string[-1] : repeats
end
=begin 
# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
=end

require "prime"
def bi_prime?(number)
    primes = all_primes(number)
    multiples = []
    primes.each do |prime_1|
        primes.each do |prime_2|
            multiples << prime_1 * prime_2
        end
    end
    multiples.include?(number)
end

def all_primes(number)
    array = []
    (2..number/2).each {|num| array << num if Prime.prime?(num)}
    array
end
=begin 
# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
=end

def vigenere_cipher(message, keys)
    current_key = 0
    cipher = message.each_char.map do |letter|
        secret = caesar_cipher(letter, keys[current_key])
        current_key += 1
        current_key = 0 if current_key === keys.length
        secret
    end
    .join("")
end

def caesar_cipher(letter, cipher)
    ((letter.ord - 96 + cipher) % 26 + 96).chr
end
=begin 
# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
=end

def vowel_rotate(sentence)
    control = "aeiou"
    vowels = sentence.chars.select {|letter| control.include?(letter)}
    vowels.unshift(vowels.pop)
    sentence.chars.map {|letter| control.include?(letter)? vowels.shift : letter}
            .join("")
end
=begin 
# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
=end

##### PROC PROBLEMS

class String
    def select(&proc)
        return "" if !proc
        new_string = []
        self.each_char {|letter| new_string << letter if proc.call(letter)}
        new_string.join("")
    end

    def map!(&proc)
        self.each_char.with_index {|letter, index| self[index] << proc.call(letter, index)}
    end
end
=begin 
# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
=end

=begin 
# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
=end

##### RECURSION PROBLEMS

def multiply(a, b)
    return 0 if a === 0 || b === 0
    b > 0 ? a + multiply(a, b-1) : -(a + multiply(a, (-b)-1))
end
=begin 
# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
=end

def lucas_sequence(number)
    (1..number).each.map {|value| lucas_value(value)}
end

def lucas_value(number)
    return 0 if number === 0
    return 2 if number === 1
    return 1 if number === 2
    lucas_value(number-1) + lucas_value(number-2)
end
=begin 
# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
=end

def prime_factorization(number)
    return [number] if Prime.prime?(number)
    x = 2
    while !(Prime.prime?(x) && number % x === 0)
        x +=1
    end
    [x] + prime_factorization(number / x)
end
=begin 
# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
=end