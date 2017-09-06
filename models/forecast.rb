require_relative("../db/sql_runner")
require 'json'

class Forecast

  attr_reader :id, :FGA_id, :time_stamp, :time_GMT, :value

  def initialize(forecast_hash)
    @id = forecast_hash["id"].to_i if forecast_hash["id"]
    @FGA_id = forecast_hash["FGA_id"].to_i if forecast_hash["FGA_id"]
    @time_stamp = forecast_hash["time_stamp"].to_i if forecast_hash["time_stamp"]
    @time_GMT = forecast_hash["time_GMT"]
    @value = forecast_hash["value"]
  end

  def save()
    sql = "SELECT id, FGA_id, time_stamp, time_GMT, value from forecasts WHERE (FGA_id=#{@FGA_id} AND time_stamp=#{@time_stamp} AND time_GMT='#{@time_GMT}' AND value=#{@value})"
    existingForecastHash = SqlRunner.run(sql).first
    if(existingForecastHash == nil)
      sql = "INSERT INTO forecasts (FGA_id, time_stamp, time_GMT, value) VALUES (#{@FGA_id}, #{@time_stamp}, '#{@time_GMT}', #{@value}) RETURNING id"
      forecast = SqlRunner.run(sql).first
      @id = forecast["id"].to_i
    else
      @id = existingForecastHash["id"].to_i
    end
  end

  def self.find(forecastGeneratedAtId)
    sql = "SELECT * FROM forecasts WHERE FGA_id=#{forecastGeneratedAtId}"
    forecasts = SqlRunner.run(sql)

    if(forecasts != nil)
      jsonString = ""
      forecasts.each { |forecast| 
        if(jsonString != "")
          jsonString = jsonString + "," + forecast.to_json
        else
          jsonString = forecast.to_json
        end
      }
      jsonString = "[" + jsonString + "]"
      return jsonString
    end

    return nil
  end
end