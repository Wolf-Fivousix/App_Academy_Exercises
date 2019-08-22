# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "prime"
require "byebug"

def divisors(number)
    divisors = []
    (1..number).each {|divider| divisors << divider if number % divider === 0}
    divisors.reverse
end

def largest_prime_factor(number)
    divisors(number).each {|div| return div if div.prime?}
end

def unique_chars?(string)
    counter = Hash.new(0)
    string.each_char do |character|
        counter[character] += 1
        return false if counter[character] > 1
    end
    true
end

def dupe_indices(array)
    dupes = Hash.new()
    array.each.with_index do |element, index|
        if dupes.key?(element)
            dupes[element] << index
        else
            dupes[element] = [index]
        end
    end
    dupes.select {|key, value| value.length > 1}
end

def ana_array(array_1, array_2)
    return false if array_1.length != array_2.length
    array_1.each do |element|
        if !array_2.include?(element)
            return false
        end
    end
    array_2.each do |element|
        if !array_1.include?(element)
            return false
        end
    end
    true
end