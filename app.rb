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
    @forecastsFromResponse = []
    main()
  end

  def main()
    processForecast("findhorn", "humidity")
    processForecast("findhorn", "temperature")
    processForecast("findhorn", "cloudcover")
    processForecast("findhorn", "windspeed")
    processForecast("findhorn", "precipintensity")
    processForecast("findhorn", "precipprobability")
  end

  def processForecast(location, weatherVariable)
    responseBodyJSON = Request.new().getBody(weatherVariable, location, nil)
    parsedResponseBody = JSON.parse(responseBodyJSON.to_s)
    
    writeLocation(parsedResponseBody)
    writeWeatherVariable(parsedResponseBody)
    writeForecastGeneratedAt(parsedResponseBody)
    writeForecasts(parsedResponseBody)
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

  def writeForecasts(parsedResponseBody)
    puts("writeForecasts #{@responseFGA}")
    forecastsArray = parsedResponseBody["forecasts"]

    forecastsArray.each{ |forecast|
      forecastFromResponse = Forecast.new({
        "FGA_id" => @responseFGA.id,
        "time_stamp" => forecast["timeStamp"].to_i,
        "time_GMT" => forecast["timeGMT"],
        "value" => forecast["forecast"].to_f
        })
      forecastFromResponse.save()
      @forecastsFromResponse.push(forecastFromResponse)
    }
  end
end

Run.new()