require_relative("../db/sql_runner")

class ForecastGeneratedAt

  attr_reader :id, :time_stamp, :location_id, :weather_variable_id

  def initialize(fga_hash)
    @id = fga_hash["id"].to_i if fga_hash["id"]
    @time_stamp = fga_hash["time_stamp"].to_i if fga_hash["time_stamp"]
    @location_id = fga_hash["location_id"].to_i if fga_hash["location_id"]
    @weather_variable_id = fga_hash["weather_variable_id"].to_i if fga_hash["weather_variable_id"]
  end

  def save()
    sql = "SELECT id, time_stamp, location_id, weather_variable_id from forecasts_generated_at WHERE (time_stamp=#{@time_stamp} AND location_id=#{@location_id} AND weather_variable_id=#{@weather_variable_id})"
    existingFGAHash = SqlRunner.run(sql).first
    if(existingFGAHash == nil)
      sql = "INSERT INTO forecasts_generated_at (time_stamp, location_id, weather_variable_id) VALUES (#{@time_stamp}, #{@location_id}, #{@weather_variable_id}) RETURNING id"
      fga = SqlRunner.run(sql).first
      @id = fga["id"].to_i
    else
      @id = existingFGAHash["id"].to_i
    end
  end

  def self.find(location, weatherVariable)
    #Find the location ID using the location name
    forecastLocation = Location.find(location)
    if(forecastLocation != nil)
      forecastLocationId = forecastLocation["id"].to_i
    else
      forecastLocationId = nil
    end

    #Find the weather variable ID using the weather variable name
    forecastWeatherVariable = WeatherVariable.find(weatherVariable)
    if(forecastWeatherVariable != nil)
      forecastWeatherVariableId = forecastWeatherVariable["id"].to_i
    else
      forecastWeatherVariableId = nil
    end

    #Get the rounded down timestamp
    fgaTimeStamp = Time.now.hour.to_i

    #Now look in the DB for a match
    if(forecastLocationId  != nil && forecastWeatherVariableId != nil)
      sql = "SELECT id, time_stamp, location_id, weather_variable_id from forecasts_generated_at WHERE (time_stamp=#{fgaTimeStamp} AND location_id=#{forecastLocationId} AND weather_variable_id=#{forecastWeatherVariableId})"
      forecastFGAHash = SqlRunner.run(sql).first
      return forecastFGAHash
    end
    return nil
  end
end