require_relative("../db/sql_runner")

class Location

attr_reader :id, :name

  def initialize(location_hash)
    @id = location_hash["id"].to_i if location_hash["id"]
    @name = location_hash["name"]
  end

  def save()
    sql = "SELECT id, name from locations WHERE name='#{@name}'"
    existingLocationHash = SqlRunner.run(sql).first
    if(existingLocationHash == nil)
      sql = "INSERT INTO locations (name) VALUES ('#{@name}') RETURNING id"
      location_hash = SqlRunner.run(sql).first
      @id = location_hash["id"].to_i
    else
      @id = existingLocationHash["id"].to_i
    end
  end
end