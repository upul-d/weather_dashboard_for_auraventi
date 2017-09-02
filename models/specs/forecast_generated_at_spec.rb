require("minitest/autorun")
require("minitest/rg")
require_relative("../forecast_generated_at")

class ForecastGeneratedAtTest < Minitest::Test

  def setup
    test_forecast_generated_at = {"id" => 4, "time_stamp" => 1504382072, "location_id" => 1, "weather_variable_id" => 2}
    @forecast_generated_at = ForecastGeneratedAt.new(test_forecast_generated_at)
  end

  def test_forecast_generated_at_id
    assert_equal(4, @forecast_generated_at.id)
  end

end
