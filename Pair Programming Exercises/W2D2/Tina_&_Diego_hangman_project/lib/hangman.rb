class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|ele, index| indices << index if ele == char}
    indices
  end

  def fill_indices(char, arr)
    arr.each {|index| @guess_word[index] = char}
    # @guess_word.each.with_index {|ele, idx| @guess_word[idx] = char if arr.include?(idx)}
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
      arr = get_matching_indices(char)
      fill_indices(char, arr)
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    false
  end

end
