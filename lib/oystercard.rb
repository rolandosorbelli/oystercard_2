MAX_VALUE = 90

class Oystercard

	attr_accessor :balance, :max_value

	def initialize(balance = 0)
		@balance = balance
		@max_value = MAX_VALUE
	end

	def top_up(value)
		raise "Top up limit exceeded!" if @balance > max_value
		@balance += value
		return "£#{balance}"
	end

	# def max?
	# 	@max_value
	# end

end
