require 'oystercard'

describe Oystercard do
	subject { Oystercard.new }

	it "checks if the Oyster has balance 0" do
		expect(subject.balance).to eq 0
	end
end
