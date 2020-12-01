require 'set'

def sum_pairs(ints, s)
  already_seen = Set.new
  ints.each do |int|
    return [s - int, int] if already_seen.include?(s - int)

    already_seen.add(int)
  end
  nil
end

def three_sum(elements, sum)
  elements.combination(3).detect do |a, b, c|
    (a + b + c) == sum
  end
end


arry = File.readlines('input.txt').map(&:to_i)

puts arry

cop = sum_pairs(arry, 2020)

p cop

prod = cop[0] * cop[1]

puts prod

triplet = three_sum(arry, 2020)

p triplet

prod = triplet[0] * triplet[1] * triplet[2]

p prod