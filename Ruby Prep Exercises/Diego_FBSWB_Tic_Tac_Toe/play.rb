require "./game"
=begin 
game = Board.new()
p "Empty spot: #{game.empty?([0,0])}"
p "Place Mark: #{game.place_mark([0,0], :X)}"
#p "Place Mark again: #{game.place_mark([0,0], :X)}"
p "Game Over by moves: #{game.over?}"

player = Human_Player.new(:X)
computer = Computer_Player.new(:O)
p "Human Mark: #{player.mark}"
player.display(game)
#player.get_move(game)
computer.display(game)
game.place_mark(computer.get_move(), computer.mark)
player.display(game)
=end

game = Game.new(Human_Player.new(:X), Computer_Player.new(:O))
game.play