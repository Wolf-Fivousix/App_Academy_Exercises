# ### Exercise 1 - sum_to
# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).
def sum_to(number)
    # This is not what the exercise wants... =(
    # return 0 if number == 0
    # number > 0 ? (number + sum_to(number-1)) : (number + sum_to(number+1))
    return nil if number < 0
    return 0 if number == 0
    number + sum_to(number - 1)
end
  # Test Cases
#   p sum_to(5)  # => returns 15
#   p sum_to(1)  # => returns 1
#   p sum_to(9)  # => returns 45
#   p sum_to(-8)  # => returns nil

# ### Exercise 2 - add_numbers
#   Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.
def add_numbers(numbers_array)
    return nil if numbers_array.empty?
    return numbers_array.first if numbers_array.length == 1
    numbers_array.first + add_numbers(numbers_array[1..-1])
end
#   # Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

# ### Exercise 3 - Gamma Function
#   Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(number)
    return nil if number == 0
    return 1 if number == 1
    (number - 1) * gamma_fnc(number - 1)
end

#   # Test Cases
#   p gamma_fnc(0)  # => returns nil
#   p gamma_fnc(1)  # => returns 1
#   p gamma_fnc(4)  # => returns 6
#   p gamma_fnc(8)  # => returns 5040

# ### Exercise 4 - Ice Cream Shop
#   Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.
def ice_cream_shop(flavors_array, favorite)
    return false if flavors_array.empty?
    return true if favorite == flavors_array.first
    ice_cream_shop(flavors_array[1..-1], favorite)
end
#   # Test Cases
#   p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#   p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
#   p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
#   p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
#   p ice_cream_shop([], 'honey lavender')  # => returns false

# ### Exercise 5 - Reverse
#   Write a function reverse(string) that takes in a string and returns it reversed.
def reverse(string)
    return "" if string.empty?
    string[-1]+ reverse(string[0..-2])
end
#   # Test Cases
  p reverse("house") # => "esuoh"
  p reverse("dog") # => "god"
  p reverse("atom") # => "mota"
  p reverse("q") # => "q"
  p reverse("id") # => "di"
  p reverse("") # => ""