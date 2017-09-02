DROP TABLE IF EXISTS forecasts;
DROP TABLE IF EXISTS forecasts_generated_at;
DROP TABLE IF EXISTS weather_variables;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE weather_variables (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE forecasts_generated_at (
  id SERIAL8 PRIMARY KEY,
  time_stamp bigint,
  location_id INT8 REFERENCES locations(id),
  weather_variable_id INT8 REFERENCES weather_variables(id)
);

CREATE TABLE forecasts (
  id SERIAL8 PRIMARY KEY,
  FGA_id INT8 REFERENCES forecasts_generated_at(id),
  time_stamp bigint,
  time_GMT VARCHAR(255),
  value INT8
);