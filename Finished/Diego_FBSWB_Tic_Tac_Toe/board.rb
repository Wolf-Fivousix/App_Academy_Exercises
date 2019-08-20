class Board
    DEFAULT_SYMBOL = :_
    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, DEFAULT_SYMBOL)}
    end
    
    def place_mark(position, symbol, override = false)
        if self.empty?(position) || override
            @grid[position[0]][position[1]] = symbol
            return true
        end
        raise "Place is taken! To prevent world implosion, your game will now shut down. Thank you for playing!"
    end

    def empty?(position)
        @grid[position[0]][position[1]] === DEFAULT_SYMBOL ? true : false
    end

    def winner
# Whole sub-array is equal.
        return @grid[0][0] if @grid[0][0] === @grid[0][1] && @grid[0][0] === @grid[0][2] && @grid[0][0] != DEFAULT_SYMBOL
        return @grid[1][0] if @grid[1][0] === @grid[1][1] && @grid[1][0] === @grid[1][2] && @grid[1][0] != DEFAULT_SYMBOL
        return @grid[2][0] if @grid[2][0] === @grid[2][1] && @grid[2][0] === @grid[2][2] && @grid[2][0] != DEFAULT_SYMBOL
        # Same elements, across all sub-arrays are equal.
        return @grid[0][0] if @grid[0][0] === @grid[1][0] && @grid[0][0] === @grid[2][0] && @grid[0][0] != DEFAULT_SYMBOL
        return @grid[0][1] if @grid[0][1] === @grid[1][1] && @grid[0][1] === @grid[2][1] && @grid[0][1] != DEFAULT_SYMBOL
        return @grid[0][2] if @grid[0][2] === @grid[1][2] && @grid[0][2] === @grid[2][2] && @grid[0][2] != DEFAULT_SYMBOL
        # Across the board.
        return @grid[0][0] if @grid[0][0] === @grid[1][1] && @grid[0][0] === @grid[2][2] && @grid[0][0] != DEFAULT_SYMBOL
        return @grid[0][2] if @grid[0][2] === @grid[1][1] && @grid[0][2] === @grid[2][0] && @grid[0][2] != DEFAULT_SYMBOL
        DEFAULT_SYMBOL
    end

    def over?
        #Someone wins.
        return true if self.winner != DEFAULT_SYMBOL
        #Board out of space.
        return true if @grid.map{|row| row.count(:_)}.sum === 0
        false
    end
end
