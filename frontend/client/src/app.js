const UI = require('./views/ui.js')

window.onload = function(){
  makeRequest('http://localhost:4567/forecast/findhorn/temperature')
  // makeRequest('http://localhost:4567/forecast/findhorn/cloudcover')
  // makeRequest('http://localhost:4567/forecast/findhorn/humidity')
  // makeRequest('http://localhost:4567/forecast/findhorn/windspeed')
  // makeRequest('http://localhost:4567/forecast/findhorn/precipIntensity')
  // makeRequest('http://localhost:4567/forecast/findhorn/precipProbability')
}

var makeRequest = function(url) {
  var request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if(request.readyState==4) {
      if(request.status==200) {
        drawChart(request.responseText);
      };
    };
  };
  request.open('GET', url);
  request.send();
};

var drawChart = function(responseText){
  const div = document.getElementById('app')
  new UI(div, responseText)
};
