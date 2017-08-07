require './lib/oystercard'

oystercard = Oystercard.new

p oystercard.balance

p oystercard.top_up(10)
p oystercard.top_up(20)
