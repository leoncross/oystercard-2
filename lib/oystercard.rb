class Oystercard
  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
	end

  def in_journey?
    !!@entry_station
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
