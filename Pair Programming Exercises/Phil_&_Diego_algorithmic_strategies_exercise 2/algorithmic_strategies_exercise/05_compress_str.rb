# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)

    sequence = []
    counter = 1
    (0...str.length-1).each do |idx|
        if str[idx] == str[idx + 1]
            counter += 1
        else
            sequence << counter if counter > 1
            counter = 1
            sequence << str[idx]
        end
        
    end
    sequence << counter if counter == str.length
    sequence << str[-1]
    sequence.join("")
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"