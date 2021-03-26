require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end
    
    def print_matches(otherCode)
        print @secret_code.num_exact_matches(otherCode)
        print @secret_code.num_near_matches(otherCode)
    end

    def ask_user_for_guess
        puts 'Enter a code'
        input = gets.chomp.to_s
        newCode = Code.from_string(input)
        print_matches(newCode)
        newCode == @secret_code
    end
end
