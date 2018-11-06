class Journey
  attr_reader :current_journey, :journeys, :journey_fare

  def initialize
    @current_journey = {}
    @journeys = []
    @journey_fare = 0
  end

  def entry_station(station)
    @current_journey = { :entry_station => station, :exit_station => "penalty fare" }
    fare
  end

  def exit_station(station)
    @current_journey[:entry_station] = "penalty fare" if @current_journey[:entry_station] == nil
    @current_journey[:exit_station] = station
    exit_station_completion_process
  end

  def exit_station_completion_process
    @journeys << @current_journey
    fare
    @current_journey = {}
  end

  def fare
    @current_journey.has_value?("penalty fare") ? @journey_fare = 6 : @journey_fare = 1
  
  end

  def in_journey?
  end

end
