require_relative "board"
require_relative "player"
        # Board.new != Board.initialize
        # Board.new will call Board.initialize
require "byebug"
class Battleship
    attr_reader :board, :player
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end
    def start_game
       @board.place_random_ships
       p @board.num_ships
       @board.print
    end
    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        end
        false
    end
    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        end
        false
    end
    def game_over?
        if self.win? || self.lose?
            return true
        end
        false
    end
    def turn
        position = @player.get_move
        #@board.attack(position)
        # @board.print
        @remaining_misses -= 1 if !@board.attack(position) 
        @board.print
        p @remaining_misses
    end
end
