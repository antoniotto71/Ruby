class File
  def self.readlines_mod(path)
    File.open(path).each_line.map(&:chop)
  end
end

class AdapterArray
  def self.from_file(file_path)
    adapters = File.readlines_mod(file_path).map(&:to_i)
    new(adapters)
  end

  attr_reader :adapters

  def initialize(adapters)
    @adapters = [0, *adapters, adapters.max + 3]
  end

  def multiply_differences
    differences = adapters.sort.each_cons(2).map {|a, b| b-a}
    differences.count(1) * differences.count(3)
  end

  def count_combinations(target = adapters.max, current = 0, memo = {})
    return memo[current] if memo.include?(current)
    return 1 if current == target
    return 0 unless adapters.include?(current)

    memo[current] = (1..3)
      .each
      .map { |inc| count_combinations(target, current + inc, memo) }
      .sum
  end
end

arr = AdapterArray.from_file("input2.txt")

p arr

puts arr.multiply_differences

puts arr.count_combinations