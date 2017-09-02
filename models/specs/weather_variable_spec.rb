require("minitest/autorun")
require("minitest/rg")
require_relative("../weather_variable")

class WeatherVariableTest < Minitest::Test

  def setup
    test_weather_variable = {"id" => 6, "name" => "humidity"}
    @weather_variable = WeatherVariable.new(test_weather_variable)
  end

  def test_location_name
    assert_equal("humidity", @weather_variable.name)
  end

  def test_location_id
    assert_equal(6, @weather_variable.id)
  end

end
