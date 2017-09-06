const UI = require('./views/ui.js')
const Request = require('./models/request.js')

window.onload = function(){
  const request = new Request()
  request.get('http://localhost:4567/forecast/findhorn/cloudcover')
  request.get('http://localhost:4567/forecast/findhorn/humidity') 
  request.get('http://localhost:4567/forecast/findhorn/windspeed') 
  request.get('http://localhost:4567/forecast/findhorn/temperature') 
  request.get('http://localhost:4567/forecast/findhorn/precipintensity') 
  request.get('http://localhost:4567/forecast/findhorn/precipprobability')  
  const div = document.getElementById('app')
  new UI(div)
}


