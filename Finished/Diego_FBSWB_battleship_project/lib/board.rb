class Board
    attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(position)
    if self[position] === :S
        self[position] = :H
        p "You sunk my battleship!"
        return true
    else
        self[position] = :X
    end
    false
  end

  def place_random_ships
    while self.num_ships < @size * 0.25
        @grid[rand(@grid.length)][rand(@grid.length)] = :S
    end
  end

  def hidden_ships_grid
    @grid.map {|sub_array| sub_array.map {|spot| spot === :S ? :N : spot}}
  end

  def self.print_grid(position)
    position.each do |row|
        puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
