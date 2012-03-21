w = 840 # width
h = 240 # height
p = 20  # chart padding - could be decimal to represent %
s = 1   # space b/w bars
data = [4,8,15,16,23,42]

x = d3.scale.linear()
  .domain([0, d3.max data])
  .range([0, w-p]) # could use percentage for padding

y = d3.scale.linear()
  .domain([0, data.length])
  .range([0, h-p]) # could use percentage for padding

bh = -> # bar height
  (h-p) / data.length - s

chart = d3.select('#chart').append('svg')
    .attr('class', 'chart')
    .attr('width', w)
    .attr('height', h)
  .append('g')
    .attr('transform', 'translate(10,15)')
  
# vertical markers
chart.selectAll('line')
    .data(x.ticks 10)
  .enter().append('line')
    .attr('x1', x)
    .attr('x2', x)
    .attr('y1', 0)
    .attr('y2', h-p)
    .attr('stroke', '#ccc')

# horizontal bars
chart.selectAll('rect')
    .data(data)
  .enter().append('rect')
    .attr('y', (d,i) -> y i)
    .attr('width', x)
    .attr('height', bh)

# values in bars
chart.selectAll('.bar')
    .data(data)
  .enter().append('text')
    .attr('class', 'bar')
    .attr('x', x)
    .attr('y', (d,i) -> (y i) + bh() / 2)
    .attr('dx', bh() / -2)
    .attr('dy', bh() / 4)
    .attr('text-anchor', 'end')
    .attr('font-size', bh() / 1.4)
    .attr('fill', 'white')
    .text(String)

# marker values
chart.selectAll('.rule')
    .data(x.ticks 10)
  .enter().append('text')
    .attr('class', 'rule')
    .attr('x', x)
    .attr('y', 0)
    .attr('dy', -3)
    .attr('text-anchor', 'middle')
    .text(String)

# solid left bar for zero
chart.append('line')
  .attr('y1', 0)
  .attr('y2', h-p)
  .style('stroke', '#000')


