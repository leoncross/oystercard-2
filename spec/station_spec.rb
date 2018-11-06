require "station"

describe Station do
  let(:name) {double :name}
  let(:zone) {double :zone}
  let(:test_station) {Station.new(name, zone)}


  it "has a name variable" do
    expect(test_station.name).to eq(name)
  end
  it "has a zone variable" do
    expect(test_station.zone).to eq(zone)
  end
end
