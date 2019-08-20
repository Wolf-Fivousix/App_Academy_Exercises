require_relative "room"

class Hotel
    def initialize (name, room_names)
        @name = name
        @rooms = {}
        
        room_names.each {|key, value| @rooms[key] = Room.new(value) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists? (room_name)
        @rooms.has_key?(room_name)
    end

    def check_in (person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each {|room, value| return true if !room.full?}
        false
    end

    def list_rooms
        @rooms.each do |name, data|
            puts "#{name}.*#{data.available_space}"
        end
    end
end
