require 'oystercard'

describe Oystercard do

  it 'checks if the Oyster has balance 0' do
    expect(subject.balance).to eq 0
  end

  it 'tops up with 1 argument' do
    expect(subject.respond_to?(:top_up)).to be true
  end

  it 'raises and error if we exceed the max limit' do
    subject.top_up(91)
    expect { subject.top_up(1) }.to raise_error('Top up limit exceeded!')
  end

  # it 'deducts money from the card' do # < --- We now have a minimum fare to deduct, so we don't need this anymore.
  #   subject.top_up(5)
  #   subject.send(:deduct)
  #   expect(subject.deduct).to eq(balance-1)
  # end

  it 'checks if balance is bigger than max_value' do
    expect(subject.max?).not_to be true
  end

  it 'checks if we touched in' do
  	subject.top_up(1)
    expect(subject.touch_in).to eq true
  end

  it "checks if we're in a journey" do
    expect(subject.in_journey?).to eq(subject.in_use)
  end

  it "checks if we touched out" do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "raises an error if insufficent balance" do
  	expect { subject.touch_in }.to raise_error("Insufficent balance!")
  end

  it "checks if a charge is made on touch out" do
  	subject.top_up(5)
  	subject.touch_in
  	expect {subject.touch_out}.to change{subject.balance}.by(-1)
  end
end
