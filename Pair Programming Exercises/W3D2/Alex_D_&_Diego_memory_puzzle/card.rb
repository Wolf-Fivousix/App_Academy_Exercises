# Class attributes
# the face value (1, 2, 3, AKQJ)
# Face up or Down. A boolean. 

# A couple methods for implementation later 
    # hide 
    # reveal (if down, make face up)
    # to_s to convert to a name 
    # #== to reveal.

# 

class Card
    attr_reader :face_value, :face_up # card doesn't know what's going on outside card. A card shouldn't know outside itself
    # calling or worrying about cheating should be in the board.Class 

    def initialize(value)
        @face_value = value
        @face_up = false 

    end

    def ==(other_card) # compare the face_value. 
        @face_value == other_card.face_value
    end

    def reveal # returns true or false based upon 
        @face_up ? @face_up = false : @face_up = true
        # if @face_up
        #     @face_up = false
        # else
        #     @face_up = true
        # end
        # CONDITION ? if true : else
        # if @face_up (left) is true,  do the statement on the right. If false, do the statement AFTER the colon.
        # instead of using if !a, use `unless a`... 
    end

    def to_s 
        if face_value < 10
            "0" + face_value.to_s
        else
            face_value.to_s # no @ since getter defined
        end
    end 

end