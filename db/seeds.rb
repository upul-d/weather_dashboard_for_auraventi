require_relative("../models/location")

location1 = Location.new({
  "name" => "Findhorn"
  })

location2 = Location.new({
  "name" => "Edinburgh"
  })

location1.save()
location2.save()