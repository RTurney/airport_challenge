require 'airport'

describe Airport do
  let(:plane) { double :plane }
  describe '#land plane' do

    it "adds a plane to plane_list" do
      subject.land(plane)
      expect(subject.aircraft_list).to include(plane)
    end

    it "returns an error if the airport is at maximum capacity" do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The hangar is full"
    end
  end

  describe '#take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "makes a plane take off from the airport" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.aircraft_list).not_to include(plane)
    end
  end

  describe "capacity" do

    it "has a default capacity" do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The hangar is full"
    end

    it "can be overwritten when initialised" do
      new_capacity = 10
      airport = Airport.new(new_capacity)
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "The hangar is full"
    end
  end
end
