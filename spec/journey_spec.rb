require "journey"

describe Journey do
  let(:station) { 'station' }

  it 'has an empty list of journeys on initialization' do
    expect(subject.journeys.length).to eq 0
  end

  it "adds a station to the @current_journey hash" do
    subject.entry_station(station)
    expect(subject.current_journey[:entry_station]).to eq station
  end

  it "records the station you touched out at" do
      subject.entry_station(station)
      subject.exit_station(station)
      expect(subject.journeys[0][:exit_station]).to eq station
    end


  it "adds the full journey to @journeys" do
    subject.exit_station(station)
    expect(subject.journeys.length).to eq 1
  end

  it "deletes the entry on exit_station" do
    subject.exit_station(station)
    expect(subject.current_journey.length).to eq 0
  end

  it "counts the fare as a completed journey for the minimum fare" do
    subject.entry_station(station)
    subject.exit_station(station)
    expect(subject.amount).to eq -1
  end

  it "ensures a penalty fare of 6 has been given for a failed journey" do
    subject.entry_station(station)
    expect(subject.amount).to eq 6


end
