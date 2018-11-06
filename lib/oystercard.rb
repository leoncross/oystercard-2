require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :current_journey
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @journey.entry_station(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey.exit_station(station)

	end

  def in_journey?
    !@journey.current_journey.empty?
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
