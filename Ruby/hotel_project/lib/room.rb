class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.count < @capacity
            return false
        end
        true
    end

    def available_space
        return @capacity - @occupants.count
    end

    def add_occupant(name)
        if self.full?
            return false
        end
        @occupants << name
        true
    end
end