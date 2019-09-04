# Game

# The Game should have instance variable for the Board and
    #  the previously-guessed position (if any). 
# It should also have methods for managing the Board-Player interaction. 
# You may want a play loop that runs until the game is over. 
    # Inside the loop, you should render the board, prompt the player for input, 
    # and get a guessed pos. Pass this pos to a make_guess method, where 
    # you will handle the actual memory/matching logic.  
    
#Some tips on implementing this:

# If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
# If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
# If the cards match, we should leave them both face-up.
# Else, flip both cards face-down.
# In either case, reset previous_guess.
# It wouldn't be an interesting game if the player could see their previous moves. 
# Run system("clear") before rendering the Board. This will hide any previous output 
    # from the player. sleep(n) will pause the program for n seconds. Use this method to (temporarily)
    #  show the player an incorrect guess before flipping the Cards face-down again.

require_relative "board.rb"
require_relative "card.rb"

class Game 
    # make a loop as a method
    # object oriented: call an object or do something to the object. 
    # while the game is an object
    # where we do the actual checking... 
        # call card 1, return value 
        # call card 2 
        #    If both match, that

        # play (loop)
        # prompt 
        # pos 
        # make_guess 
        # guessed_pos 
        # previous_guess
    
    def initialize
        @players = [0, 0]
        @previous_guess = []
    end

    # create the board
    def board_init
        puts "Board Size (even numbers only): "
        input = gets.chomp.to_i
        @board = Board.new(input)
        @board.populate
    end 

    # Get an input for the position
    def prompt
        puts "Row, Column"
        input = gets.chomp
        position = input.split(", ")
        raise "Please provide two numbers; ex: 1, 2" unless position.length == 2
        position.map(&:to_i)
    end
    
    # def guessed
    # end

    # compare guess to previous card 
    def compare
        puts "Make your first guess"
        @previous_guess = self.prompt 
        @board[@previous_guess].reveal
        @board.render 
        puts

        puts "Guess a different position"  
        current_guess = self.prompt # call self.prompt twice. 
        while (current_guess == @previous_guess)
            puts "Guess a different position"
            current_guess = self.prompt # call self.prompt twice. 
        end
        @board[current_guess].reveal
        puts

        # If there has been a previous guess
        if current_guess == @previous_guess # if a pair
            puts "Congrats"
            # reveal the cards
            true
        else
            # Make the cards hidden, return false
            @board[current_guess].reveal
            @board[@previous_guess].reveal
            false
        end
    end 

    # Play Loop
    def play_loop
        self.board_init 
        current_player = 0 
        until @board.won? 
            @board.render       # Show the board
            puts
            @players[current_player] += 1 if self.compare     # Get a guess
            current_player = (current_player + 1) % 2 
            @board.render
            puts
            # Compare the guess 
                # If match, obtain their score?!? 
            # Else, switch player. 
        end
    end

end

# Always reveals cards, regardless of whether they matched or not. 
# Also, prevent players from calling already revealed cards next time. 

game = Game.new
game.play_loop