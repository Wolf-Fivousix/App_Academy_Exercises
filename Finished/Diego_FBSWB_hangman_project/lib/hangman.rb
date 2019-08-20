class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    @@random_word = DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.size, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
      @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted? (char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices (char)
    indices = []
    @secret_word.each_char.with_index {|letter, index| indices << index if letter === char}
    indices
  end

  def fill_indices (char, indices_array)
    indices_array.each {|index| @guess_word[index] = char}
  end

  def try_guess (char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    elsif self.get_matching_indices(char) === []
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, self.get_matching_indices(char))
    end
    @attempted_chars << char
    true
  end

  def ask_user_for_guess
    p "Enter a char: "
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    return false if @guess_word.join("") != @secret_word
    p "WIN"
    true
  end
      
  def lose?
    return false if @remaining_incorrect_guesses != 0
    p "LOSE" if @remaining_incorrect_guesses === 0
    true
  end

  def game_over?
    return false if !(self.win? || self.lose?)
    p @secret_word
    true
  end
end
