require 'weather'

describe Weather do

  describe "#stormy?" do
    it { is_expected.to respond_to :stormy? }

  end

  describe "#weather_generator" do
    it { is_expected.to respond_to :weather_generator }

    it "will return a random integer between 1 and 100" do
      expect(subject.weather_generator).to be_between(1, 100)
    end
  end
end
