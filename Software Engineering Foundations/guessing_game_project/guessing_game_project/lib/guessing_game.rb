class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts +=1

        if num > @secret_num
            p "too big"
        elsif num < @secret_num
            p "too small"
        else 
            @game_over = true 
            p "you win"
        end
    end

    def ask_user
        print "enter a number"
        input = gets.chomp.to_i
        self.check_num(input)
    end
end