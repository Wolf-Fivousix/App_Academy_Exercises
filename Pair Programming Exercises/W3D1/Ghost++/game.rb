require_relative "dictionary.rb"

dictionary = Dictionary.new

p "Loading Done! =)"

fragment = ""
p dictionary[fragment]
# p dictionary.valid_word?("a")
while(!dictionary[fragment].include?(dictionary.END_OF_WORD))
    input = gets.chomp[0]
    while(!dictionary.valid_word?(fragment + input))
        p fragment + input
        p "Input was: #{input}"
        p "Invalid input, try a new letter. (type ESC to print options)"
        input = gets.chomp
        p dictionary[fragment] if input == "ESC"
        input = input[0]
    end
    fragment += input
    p "Fragment is: #{fragment}"
end





# RSPECS

# p dictionary.substrings("pineapple")
# p dictionary.substrings("cat")
# p dictionary["dog"]
# p dictionary["roof"].include?(END_OF_WORD)