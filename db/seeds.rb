require_relative("../models/location")
require_relative("../models/weather_variable")
require_relative("../models/forecast_generated_at")

location1 = Location.new({
  "name" => "Findhorn"
  })

location2 = Location.new({
  "name" => "Edinburgh"
  })

location1.save()
location2.save()

weather_variable1 = WeatherVariable.new({
  "name" => "Temperature"
  })

weather_variable2 = WeatherVariable.new({
  "name" => "Cloud Cover"
  })

weather_variable1.save()
weather_variable2.save()

forecast_generated_at1 = ForecastGeneratedAt.new({
  "time_stamp" => 1504392371,
  "location_id" => location1.id,
  "weather_variable_id" => weather_variable1.id
  })

forecast_generated_at2 = ForecastGeneratedAt.new({
  "time_stamp" => 1504392483,
  "location_id" => location2.id,
  "weather_variable_id" => weather_variable2.id
  })

forecast_generated_at1.save()
forecast_generated_at2.save()

