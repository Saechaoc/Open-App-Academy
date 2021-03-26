require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player, :remaining_misses
    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts "Number of Ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        end
        false
    end

    def game_over?
        self.lose? || self.win?
    end

    def turn
        pos = @player.get_move
        #make sure it's a legal move
        while !legalMove?(pos)
            puts "Please enter a legal move"
            pos = @player.get_move
        end

        if !@board.attack(pos)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end

    def legalMove?(pos)
        row, col = pos
        if row > @board.grid.length - 1 || row < 0
            return false
        end
        if col > @board.grid.length - 1 || col < 0
            return false
        end
        true
    end
end
