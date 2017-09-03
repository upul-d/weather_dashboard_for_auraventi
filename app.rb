require_relative("comms/request")
require_relative("models/location")
require_relative("models/weather_variable")
require_relative("models/forecast_generated_at")
require_relative("models/forecast")
require "rubygems"
require "json"

class Run
  def main()
    # will call processForecast x6 (for each of the weatherVariables)
  end

  def processForecast(location, weatherVariable)
    responseBodyJSON = Request.new().getBody(weatherVariable, location, nil)
    
    # 4 methods to be written for writing to DB
    writeLocation(responseBodyJSON)
    writeWeatherVariable(responseBodyJSON)
    writeFGA(responseBodyJSON)
    writeForecasts(responseBodyJSON)
  end
end
# Run.new().main()
