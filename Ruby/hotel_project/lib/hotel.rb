require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}

        rooms.each do |key,value|
            @rooms[key] = Room.new(value)
        end
    end

    def name
        str = []
        wordArr = @name.split(' ')
        wordArr.each do |word|
            word.downcase!
            str.push(word[0].upcase + word[1..word.length])
        end
        str.join(' ')
    end

    def rooms
        @rooms
    end


    def room_exists?(name)
        @rooms.key?(name)
    end
    
    def check_in(person, room)
        if !self.room_exists?(room)
            p "sorry, room does not exist"
            return
        end
        
        if !@rooms[room].add_occupant(person)
            p 'sorry, room is full'
        else
            p 'check in successful'
        end
    end

    def has_vacancy?
        @rooms.any? {|key,value| !value.full?}
    end

    def list_rooms
        @rooms.each do |key, room|
            puts key + ".*" + room.available_space.to_s
        end
    end

end
