require_relative("../models/location")
require_relative("../models/weather_variable")

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

