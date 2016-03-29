$(document).ready(function(){
  $('.sliding-panel-button,.sliding-panel-fade-screen,.sliding-panel-close').on('click touchstart',function (e) {
    $('.sliding-panel-content,.sliding-panel-fade-screen').toggleClass('is-visible');
    e.preventDefault();
  });
});

$(function () {
  $.get("/data", function(data){
    var assetArray       = [];
    var liabilitiesArray = [];
    var networthArray    = [];
    var dateArray        = [];
    for (i = 0; i < data.length; i++) {
      assetArray.push(data[i].assets);
      liabilitiesArray.push(data[i].liabilities);
      networthArray.push(data[i].networth);
      dateArray.push(moment(data[i].created_at.format("MM-DD-YYYY")));
    }

    $('#net-worth-chart').highcharts({
        chart: {
            backgroundColor: {
              linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
              stops: [
                 [0, '#2a2a2b'],
                 [1, '#3e3e40']
              ]
            },
          type: 'area'
        },
        title: {
            text: 'Net Worth',
            style: {
             color: '#E0E0E3',
             textTransform: 'uppercase',
             fontSize: '20px'
          }
        },
        xAxis: {
          name: 'Date',
          categories: dateArray,
          labels: {
            style: {
            color: '#E0E0E3'
            }
          },
        },
        yAxis: {
           gridLineColor: '#707073',
           labels: {
              style: {
                 color: '#E0E0E3'
              }
           },
         },
       legend: {
          itemStyle: {
             color: '#E0E0E3'
          },
          itemHoverStyle: {
             color: '#FFF'
          },
          itemHiddenStyle: {
             color: '#606063'
          }
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Assets',
            data: assetArray,
            color: '#2BA84A'
        }, {
            name: 'Liabilities',
            data: liabilitiesArray,
            color: '#D90429'
        }, {
            name: 'Net Worth',
            data: networthArray,
            color: '#C0C0C0'
        }]
    });
  });
});
