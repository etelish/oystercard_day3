class Oystercard
  attr_reader :balance
  attr_reader :entry_station

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance =  0

    @entry_station = nil
  end

  def top_up(amount)
    raise "top up limit of #{LIMIT} reached" if  (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "insufficient funds" if (@balance < MINIMUM)
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM)
    @entry_station = nil
  end

  def in_journey?
     @entry_station != nil

  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
