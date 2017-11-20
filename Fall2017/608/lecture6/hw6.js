d3.csv("marketcap1.csv", function(err, rows){

  function unpack(rows, key) {
  return rows.map(function(row) { return row[key]; });
}


var trace1 = {
  type: "scatter",
  mode: "lines",
  name: 'AAPL',
  x: unpack(rows, 'Date'),
  y: unpack(rows, 'AAPL'),
  line: {color: '#17BECF'}
}

var trace2 = {
  type: "scatter",
  mode: "lines",
  name: 'S&P500',
  x: unpack(rows, 'Date'),
  y: unpack(rows, 'SPY'),
  line: {color: '#7F7F7F'}
}

var data = [trace1,trace2];

var layout = {
  title: 'Basic Time Series',
};

Plotly.newPlot('myDiv', data, layout);
})