require_relative("comms/request")
require_relative("models/location")
require_relative("models/weather_variable")
require_relative("models/forecast_generated_at")
require_relative("models/forecast")
require "rubygems"
require "json"

class Run
  def main()
    # yet to call processForecast for the 5 remaining weatherVariables
    processForecast("findhorn", "humidity")
  end

  def processForecast(location, weatherVariable)
    responseBodyJSON = Request.new().getBody(weatherVariable, location, nil)
    parsedResponseBody = JSON.parse(responseBodyJSON.to_s)
    
    writeLocation(parsedResponseBody)
    # 3 more DB write methods needed
    # writeWeatherVariable(parsedResponseBody)
    # writeFGA(parsedResponseBody)
    # writeForecasts(parsedResponseBody)
  end

  def writeLocation(parsedResponseBody)
    responseLocation = Location.new({
      "name" => "#{parsedResponseBody["location"]}"
      })
    responseLocation.save()
  end
end

Run.new().main()