class Board
    attr_reader :grid, :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n*n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(position,value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        end
        self[pos] = :X
        false
    end

    def place_random_ships
        numShips = @size/4
        n = @grid.length
        while self.num_ships < numShips
            pos = [rand(n),rand(n)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |col|
                if col == :S
                    col = :N
                else
                    col
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
