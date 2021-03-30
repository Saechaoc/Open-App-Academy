# require 'pry'

class Board
    attr_reader :grid, :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n,"_")}
        @size = n * n
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(' ')
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end

    #check if the position is out of bounds
    def validPos?(pos)
        row, col = pos
        len = @grid.length
        if row < 0 || col < 0 || row >= len || col >= len
            return false
        end
        true
    end

    def empty?(pos)
        if self[pos] == "_"
            return true
        end
        false
    end

    #method returns true if valid position && empty
    def canMark?(pos)
        empty?(pos) && validPos?(pos)
    end

    def place_mark?(pos, mark)
        if canMark?(pos)
            self[pos] = mark
        else
            raise StandardError.new('Invalid Mark')
        end
    end

    def print
        Board.print_grid(@grid)
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all?(mark)
        end
        false
    end

    def win_col?(mark)
        invMatrix = @grid.transpose
        invMatrix.each do |row|
            return true if row.all?(mark)
        end
        false
    end

    def win_diagonal?(mark)
        newArr = (0...@grid.length).collect {|i| @grid[i][i]}
        newArr.all?(mark)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |col|
                return true if col.eql?("_")
            end
        end
        false
    end

    def fill
        len = @grid.length
        @grid = Array.new(len) {Array.new(len, :X)}
    end

    def legal_positions
        pos = []
        @grid.each_with_index do |row, idx|
            row.each_with_index do |col, jidx|
                tempPos = [idx,jidx]
                pos << tempPos if canMark?(tempPos)
            end
        end
        pos     
    end

    def clear
        n = @grid.length
        @grid = Array.new(n) {Array.new(n,"_")}
    end

end