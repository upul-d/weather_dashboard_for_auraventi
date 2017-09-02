DROP TABLE forecasts;
DROP TABLE forecasts_generated_at;
DROP TABLE weather_variables;
DROP TABLE locations;

CREATE TABLE locations (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE weather_variables (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE forecasts_generated_at; (
  id SERIAL8 PRIMARY KEY,
  -- timestamp data type??,
  location_id INT8 REFERENCES locations(id),
  weather_variable_id INT8 REFERENCES weather_variables(id)
);

CREATE TABLE forecasts; (
  id SERIAL8 PRIMARY KEY,
  FGA_id REFERENCES forecasts_generated_at(id),
  -- timestamp data type?,
  -- timeGMT data type?,
  value INT8
);