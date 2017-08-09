require 'oystercard'

describe Oystercard do
  let(:entry_station) { double('entry_station') }

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
    expect(subject.touch_in(entry_station)).to be_instance_of(Array)
  end

  it "checks if we're in a journey" do
    expect(subject.in_journey?).to eq(subject.entry_station)
  end

  it 'checks if we touched out' do
    subject.top_up(1)
    subject.touch_in(entry_station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'raises an error if insufficent balance' do
    expect { subject.touch_in(entry_station) }.to raise_error('Insufficent balance!')
  end

  it 'checks if a charge is made on touch out' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect { subject.touch_out }.to change { subject.balance }.by(-1)
  end

  it 'remembers the entry station after the touch in' do
    subject.top_up(5)
    expect { subject.touch_in(entry_station) }.to change { subject.journey_history.size }.by(1)
  end
end
