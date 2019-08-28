class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.each { |peg| return false if !POSSIBLE_PEGS.include?(peg.upcase) }
    true
  end

  def initialize(pegs)
    raise if !Code.valid_pegs?(pegs)
    #.map { |peg| peg.upcase }
      @pegs = pegs.map(&:upcase)
  end

  attr_reader :pegs

  def self.random(length)
    random_pegs = []
    length.times { |_x| random_pegs << POSSIBLE_PEGS.keys.sample  }
    Code.new(random_pegs)
    
    # possible_pegs = ["R", "G", "B", "Y"]
    # random_pegs = []
    # length.times { |_x| random_pegs << possible_pegs[rand(possible_pegs.length-1)]}
    # Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    counter = 0
    guess.pegs.each_with_index {|peg, idx| counter += 1 if peg == @pegs[idx] }
    counter
  end
# ["R", "G", "R", "B"] => Original
# ["R", "G", "R", "B"]))).to eq(0)
# ["R", "R", "R", "R"]))).to eq(2)
  def num_near_matches(guess)
    counter = 0
    guess.pegs.each { |peg| counter += 1 if @pegs.include?(peg) }
    counter - num_exact_matches(guess)
  end

  def ==(code)
    code.pegs == self.pegs
  end
end