require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/location")
require_relative("../models/weather_variable")
require_relative("../models/forecast_generated_at")
require_relative("../models/forecast")
require 'json'

configure do
  enable :cross_origin
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

get "/forecast/:location_name/:weather_variable" do
  puts "Got called with #{params[:location_name]} and #{params[:weather_variable]}"
  @forecast_generated_at = ForecastGeneratedAt.find(params[:location_name], params[:weather_variable])
  if(@forecast_generated_at != nil)
    forecast_generated_at_id = @forecast_generated_at["id"].to_i
    @forecasts = Forecast.find(forecast_generated_at_id)
    if(@forecasts != nil)
      status 200
      content_type :json
      @forecasts
    else
      status 404
      # change to return JSON object - notify user of wrong details
    end
  else
    status 404
  end
end

options "*" do
  response.headers["Allow"] = "GET, POST, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end
