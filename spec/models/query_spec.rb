require 'rails_helper'

RSpec.describe Query, type: :model do
  it 'validates presence of start date' do
    expect(Query.new(respondent: 'PJM', end: "2020-01-01").valid?).to be false
  end

  it 'validates presence of end date' do
    expect(Query.new(respondent: 'PJM', start: "2020-01-01").valid?).to be false
  end

  it 'validates presence of respondent' do
    expect(Query.new(respondent: nil, start: "2020-01-01", end: "2020-01-01").valid?).to be false
  end

  it 'restricts values of respondents' do
    query = Query.new()
    expect { query.respondent = "BOGUS" }.to raise_error ArgumentError
  end
end
