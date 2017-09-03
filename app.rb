require_relative("comms/request")
require_relative("models/location")
require_relative("models/weather_variable")
require_relative("models/forecast_generated_at")
require_relative("models/forecast")
require "rubygems"
require "json"

responseBody = Request.new().getBody("cloudcover", "findhorn", {:length => 3});
#to do above - change queryParams to nil

puts "responseBody: " + responseBody