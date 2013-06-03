define ["d3"], (d3) ->
  update = (data) ->

    # DATA JOIN
    # Join new data with old elements, if any.
    text = svg.selectAll("text").data(data, (d) ->
      d
    )

    # UPDATE
    # Update old elements as needed.
    text.attr("class", "update").transition().duration(750).attr "x", (d, i) ->
      i * 32

    # ENTER
    # Create new elements as needed.
    text.enter().append("text").attr("class", "enter").attr("dy", ".35em").attr("y", -60).attr("x", (d, i) ->
      i * 32
    ).style("fill-opacity", 1e-6).text((d) ->
      d
    ).transition().duration(750).attr("y", 0).style "fill-opacity", 1

    # EXIT
    # Remove old elements as needed.
    text.exit().attr("class", "exit").transition().duration(750).attr("y", 60).style("fill-opacity", 1e-6).remove()

  # The initial display.

  # Grab a random sample of letters from the alphabet, in alphabetical order.

  # Shuffles the input array.
  shuffle = (array) ->
    m = array.length
    t = undefined
    i = undefined
    while m 
      i = Math.floor(Math.random() * m--)
      t = array[m]
      array[m] = array[i]
      array[i] = t
    array
  alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
  width = 824
  height = 500
  svg = d3.select(".container").append("svg").attr("width", width).attr("height", height).append("g").attr("transform", "translate(32," + (height / 2) + ")")
  update alphabet
  setInterval (->
    update shuffle(alphabet).slice(0, Math.floor(Math.random() * 26)).sort()
  ), 1500




