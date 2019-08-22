# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    #(2..num_1).each {|i| return false if num_1 % i == 0 && num_2 % i == 0 }

    i = 1
    array_1 = []
    while i <= num_1
        if num_1 % i == 0
            array_1 << i
        end
        i += 1
    end

    i = 1
    array_2 = []
    while i <= num_2
        if num_2 % i == 0
            array_2 << i
        end
        i += 1
    end

    array_1.each do |a|
        if array_2.include?(a) && a != 1
            return false
        end
    end

    true
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false