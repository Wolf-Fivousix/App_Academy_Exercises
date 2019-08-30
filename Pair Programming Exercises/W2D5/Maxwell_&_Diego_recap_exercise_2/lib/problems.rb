# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (2..(num_1*num_2)).each do |multiple|
        if multiple % num_1 == 0 && multiple % num_2 == 0
            return multiple
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    counter = Hash.new(0)

    (0...str.length-1).each do |index|
        counter[str[index..index+1]] += 1
    end

    bigram = ""
    frequency = 0
    counter.each do |k, v|
        if frequency < v
            bigram = k
            frequency = v
        end
    end

    bigram
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}

        self.each do |k, v|
            new_hash[v] = k
        end

        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                if self[i] + self[j] == num
                    counter += 1
                end
            end
        end
        counter
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    require "byebug"
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b } 
        sorted = false
        while (!sorted)
            sorted = true
            (0...self.length - 1).each do |i|
                # if -1, 0 and 1 for <=>
                if prc.call(self[i], self[i+1]) == 1
                    # 1 (A > B)
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
                    # 0 (A = B)
                    # -1 (A < B)
            end
        end
        self
    end
end

p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort
