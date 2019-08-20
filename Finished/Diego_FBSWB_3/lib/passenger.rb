class Passenger
    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.each do |flight|
            return true if flight.downcase === flight_number.downcase
        end
        false
    end

    def add_flight(flight_number)
        @flight_numbers << flight_number.upcase if !self.has_flight?(flight_number)
    end
end