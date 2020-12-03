paths = File.readlines("input.txt").map(&:chomp)

def count_path(right, down, paths)
  paths_mod = paths.select.with_index { |_, index| (index % down).zero? }
  count = 0
  road = []
  paths_mod.each do |x|
    count = count % 30 - 1 if count > 30
    road << x[count]
    count += right
  end
  road.count('#')
end


c3 = count_path(3, 1, paths)
c1 = count_path(1, 1, paths)
c5 = count_path(5, 1, paths)
c7 = count_path(7, 1, paths)
c1_2 = count_path(1, 2, paths)

puts c3
puts c1
puts c5
puts c7
puts c1_2

puts(c3 * c1 * c5 * c7 * c1_2)



