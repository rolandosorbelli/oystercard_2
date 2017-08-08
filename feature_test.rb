require './lib/oystercard'

oystercard = Oystercard.new

p oystercard.balance

p oystercard.max?

p oystercard.top_up(40)
p oystercard.top_up(50)
p oystercard.top_up(1)
p oystercard.touch_in
p oystercard.touch_out
