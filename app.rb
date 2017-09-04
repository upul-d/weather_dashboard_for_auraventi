require_relative("comms/request")
require_relative("models/location")
require_relative("models/weather_variable")
require_relative("models/forecast_generated_at")
require_relative("models/forecast")
require "rubygems"
require "json"

class Run
  def main()
    # yet to call processForecast for the 4 remaining weatherVariables
    processForecast("findhorn", "humidity")
    processForecast("findhorn", "temperature")
  end

  def processForecast(location, weatherVariable)
    responseBodyJSON = Request.new().getBody(weatherVariable, location, nil)
    parsedResponseBody = JSON.parse(responseBodyJSON.to_s)
    
    writeLocation(parsedResponseBody)
    writeWeatherVariable(parsedResponseBody)
    # 2 more DB write methods needed
    # writeFGA(parsedResponseBody)
    # writeForecasts(parsedResponseBody)
  end

  def writeLocation(parsedResponseBody)
    responseLocation = Location.new({
      "name" => "#{parsedResponseBody["location"]}"
      })
    responseLocation.save()
  end

  def writeWeatherVariable(parsedResponseBody)
    responseWeatherVariable = WeatherVariable.new({
      "name" => "#{parsedResponseBody["predictionType"]}"
      })
    responseWeatherVariable.save()
  end
end

Run.new().main()