var Highcharts = require('highcharts');

class Chart {
  constructor(container, data) {
    this.container = container
    this.data = data
    this.render()
}

getXValues(dataInJSON){
    var xValues = [];
    for(var i = 0; i < dataInJSON.length; i++) {
        var obj = dataInJSON[i];
        xValues.push(obj.time_gmt);
    }
    return xValues;
}

getYValues(dataInJSON){
    var yValues = [];
    for(var i = 0; i < dataInJSON.length; i++) {
        var obj = dataInJSON[i];
        yValues.push(parseFloat(obj.value));
    }
    return yValues;
}

render() {
    var dataInJSON = JSON.parse(this.data);
    var xValues = this.getXValues(dataInJSON);
    var yValues = this.getYValues(dataInJSON);
    Highcharts.chart(this.container, {
        chart: {
            type: 'area'
        },
        title: {
            text: 'Findhorn Temperature'
        },
        xAxis: {
          title: {
              text: 'Time'
          },
          allowDecimals: false,
          labels: {
            formatter: function () {
                    return this.value;
                }
            }
        },
        yAxis: {
            title: {
                text: 'Temperature (Fahrenheit)'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            pointFormat: '{point.y}'
        },
        plotOptions: {
            area: {
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        xAxis: {
            categories: xValues
        },
        series: [{
            showInLegend: false,
            data: yValues
        }]
    });   
}
}

module.exports = Chart