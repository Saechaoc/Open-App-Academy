class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p "To play, enter two numbers representing where you would like to place your mark. Ex:1 2"
        input = gets.chomp.split(' ').map {|str| str.to_i}
        while !legal_positions.include?(input)
            p "To play, enter two numbers representing where you would like to place your mark. Ex:1 2"
            input = gets.chomp.split(' ').map {|str| str.to_i}
        end

        input 
    end
    
    #Valid only if two numbers seperated by a space
    def validInput?(input)
        #check if input is a number
        #if not num then return false
        input.each do |val|
            return false if val.to_i == 0 && val != "0"
        end
        true
    end

end