### Data ###
data = [4,8,15,16,23,42]

x = d3.scale.linear()
  .domain([0, d3.max data])
  .range([0, 420])

y = d3.scale.ordinal()
  .domain(data)
  .rangeBands([0, 120])

chart = d3.select('body').append('svg')
    .attr('class', 'chart')
    .attr('width', 440)
    .attr('height', 140)
    .attr('transform', 'scale(2)')
  .append('g')
    .attr('transform', 'translate(10,15)')
  
chart.selectAll('line')
    .data(x.ticks(10))
  .enter().append('line')
    .attr('x1', x)
    .attr('x2', x)
    .attr('y1', 0)
    .attr('y2', 120)
    .attr('stroke', '#ccc')

chart.selectAll('.rule')
    .data(x.ticks(10))
  .enter().append('text')
    .attr('class', 'rule')
    .attr('x', x)
    .attr('y', 0)
    .attr('dy', -3)
    .attr('text-anchor', 'middle')
    .text(String)

chart.selectAll('rect')
    .data(data)
  .enter().append('rect')
    .attr('y', y)
    .attr('width', x)
    .attr('height', y.rangeBand())

chart.selectAll('.bar')
    .data(data)
  .enter().append('text')
    .attr('class', 'bar')
    .attr('x', x)
    .attr('y', (d) -> y(d) + y.rangeBand() / 2)
    .attr('dx', -3)
    .attr('dy', '.35em')
    .attr('text-anchor', 'end')
    .attr('fill', 'white')
    .text(String)

chart.append('line')
  .attr('y1', 0)
  .attr('y2', 120)
  .style('stroke', '#000')


