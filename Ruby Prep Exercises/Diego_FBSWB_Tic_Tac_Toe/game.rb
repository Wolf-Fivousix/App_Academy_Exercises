require "./human_player"
require "./computer_player"
require "./board"

class Game
    attr_reader :current_player
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @board = Board.new()
        @current_player = @player_1
    end
    
    def switch_player!
        @current_player === @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play_turn
        @current_player.display(@board)
        move = @current_player.get_move(@board)
        @board.place_mark(move, @current_player.mark)
    end

    def play
        while !self.over?
            self.play_turn
            self.switch_player!
        end
    end

    def over?
        if @board.over?
            p "Game Over!"
            p "Congratulations #{@board.winner}, you won! =)"
            return true
        end
        false
    end
end