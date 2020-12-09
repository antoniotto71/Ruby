class RelationDescription  # classe che descrive il parser
  attr_reader :info # unico attributo che fornirà l' informazione richiesta dalla singola linea di testo

  def initialize(str)
    @info = parse_description(str) # nel corso dell' inizializzazione si assegna all' attributo info il risultato del metodo
  end

  private

  def parse_description(str) # metodo che opera sulla singola linea
    caps = str.match(/^(?<outer>[\w\s]+) bags contain (?<inner>.*)/).named_captures # estrae il colore della borsa esterna e il resto della linea sulle borse interne
    outer = caps['outer'] # cattura la prima regex sulla borsa esterna
    inner = caps['inner'] # cattura la seconda regex sulle borse interne in toto

    inners = parse_inner(inner)  # la seconda cattura viene processata come stringa e inviata al metodo come hash

    inners.compact.map do |color, count| # si eliminano i nil e si crea l' hash finale che ha per ogni colore esterno quelli interni e il conto
      { outer: outer, inner: color, count: count }
    end
  end

  def parse_inner(str)
    return [] if str == 'no other bags.'

    str.scan(/(\d+) ([a-z\s]+) bags?/m).each_with_object({}) do |(count, color), hsh|  # i due risultati vengono usati per creare un hash con colore  => e conto => per ogni colore interno
      hsh[color] = count.to_i
    end
  end
end

class BagGraph
  def self.build(rel_descriptions)  # rel_description è un array di array di hash
    new.tap do |bag_graph|
      rel_descriptions.each do |desc|
        rel = RelationDescription.new(desc)
        rel.info.each do |relation|
          bag_graph.add_relationship(relation[:outer], relation[:inner], relation[:count])
        end
      end
    end
  end

  def initialize
    @nodes = {}
  end

  def add_relationship(outer, inner, count)
    outer_color = @nodes[outer] ||= Color.new(outer)
    inner_color = @nodes[inner] ||= Color.new(inner)

    rel = Relationship.new(outer, inner, count)

    outer_color.add_relationship(rel)
    inner_color.add_relationship(rel)
  end

  def all_parents(color)
    color = @nodes[color]
    return [] if color.parents.empty?

    color.parents + color.parents.flat_map { |n| all_parents(n) }
  end

  def count_children(color)
    color = @nodes[color]
    return 1 if color.children.empty?

    1 + color.children.sum {|child| child.count * count_children(child.inner)}
  end

end

class Relationship
  attr_reader :outer, :inner, :count

  def initialize(outer, inner, count)
    @outer = outer
    @inner = inner
    @count = count
  end
end

class Color
  attr_reader :name

  def initialize(name)
    @name = name
    @relationships = []
  end

  def add_relationship(rel)
    @relationships << rel
  end

  def parents
    @relationships.select { |rel| rel.inner == name }.map(&:outer)
  end

  def children
    @relationships.select { |rel| rel.outer == name }
  end
end
