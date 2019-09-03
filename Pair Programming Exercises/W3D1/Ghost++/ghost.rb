END_OF_WORD = "end_of_word"

def substrings(word)
  (0...word.length).inject([]) { |words, end_index| words += [word[0..end_index]] }
end

dictionary = Hash.new { |h, k| h[k] = [] }

# Process every line (word) in a text file.
File.readlines("dictionary.txt").each do |word| # Word is a string.
  word.chomp!
  words_array = substrings(word)
  words_array.each.with_index { |ele, idx| dictionary[ele] += words_array[idx+1..-1] }
  # debugger
  dictionary[word] = [END_OF_WORD]
end

dictionary.each {|key, array| array.uniq!}

p "Loading Done! =)"







# RSPECS

# p substrings("pineapple")
# p substrings("cat")
# p "test".chomp
# p dictionary["test\n".chomp]
# p dictionary["dog"]
# p dictionary["roof"].include?(END_OF_WORD)