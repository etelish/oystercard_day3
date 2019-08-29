class Oystercard
  attr_reader :balance
  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance =  0
    @in_journey = false
  end

  def top_up(amount)
    raise "top up limit of #{LIMIT} reached" if  (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "insufficient funds" if (@balance < MINIMUM)
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
