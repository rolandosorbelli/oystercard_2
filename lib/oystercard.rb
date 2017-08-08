MAX_VALUE = 90

class Oystercard

	attr_accessor :balance, :max_value

	def initialize(balance = 0)
		@balance = balance
		@max_value = MAX_VALUE
	end

	def top_up(value)
		raise "Top up limit exceeded!" if max?
		@balance += value
		return "£#{balance}"
	end

	def max?
		@balance >= max_value
	end

end
