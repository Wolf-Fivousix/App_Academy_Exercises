re#quire_relative "card.rb"
# Cards test
p "Card Class Tests"
card_a = Card.new(1)
card_b = Card.new(5)
card_c = Card.new(13) 
card_d = Card.new(1)

p "Cards putting in"
p card_a 
p card_b 
p card_c 
p card_d

p "Testing equality method FT"
p card_a == card_b 
p card_d == card_a 

p "Testing card reveal if it switch TF"
p card_a.reveal 
p card_a.reveal 

p "Testing to_s. Card C"
p card_c.to_s 
p card_c.to_s.is_a?(String) NpBoparard testputs "Testing board class render_print"
# test_board = Board.new(3) # wrong size try again
test_board = Board.new(6)
# test_board.render # I thought nil, but face_up doesn't exist so we don't make it this far.
test_board.populate  # add cards
test_board.render
puts test_board.won?     # False
