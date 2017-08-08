require 'oystercard'

describe Oystercard do
	subject { Oystercard.new }
	# let (:max_value) {double :max_value}

	it "checks if the Oyster has balance 0" do
		expect(subject.balance).to eq 0
	end

  it "tops up with 1 argument" do
  	expect(subject.respond_to? :top_up).to be true
  end

  it "raises and error if we exceed the max limit" do
  	oystercard = Oystercard.new
  	value = oystercard.top_up(900000)
  	expect { oystercard.top_up(1) }.to raise_error("Top up limit exceeded!")
  end

  it "checks if balance is bigger than max_value" do
  	min_balance = subject.balance
  	expect(subject.max?).to be_true if (:balance > :max_value)
  end

end
