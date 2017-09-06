require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/location")
require_relative("../models/weather_variable")
require_relative("../models/forecast_generated_at")
require_relative("../models/forecast")
require 'json'

get "/forecast/:location_name/:weather_variable" do
  puts "Got called with #{params[:location_name]} and #{params[:weather_variable]}"
  @forecast_generated_at = ForecastGeneratedAt.find(params[:location_name], params[:weather_variable])
  if(@forecast_generated_at != nil)
    @forecast_generated_at_id = @forecast_generated_at["id"].to_i
    @forecasts = Forecast.find(@forecast_generated_at_id)
    if(@forecasts != nil)
      status 200
      content_type :json
      @forecasts
    else
      status 404
    end
  else
    status 404
  end
end