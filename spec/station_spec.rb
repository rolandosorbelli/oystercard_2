require 'oystercard'

describe Station do

	subject { Station.new "Oxford Circus", 1  }

	it "exposes the name of the station" do
		expect(subject.name).to eq("Oxford Circus")
	end

	it "exposes the zone of the station" do
		expect(subject.zone).to eq(1)
	end
end