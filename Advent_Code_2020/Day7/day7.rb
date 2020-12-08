class Edge
  attr_reader :outer, :inner, :count

  def initialize(outer, inner, count)
    @outer = outer
    @inner = inner
    @count = count
  end
end

class Bag
  attr_reader :color, :edges

  def initialize(color)
    @color = color
    @edges = []
  end

  def add_edge(edge)
    @edges << edge
  end

  def outers
    @edges.select { |edge| edge.inner == color }
  end


end



p lines_array.size

reg = /(\d).+(\d).+(\d).+(\d)/

lines_array = File.readlines("input7.txt").map(&:rstrip)

line = "plaid turquoise bags contain 3 clear teal bags, 2 dull tomato bags,
         5 dotted purple bags, 1 posh salmon bag."

