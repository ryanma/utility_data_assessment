class QueryService
  attr :query

  def initialize(query: nil)
    raise ArgumentError if query.nil?
    @query = query
  end

  def call
    puts @query

    connection = Faraday.new({
      url: "https://api.eia.gov/v2/electricity/rto/daily-fuel-type-data/data",
      params: {
        api_key: "R3BY2bN0rjde1WYXicc41vuBo6YMeOfkYZEU6FOt"
      },
      headers: {
        'X-Params': {
          frequency: "daily",
          data: [ "value" ],
          facets: {
            timezone: [ "Eastern" ],
            respondent: [ "PJM" ]
          },
          start: "2024-03-01",
          end: "2024-03-03",
          sort: [ {
            column: "period",
            direction: "desc"
          } ],
          offset: 0,
          length: 5000
        }.to_json()
      }
    })

    connection.get()
  end
end
