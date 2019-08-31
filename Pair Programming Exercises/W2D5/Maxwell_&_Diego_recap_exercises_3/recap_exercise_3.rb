def no_dupes?(arr)
    new_arr = []

    arr.each do |el|
        if arr.count(el) == 1
            new_arr << el
        end
    end

    new_arr
end

def no_consecutive_repeats?(arr)
    return true if arr.length == 1
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

def char_indices(str)
     hash = Hash.new {|h,k| h[k] = []}

     str.each_char.with_index do |char, i|
        hash[char] << i
     end

     hash
end

def longest_streak(str)
#iterate through str
    i = 0
    # streak_char = str[i]
    streak_arr = []
   
    while i < str.length 
        beginning_index = i
        ending_index = i
        while (ending_index < str.length && str[i] == str[ending_index+1])
            ending_index += 1
        end
        # streak_char = str[ending_index+1]
        streak_arr << str[beginning_index..ending_index]
        i = ending_index + 1
    
    end

    streak_arr.inject {|acc,el| el.length >= acc.length ? el : acc}
#assign streak_char to current char, then check if next char == streak_char
# if so, continue iteration
# if not, shovel prior chars into streak_arr

end

def bi_prime?(num)
    return false if prime?(num)
    (2...num).each do |m|
        (m...num).each do |n|
            if m * n == num && prime?(m) && prime?(n)
                return true
            end
        end
    end
    false
end

def prime?(num)
    (2...num).each do |divisor|
        if num % divisor == 0
            return false
        end
    end
    true
end
require "byebug"
def vigenere_cipher(message, keys)
    alphabet = ('a'..'z').to_a 
    message.split("").map.with_index do |char, i|
        new_index = (alphabet.index(char) + keys[i % keys.length]) % 26 
        alphabet[new_index]
    end
   .join("")
end

def vowel_rotate(str)
    vowels = "aeiou"
    vowel_array = find_vowels(str)
    rotated_arr = vowel_array.unshift(vowel_array.pop)
    counter = 0
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            str[i] = rotated_arr[counter]
            counter += 1
        end
    end
    str
end

def find_vowels(word)
    vowel_array = []
    vowels = "aeiou"
    word.each_char do |char|
        if vowels.include?(char)
            vowel_array << char
        end
    end
    vowel_array
end

class String
    def select(&prc)
        return "" if prc.nil?
        # self.each_char.inject("") {|acc, el| prc.call(el) ? acc += el : acc}
        new_str = ""
        self.each_char do |char|
            new_str << char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end
end

def multiply(num, multiplier)
    return num if multiplier == -1
    return num if multiplier == 1
    # if multiplier > 0
    #     num + multiply(num, multiplier-1)
    # elsif multiplier < 0 && multiplier.even?
    #     -(num + multiply(num, multiplier+1))
    # else 
    #     num + multiply(num, multiplier+1)
    # end
    if num >= 0 && multiplier > 0
        num + multiply(num, multiplier-1)
    elsif num < 0 && multiplier > 0
        num + multiply(num, multiplier-1)
    elsif num >= 0 && multiplier < 0
        -(num + multiply(num, -(multiplier+1)))
    else
        -(num + multiply(num, -(multiplier+1)))
    end

end

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    # return lucas_sequence(n-1) + [1] if n == 2
    # return [2] + [1] if n == 2
    return [2, 1] if n == 2
    

    lucas_sequence(n-1) + [lucas_value(n)]
    # n = 1     [2]
    # n = 2     [2, 1]
    # n = 3     [2, 1, ???]
    # n = X     [2, 1, ???, ???, ???, ???, ???]


    # array = Array.new(n)
    # array.each.with_index do |el, i|
    #     array[i] = lucas_value(i+1)
    # end
    # array


end

def lucas_value(n)
    return 2 if n == 1
    return 1 if n == 2

    lucas_value(n-1) + lucas_value(n-2)
end

# Examples
def prime_factorization(num)
    # return [num] if prime?(num)
    # (2...num).each do |divisor|
    #     if num % divisor == 0
    #         return [divisor] + prime_factorization(num / divisor)
    #     end
    # end

    return [num] if prime?(num)
    if num.even?
        return [2] + prime_factorization(num/2)
    else
        odds = odd_number(num)
        odds.each do |el|
            if num % el == 0
                return [el] + prime_factorization(num/el)
            end
        end
    end
end

def odd_number(n)
    (3..n).to_a.select(&:odd?)
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]