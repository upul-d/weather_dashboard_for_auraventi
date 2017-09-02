# require_relative("../db/sql_runner")

class Forecast

attr_reader :id, :FGA_id, :time_stamp, :time_GMT, :value

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @FGA_id = options["FGA_id"].to_i if options["FGA_id"]
    @time_stamp = options["time_stamp"].to_i if options["time_stamp"]
    @time_GMT = options["time_GMT"]
    @value = options["value"].to_i if options["value"]
  end

  def save()
    sql = "INSERT INTO forecasts (FGA_id, time_stamp, time_GMT, value) VALUES (#{@FGA_id}, #{@time_stamp}, #{@time_GMT}, #{@value}) RETURNING id"
    forecast = SqlRunner.run(sql).first
    @id = forecast["id"].to_i
  end

end