require("minitest/autorun")
require("minitest/rg")
require_relative("../forecast")

class ForecastTest < Minitest::Test

  def setup
    test_forecast = {"id" => 2, "FGA_id" => 4, "time_stamp" => 1504382072, "time_GMT" => "9:00 PM 9/2/17", "value" => 77}
    @forecast = Forecast.new(test_forecast)
  end

  def test_forecast_id
    assert_equal(2, @forecast.id)
  end

  def test_forecast_FGA_id
    assert_equal(4, @forecast.FGA_id)
  end

  def test_forecast_time_stamp
    assert_equal(1504382072, @forecast.time_stamp)
  end

end