$(function () {
  $.get("/assets", function(assets){
    var assetArray = [];
    var dateArray  = [];
    for (i = 0; i < assets.length; i++) {
      assetArray.push(assets[i].total);
      // dateArray.push(assets[i]._id.dayOfMonth);
    }

  $.get("/liabilities", function(liabilities){
    var liabilitiesArray = [];
    var monthArray   = [];
    for (i = 0; i < liabilities.length; i++) {
      liabilitiesArray.push(liabilities[i].total);
      // dateArray.push(liabilities[i]._id.dayOfMonth);
    }

    $.get("/networth-calc", function(networth){
      var networthArray = [];
      var monthArray   = [];
      for (i = 0; i < networth.length; i++) {
        networthArray.push(networth[i].total);
        // dateArray.push(networth[i]._id.dayOfMonth);
      }

    $('#net-worth-chart').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: 'Net Worth'
        },
        // xAxis: {
        //   // name: 'Date',
        //   // categories: dateArray
        // },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Assets',
            data: assetArray
        }, {
            name: 'Liabilities',
            data: liabilitiesArray
        }, {
            name: 'Net Worth',
            data: networthArray
        }]
    });
  });
  });
  });
});
