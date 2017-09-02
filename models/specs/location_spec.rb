require("minitest/autorun")
require("minitest/rg")
require_relative("../location")

class LocationTest < Minitest::Test

  def setup
    test_location = {"id" => 8, "name" => "Edinburgh"}
    @location = Location.new(test_location)
  end

  def test_location_name
    assert_equal("Edinburgh", @location.name)
  end

  def test_location_id
    assert_equal(8, @location.id)
  end

end
