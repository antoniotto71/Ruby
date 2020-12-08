class RuleParser
  attr_reader :edges

  def initialize(rule)
    @edges = parse_rule(rule)
  end

  private

  def parse_rule(rule)
    caps = rule.match(/^(?<outer>[\w\s]+) bags contain (?<inner>.*)/).named_captures
    outer = caps['outer']
    inner = caps['inner']

    parse_inner(inner).map do |edge|
      edge.merge(outer: outer)
    end
  end

  def parse_inner(inner)

    return [] if inner = 'no other bags'
    inner.scan(/(\d+) [\w\s]+ bags?/)


  end





end



class Graph
  def initialize(input)
    @input = input
    @graph = {}
  end

  def add_edge(outer, inner, count)
    outer_bag = @graph[outer] ||= Bag.new(outer)
    inner_bag = @graph[inner] ||= Bag.new(inner)

    edge = Edge.new(outer, inner, count)
    outer_bag.add_edge(edge)
    inner_bag.add_edge(edge)
  end

end


class Edge
  attr_reader :outer, :inner, :count

  def initialize(outer, inner, count)
    @outer = outer
    @inner = inner
    @count = count
  end
end

class Bag
  attr_reader :color

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

  def inner
    @edges.select { |edge| edge.outer == color }
  end


end



p lines_array.size

reg = /(\d).+(\d).+(\d).+(\d)/

lines_array = File.readlines("input7.txt").map(&:rstrip)

line = "plaid turquoise bags contain 3 clear teal bags, 2 dull tomato bags,
         5 dotted purple bags, 1 posh salmon bag."

