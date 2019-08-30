class Flight
    attr_reader :passengers
    def initialize(flight, capacity)
        @flight_number = flight
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        return false if @passengers.length < @capacity
    end

    def board_passenger(pas)
        if !self.full?
            @passengers << pas if pas.has_flight?(@flight_number)
        end  
        
    end

    def list_passengers
        res = []
        @passengers.each do |el|
            res << el.name
        end
        res
    end
    def [](index)
        @passengers[index]
    end

    def <<(pas)
        board_passenger(pas)
    end
end

# flight = Flight.new(balbalba)
# pas = Passenger.new(blablabla)

# flight.<<(525)
# flight << pas