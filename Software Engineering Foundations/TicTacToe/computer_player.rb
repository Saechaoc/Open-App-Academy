class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    #return a random positions
    def get_position(legal_positions)
        legal_positions.sample
    end

end
