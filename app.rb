require_relative("comms/request")
require_relative("models/location")
require_relative("models/weather_variable")
require_relative("models/forecast_generated_at")
require_relative("models/forecast")
require "rubygems"
require "json"

class Run
  def initialize()
    @responseLocation = nil
    @responseWeatherVariable = nil
    @responseFGA = nil
    # @forecastsFromResponse = []
    main()
  end

  def main()
    # yet to call processForecast for the 3 remaining weatherVariables
    processForecast("findhorn", "humidity")
    processForecast("findhorn", "temperature")
    processForecast("findhorn", "cloudcover")
  end

  def processForecast(location, weatherVariable)
    responseBodyJSON = Request.new().getBody(weatherVariable, location, nil)
    parsedResponseBody = JSON.parse(responseBodyJSON.to_s)
    
    writeLocation(parsedResponseBody)
    writeWeatherVariable(parsedResponseBody)
    # 1 more DB write method needed
    writeForecastGeneratedAt(parsedResponseBody)
    # writeForecasts(parsedResponseBody)
  end

  def writeLocation(parsedResponseBody)
    responseLocation = Location.new({
      "name" => "#{parsedResponseBody["location"]}"
      })
    responseLocation.save()
    @responseLocation = responseLocation
  end

  def writeWeatherVariable(parsedResponseBody)
    responseWeatherVariable = WeatherVariable.new({
      "name" => "#{parsedResponseBody["predictionType"]}"
      })
    responseWeatherVariable.save()
    @responseWeatherVariable = responseWeatherVariable
  end

  def writeForecastGeneratedAt(parsedResponseBody)
    responseFGA = ForecastGeneratedAt.new({
      "time_stamp" => Time.now.hour.to_i,
      "location_id" => @responseLocation.id,
      "weather_variable_id" => @responseWeatherVariable.id
      })
    responseFGA.save()
    @responseFGA = responseFGA
  end
end

Run.new()