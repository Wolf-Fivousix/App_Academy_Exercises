def proper_factors (number)
    factors = []
    (1...number).each {|value| factors << value if number % value === 0}
    factors
end

def aliquot_sum (number)
    proper_factors(number).sum
end

def perfect_number? (number)
    aliquot_sum(number) === number
end

def ideal_numbers (n)
    perfect = []
    number = 6
    while (perfect.length < n)
        perfect << number if perfect_number?(number)
        number +=1
    end
    perfect
end