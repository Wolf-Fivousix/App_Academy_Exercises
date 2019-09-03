def substrings(word)
  new_array = []
  (0...word.length).each do |end_index|
      new_array << word[0..end_index]
  end
  new_array
end

dictionary = Hash.new { |h, k| h[k] = [] }
# Process every line (word) in a text file.
File.readlines("dictionary.txt").each do |word| # Word is a string.
  words_array = substrings(word.chomp)
  words_array.each.with_index { |ele, idx| dictionary[ele] += words_array[idx+1..-1] } 
end

# [] => END_OF_WORD
dictionary.each {|key, array| array.uniq!}

p "Loading Done! =)"
# p dictionary["aer"]
# p dictionary["dog"]
#p dictionary["roof"].include?(END_OF_WORD)




# RSPECS
=begin
p substrings("cat")
p substrings("pineapple")
p make_hash(substrings("cat"))
=end



=begin 
hash[key].length == 1 VALID WORD
fragment    possible words
"a"         500
"ab"        25
"aby"       10
"abys"      2
"abyss"     1

length == 3
[cat, dog, car].each do a_Hash

"apple"
"a"     => [ap, app, appl, apple]
"ap"    => [app, appl, apple]
"app"   => [appl, apple]
"appl"  => [apple]
"apple" => []

"appo"
"a"
"ap"    => [app, appo]
"app"   => [app, appl, apple] + [appo]
"appo"  => []


valid_fragment?
complete_word?

hash["apple"] "ap"
"apple"
"ap"

#hash with distinct arrays 
#write a substring method to grab the substrings of all the words 
#add all substrings to the hash. make sure each array is unique 

zombie = [z, zo, zom, zomb,zombi,zombie]
zonal  = [z, zo, zon, zona, zonal]
{ z => [ zo, zom, zomb,zombi,zombie, zon, zona, zonal]
zo =[ zom, zomb,zombi,zombie, zon, zona, zonal]  }
=end