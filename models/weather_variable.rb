require_relative("../db/sql_runner")

class WeatherVariable

attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO weather_variables (name) VALUES ('#{@name}') RETURNING id"
    weather_variable = SqlRunner.run(sql).first
    @id = weather_variable["id"].to_i
  end

end