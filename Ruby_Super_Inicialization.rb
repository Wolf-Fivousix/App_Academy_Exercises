class A
   def initialize(value = 25)
      @value = value
   end

   def value
      @value ||= 666 # Only change Value if it has not been initialized yet.
   end
end

class B < A
   def initialize
      # NOT Calling Super, so value should NOT be 25.
   end
end
a = A.new
p a.value
b = B.new
p b.value