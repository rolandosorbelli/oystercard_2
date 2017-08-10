MAX_VALUE = 90
MIN_VALUE = 1

class Oystercard
  attr_accessor :balance, :max_value, :in_use, :entry_station, :journey_history, :journey

  def initialize(balance = 0)
    @balance = balance
    @max_value = MAX_VALUE
    @in_use = false
    @min_value = MIN_VALUE
    @entry_station = nil
    @journey_history = []
    @journey = {}
  end

  def top_up(value)
    raise 'Top up limit exceeded!' if max?
    @balance += value
    "£#{balance}"
  end

  def max?
    @balance >= max_value
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    raise('Insufficent balance!') if insuff_balance?
    @in_use = true
    @journey = {entry_station => "Not touched out yet"}
  end

  def in_journey?
    @entry_station != nil 
  end

  def touch_out(exit_station)
    @journey = {@entry_station => exit_station}
    @journey_history << @journey
    @journey = {}
    deduct
    @entry_station = nil
  end

  def insuff_balance?
    @balance < @min_value
  end

  private

  def deduct
    @balance -= @min_value
    "£#{balance}"
 end
end
