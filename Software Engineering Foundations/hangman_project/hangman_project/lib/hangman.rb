class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def self.random_word
      DICTIONARY.sample
    end

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length,"_")
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

    def already_attempted?(char)
      @attempted_chars.include?(char)
    end
    
    def get_matching_indices(char)
      matching = []

      @secret_word.split('').each_with_index do |value, idx|
        matching << idx if char.casecmp?(value)
      end
      matching
    end

    def fill_indices(char, indices)
      indices.each {|idx| @guess_word[idx] = char}
    end

    def try_guess(char)
      if self.already_attempted?(char)
        p "that has already been attempted"
        return false
      else
        @attempted_chars.push(char)
        findIdx = self.get_matching_indices(char)
        if findIdx == []
          @remaining_incorrect_guesses -= 1
        else
          self.fill_indices(char, findIdx)
        end
      end

      true
    end

    def ask_user_for_guess
      p "Enter a char:"
      input = gets.chomp
      self.try_guess(input)
    end

    def win?
      if @guess_word.join('').casecmp?(@secret_word)
        p 'WIN'
        return true
      end

      false
    end

    def lose?
      if @remaining_incorrect_guesses != 0
        return false
      end
      p 'LOSE'
      true
    end

    def game_over?
      if self.win? || self.lose?
        p @secret_word
        return true
      end
      false
    end
    
end
