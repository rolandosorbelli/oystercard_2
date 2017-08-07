require 'oystercard'

describe Oystercard do
	subject { Oystercard.new }

	it "checks if the Oyster has balance 0" do
		expect(subject.balance).to eq 0
	end

  it "tops up with 1 argument" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
end
