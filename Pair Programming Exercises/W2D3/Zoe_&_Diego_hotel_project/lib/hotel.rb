require_relative "room"

class Hotel
    attr_reader :rooms


    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new{|hash, key| hash[key] = Room.new()}
        rooms.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
        @name.split(" ").map { |word| word.capitalize }.join(" ")
    end

    def room_exists?(room_name)
        # @rooms[room_name].empty?
        @rooms.has_key?(room_name)
    end
require "byebug"
    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each_key {|room| return true if !@rooms[room].full? }
        false
    end
    #/Basement.*4\nAttic.*2\nUnder the Stairs.*0\n/)
    # "#{room}.*#{@rooms[room].available_space}"
    def list_rooms 
        @rooms.each_key { |room| puts room + " " + @rooms[room].available_space.to_s }
    end


end
