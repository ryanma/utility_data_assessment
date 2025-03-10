class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end

  def show
    # TODO: replace with queried data
    # TODO: refactor into a decorator object
    @query = Query.find params[:id]
    queried_data = JSON.parse(File.read("data.json"))["response"]["data"]
    dataframe = Daru::DataFrame.new(queried_data)

    @fueltypes = dataframe["fueltype"].uniq.to_a
    @usage_by_type = {}

    @fueltypes.each do |type|
      @usage_by_type[type] = dataframe.where(
        dataframe["fueltype"].in([ type ])
      ).to_json
    end
  end

  def create
    # TODO: create query object from form submission
    # TODO: query API data from EIA
  end

  def new
    @query = Query.new()
  end

  private

  def clean_params
    params.require(:query).permit(:start, :end, :respondent)
  end
end
