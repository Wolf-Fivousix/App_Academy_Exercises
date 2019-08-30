class Board
    attr_reader :size
    def initialize(n)
            @grid = Array.new(n){Array.new(n){:N}}
            @size = n * n
    end

    def [](position)
        row = position[0]
        column = position[1]
        @grid[row][column]
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
        #self[poisition] = value
        # Why doesn't work? =(
        # Did [] had to be self.[] ??
    end

    def num_ships
        # This works.
        # @grid.inject(0) {|accumulator, array| accumulator += array.count(:S)}
        
        # This one too.
        @grid.flatten.count(:S)

        # So does this. =)
        # count = 0
        # @grid.each do |arr|
        #     arr.each do |ele|
        #         if ele == :S
        #             count += 1
        #         end
        #     end
        # end
        # count
    end

    def attack(position)
        #self.[](position)
        if self[position] == :S
            self[position] = :H 
            p "you sunk my battleship!"
            return true
        end
        self[position] = :X 
        false
    end

    def place_random_ships
        #cant use @grid.sum as its 2d array
        (@size * 0.25).to_i.times do
            #p rand(0..100) gives a rand num bt 0..100
            #position[1, 5] = :S
            #position[1, 5]
            row = rand(0...@grid.length)
            column = rand(0...@grid.length)
            position = [row, column]

            # Same as @grid[position] != :N
            # Board.[](position)
            # @grid[row][column]

            # @grid[position]
            # [[], [], []] [[][]]]

            # @grid[row][column] == :S
            # self[position] == :S
            # Are the same.

            while (self[position] == :S)
                row = rand(0...@grid.length)
                column = rand(0...@grid.length)
                position = [row, column]
            end

            self.[]=(position, :S) # if @grid[position] == :N
            # [:S, :N, :N, :N]
            # [:N, :S, :N, :N]
            # [:N, :N, :N, :N]
        end
    end
    # def place_random_ships
    #     while (@grid.flatten.count(:S) < (@size * 0.25).to_i)
    #         row = rand(0...@grid.length)
    #         column = rand(0...@grid.length)
    #         position = [row, column]
    #         self.[]=(position, :S)
    #     end
    # end
    
    def hidden_ships_grid
        @grid.map {|array| array.map { |el| el == :S ? :N : el} }
    end

    def self.print_grid(array)
        array.each do |arr|
           puts arr.join(" ")
        end
    end
    def cheat
        Board.print_grid(@grid)
    end
    def print
        Board.print_grid(hidden_ships_grid)
    end
end