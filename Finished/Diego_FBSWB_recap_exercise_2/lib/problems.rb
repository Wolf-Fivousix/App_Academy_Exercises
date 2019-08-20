# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    number = 1
    while ((number % num_1 != 0) || (number % num_2 != 0))
        number +=1
    end
    number
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram = Hash.new(0)
    (0...str.length).each { |index| bigram[str[index..index+1]] += 1 }
    bigram.key(bigram.values.max)
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        swapped = {}
        self.each {|key, value| swapped[value] = key}
        swapped
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        sums = []
        (0...self.length).each do |index1|
            (index1+1...self.length).each do |index2|
                sums << self[index1] + self[index2]
            end
        end
        sums.count(num)
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b}

        (0...self.length).each do |index1|
            (0...self.length-1-index1).each do |index2|
                self[index2], self[index2+1] = self[index2+1], self[index2] if prc.call(self[index2], self[index2+1]) === 1
            end
        end
        self
    end
end