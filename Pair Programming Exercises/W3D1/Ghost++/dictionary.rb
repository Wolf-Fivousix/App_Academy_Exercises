class Dictionary
    END_OF_WORD = "end_of_word"
    def initialize
        @dictionary = Hash.new { |h, k| h[k] = [] }
        # Process every line (word) in a text file.
        File.readlines("dictionary.txt").each do |word| # Word is a string.
        word.chomp!
        words_array = substrings(word)
        words_array.each.with_index { |ele, idx| @dictionary[ele] += words_array[idx+1..-1] }
        @dictionary[word] = [END_OF_WORD]
        end
        @dictionary.each {|key, array| array.uniq!}
    end

    def END_OF_WORD
        END_OF_WORD
    end
    def substrings(word)
        (0...word.length).inject([]) { |words, end_index| words += [word[0..end_index]] }
    end

    def [](word)
        @dictionary[word]
    end

    def valid_word?(word)
        @dictionary.has_key?(word)
    end
end







