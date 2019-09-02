class Teste
   @@variavel = 56
   CONSTANTE = 25

   # Does not work without a getter method. (attr does not work either.)
   def self.variavel
      @@variavel
   end

   def self.constante
      CONSTANTE
   end
end
# one = Teste.new()
p Teste.variavel
p Teste.constante