# require_relative("../db/sql_runner")

class ForecastGeneratedAt

attr_reader :id, :time_stamp, :location_id, :weather_variable_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @time_stamp = options["time_stamp"].to_i if options["time_stamp"]
    @location_id = options["location_id"].to_i if options["location_id"]
    @weather_variable_id = options["weather_variable_id"].to_i if options["weather_variable_id"]
  end

end