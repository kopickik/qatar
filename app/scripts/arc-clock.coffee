# Arc Tween clock
define ["d3"], (d3) ->
  arcTween = (b) ->
    i = d3.interpolate(
      value: b.previous
    , b)
    (t) ->
      arc i(t)
  w = 960
  h = 500
  x = d3.scale.ordinal().domain(d3.range(3)).rangePoints([0, w], 2)
  fields = [
    name: "hours"
    value: 0
    size: 24
  ,
    name: "minutes"
    value: 0
    size: 60
  ,
    name: "seconds"
    value: 0
    size: 60
  ]
  arc = d3.svg.arc().innerRadius(100).outerRadius(140).startAngle(0).endAngle((d) ->
    (d.value / d.size) * 2 * Math.PI
  )
  svg = d3.select("#arcClock").append("svg:svg").attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate(0," + (h / 2) + ")")
  setInterval (->
    now = new Date()
    fields[0].previous = fields[0].value
    fields[0].value = now.getHours()
    fields[1].previous = fields[1].value
    fields[1].value = now.getMinutes()
    fields[2].previous = fields[2].value
    fields[2].value = now.getSeconds()
    path = svg.selectAll("path").data(fields.filter((d) ->
      d.value
    ), (d) ->
      d.name
    )
    path.enter().append("svg:path").attr("transform", (d, i) ->
      "translate(" + x(i) + ",0)"
    ).transition().ease("elastic").duration(750).attrTween "d", arcTween
    path.transition().ease("elastic").duration(750).attrTween "d", arcTween
    path.exit().transition().ease("bounce").duration(750).attrTween("d", arcTween).remove()
  ), 1000
