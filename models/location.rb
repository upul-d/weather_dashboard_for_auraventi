require_relative("../db/sql_runner")

class Location

attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO locations (name) VALUES ('#{@name}') RETURNING id"
    location = SqlRunner.run(sql).first
    @id = location["id"].to_i
  end

end