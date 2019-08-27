class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        if num == @secret_num
            p 'you win' 
            @game_over = true
        end

        p 'too big' if num > @secret_num
        p 'too small' if num < @secret_num
        @num_attempts += 1
    end

    def ask_user
        p 'enter a number'
        input = gets.chomp.to_i
        check_num(input)
    end
end
