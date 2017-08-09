MAX_VALUE = 90
MIN_VALUE = 1

class Oystercard
  attr_accessor :balance, :max_value, :in_use

  def initialize(balance = 0)
    @balance = balance
    @max_value = MAX_VALUE
    @in_use = false
    @min_value = MIN_VALUE
  end

  def top_up(value)
    raise 'Top up limit exceeded!' if max?
    @balance += value
    "£#{balance}"
  end

  def deduct(amount)
    @balance -= amount
    balance
  end

  def max?
    @balance >= max_value
  end

  def touch_in
 	raise("Insufficent balance!") if insuff_balance?
    @in_use = true
  end

  def in_journey?
    @in_use
  end

  def touch_out
  	@in_use = false
  end

  def insuff_balance?
  	@balance < @min_value
  end

end
