MAX_VALUE = 90

class Oystercard
  attr_accessor :balance, :max_value, :in_use

  def initialize(balance = 0, in_use = false)
    @balance = balance
    @max_value = MAX_VALUE
    @in_use = in_use
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
    true
  end

  def in_journey?
    in_use == true
  end

  def touch_out; end
end
