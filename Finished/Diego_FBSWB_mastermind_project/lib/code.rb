class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(letters)
    letters.each do |char|
      if !POSSIBLE_PEGS.has_key?(char.upcase)
        return false
      end
    end
    true
  end

  def self.random(length)
    sequence = []
    length.times {sequence << POSSIBLE_PEGS.keys.sample}
    Code.new(sequence)
  end

  def self.from_string(pegs)
    Code.new(pegs.chars)
  end

  def initialize(letters)
    raise "Invalid PEGS" if !Code.valid_pegs?(letters)
    @pegs = letters.join("").upcase.split("")
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    counter = 0
    guess.pegs.each.with_index {|letter, index| counter +=1 if @pegs[index] === letter}
    counter
  end

  def num_near_matches(guess)
    counter = 0
    guess.pegs.each {|peg| counter +=1 if @pegs.include?(peg)}
    counter - self.num_exact_matches(guess)
  end

  def ==(guess)
    @pegs == guess.pegs
  end
end
