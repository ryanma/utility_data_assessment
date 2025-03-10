require 'rails_helper'

RSpec.describe QueryService do
  let(:query) { Query.create(start: "2020-01-01", end: "2020-01-02", respondent: "ERCO") }
  it 'needs a query object' do
    expect { QueryService.new(query: nil) }.to raise_error ArgumentError
  end

  it 'queries the EIA api' do
    expect(Faraday).to receive(:new).and_return(double({ get: true }))

    QueryService.new(query:).call
  end
end
