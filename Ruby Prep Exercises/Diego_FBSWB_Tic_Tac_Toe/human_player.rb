class Human_Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    
    def display(board)
        board.grid.each do |row|
            puts "#{row[0]} | #{row[1]} | #{row[2]}"
        end
        nil
    end
    
    def get_move(board)
        while true 
            puts "Move position (enter two numbers separated by space, like: 1 0):"
            move = gets.chomp.split(" ").map(&:to_i)
            break if board.empty?(move)
            p "Invalid move, try again."
        end
        move
    end
end