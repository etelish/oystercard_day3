class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance =  0
  end

  def top_up(amount)

    raise "top up limit of #{LIMIT} reached" if  (@balance + amount) > 90

    @balance += amount
  end




end
