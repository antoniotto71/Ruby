require_relative './day7'
require 'rspec'

RSpec.describe BagGraph do
  let(:setup) do
    <<~LINES
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    LINES
  end

  it 'it builds graph and can count parents' do
    bag_graph = BagGraph.build(setup.split("\n"))
    rents = bag_graph.all_parents('shiny gold').uniq
    expect(rents.count).to eq(4)
  end

end


