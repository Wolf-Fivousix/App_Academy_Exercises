require_relative "card.rb"
class Board
#guessed_pos ?

    def initialize(size)
        raise "Please provide an even number" if size.odd?
        @size = size
        @cards = []
        @board = Array.new(@size) { Array.new(@size) }
    end

    def populate
        num_cards_u = @size ** 2 / 2
        deck = []
        num_cards_u.times { |card| deck.push(Card.new(card + 1), Card.new(card + 1)) }
        deck.shuffle!

        @board.each.with_index do |row, idx|
            row.each.with_index do |col, jdx|
                @board[idx][jdx] = deck.shift
                # @board[idx][jdx].reveal  # test to make sure .won? worked
            end
        end
        true
        # Or say we have 10 or 20 cards to make our board 
            # Why don't we make 10 cards, shuffle them. 
                # array.shuffle 
            # iterate through the board and put them in. 
    end

    def [](position)
        @board[position[0]][position[1]]
    end

    def render 
        @size.times do | row |
            @size.times do | col | 
                position = [row, col]
                if self[position].face_up 
                    print self[position].to_s + " "
                else 
                    print "XX" + " "
                end
            end
            puts
        end

    # iterate through board, 
     # check if face_up?
      # If so, print face_value 
      # else, print "XX"

        #render should print out a representation of the Board's current state
        

        # # Print every single array
        #     [ 06 XX XX 14 ]
        #     [ X 4 X X ] 
        #     [ X X X 6 ]
    end

    def won?
        @board.flatten.map(&:face_up).all?
    end

    def reveal(position)
        card = @board[position]
        unless card.face_up
            card.reveal
            return card.face_value
        end
    end
end 