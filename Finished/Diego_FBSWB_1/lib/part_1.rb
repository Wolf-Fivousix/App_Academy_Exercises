def is_prime?(number)
    return false if number < 2
    (2...number).each {|x| return false if number % x == 0}
    true
end

def nth_prime(n)
    nth = 0
    number = 1
    while nth < n
        number += 1
        while !is_prime?(number)
            number += 1
        end
        nth += 1
    end
    number
end

def prime_range(min, max)
    (min..max).each.select {|x| is_prime?(x)}
end