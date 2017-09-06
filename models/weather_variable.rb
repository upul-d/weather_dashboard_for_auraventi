require_relative("../db/sql_runner")

class WeatherVariable

attr_reader :id, :name

  def initialize(weather_variable_hash)
    @id = weather_variable_hash["id"].to_i if weather_variable_hash["id"]
    @name = weather_variable_hash["name"]
  end

  def save()
    sql = "SELECT id, name from weather_variables WHERE name='#{@name}'"
    existingWeatherVariableHash = SqlRunner.run(sql).first
    if(existingWeatherVariableHash == nil)
      sql = "INSERT INTO weather_variables (name) VALUES ('#{@name}') RETURNING id"
      weather_variable = SqlRunner.run(sql).first
      @id = weather_variable["id"].to_i
    else
      @id = existingWeatherVariableHash["id"].to_i
    end
  end

  def self.find(weatherVariableName)
    sql = "SELECT * from weather_variables WHERE name='#{weatherVariableName}'"
    weatherVariableHash = SqlRunner.run(sql).first
    return weatherVariableHash
  end
end