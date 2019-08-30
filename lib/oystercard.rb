class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :trip_history

  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance =  0
    @entry_station = nil
    @trip_history = []
  end

  def top_up(amount)
    raise "top up limit of #{LIMIT} reached" if  (@balance + amount) > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "insufficient funds" if (@balance < MINIMUM)
    @entry_station = entry_station
    # @trip_history << entry_station #should create a hash with key within array
    @trip_history << {entry_station: entry_station, exit_station: nil}
  end

  def touch_out(exit_station)
    deduct(MINIMUM)
    @entry_station = nil
    # @trip_history << exit_station #should push into a hash within the array
    #@trip_history[-1][exit_station: exit_station]
    @trip_history[-1][:exit_station] = exit_station
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
