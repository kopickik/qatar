// D3 examples
define(['d3'], function(d3) {
  'use strict';
  var size = {width: 500, height: 250},
  svg = d3.select('#circle-area svg'),
  projection = d3.geo.albersUsa().translate([size.width/2, size.height/2]).scale([400]),
  path = d3.geo.path().projection(projection);

  d3.json("scripts/usstates.json", function(states) {
    var s = svg.selectAll("path")
    .data(states.features);
    s.enter().append("path");
    s.exit().remove();

    s.attr("d", path).attr('fill', 'steelblue');
  });

});