require "./board"

class Computer_Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    
    def display(board)
        @game_board ||= board
    end
    
    def get_move(trash_arg)
        # Look through all positions for a winning move.
        (0..2).each do |row|
            (0..2).each do |colum|
                move = [row, colum]
                if @game_board.empty?(move)
                    @game_board.place_mark(move, @mark)
                    # Winning move was found!
                    winning_move = @game_board.winner === @mark
                    # Return board back to original before exiting.
                    @game_board.place_mark(move, Board::DEFAULT_SYMBOL, true)
                    return [row, colum] if winning_move
                end
            end
        end
        #No winning move, return random valid position.
        while true
            move = [rand(3), rand(3)]
            return move if @game_board.empty?(move)
        end
    end
end