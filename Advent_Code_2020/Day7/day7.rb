class RelationDescription
  attr_reader :info

  def initialize(str)
    @info = parse_description(str)
  end

  private

  def parse_description(str)
    caps = str.match(/^(?<outer>[\w\s]+) bags contain (?<inner>.*)/).named_captures
    outer = caps['outer']
    inner = caps['inner']

    inners = parse_inner(inner)

    inners.compact.map do |color, count|
      { outer: outer, inner: color, count: count}
    end
  end

  def parse_inner(str)
    return [] if (str == 'no other bags.')
    str.scan(/(\d+) ([a-z\s]+) bags?/m).each_with_object({}) do |(count, color), hsh|
      hsh[color] = count.to_i
    end
  end
end



class Graph
  def self.build(input)
    new.tap do |graph|
      input.split("\n").each do |rule|
        RelationDescription.new(rule).edges.each do |edge|
          graph.add_edge(edge[:outer], edge[:inner], edge[:count])
        end
      end
    end
  end
  def initialize
    @graph = {}
  end

  def add_edge(outer, inner, count)
    outer_bag = @graph[outer] ||= Bag.new(outer)
    inner_bag = @graph[inner] ||= Bag.new(inner)

    edge = Edge.new(outer, inner, count)
    outer_bag.add_edge(edge)
    inner_bag.add_edge(edge)
  end

  def all_outers(color)
    bag = @graph[color]
    return [] if bag.outers.empty?

    outer_names = bag.outers.map(&:outer)
    outer_names = outer_names + outer_names.flat_map { |n| all_outers(n)}
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


