class Journey
  attr_reader :current_journey, :journeys, :amount

  def initialize
    @current_journey = {}
    @journeys = []
    @amount = 0
  end

  def entry_station(station)
    @current_journey[:entry_station] = station
    @current_journey[:exit_station] = "penalty fare"
  end

  def exit_station(station)
    @current_journey[:entry_station] = "penalty fare" if @current_journey[:entry_station] == false
    @current_journey[:exit_station] = station
    @journeys << @current_journey
    @current_journey = {}
    fare
  end

  def fare
    if


  end



end
