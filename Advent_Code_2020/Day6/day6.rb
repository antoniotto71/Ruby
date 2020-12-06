require 'set'

sum = (File.readlines("input.txt", "\n\n").map { |s| s.rstrip.gsub("\n", "").chars.to_a.uniq.size }).inject(0, :+)

# p sum

# --------- with sets -----------

arr = File.readlines("input.txt", "\n\n").map { |s| s.rstrip.gsub("\n", "").chars.to_a }


set = arr.map(&:to_set)

# p set

counts = set.map(&:size)

# p counts

total_counts = counts.inject(0, :+)

# p total_counts

sum3 = File.readlines("input.txt", "\n\n").map { |s| s.rstrip.gsub("\n", "").chars.to_a }.map(&:to_set).map(&:size).inject(0, :+)


# --------- second -----------
arr_of_strings = File.readlines("input.txt", "\n\n").map { |s| s.rstrip.split("\n") } # array delle stringhe di ogni gruppo

def convert(y)
  y.chars.to_a.to_set
end

p arr_of_strings

pp = arr_of_strings.map { |x| x.map { |y| convert(y) } }

p pp

p pp.size

res = pp.map { |x| x.inject(("a".."z").to_set) { |a, b| a & b } }

qq = res.map(&:size)

p qq

pq = qq.inject(0, :+)

p pq


sum2 = ((File.readlines("input.txt", "\n\n").map { |s| s.rstrip.split("\n") }.map {
  |x| x.map { |y| convert(y) } }).map { |x| x.inject(("a".."z").to_set) { |a, b| a & b } }).map(&:size).inject(0, :+)

p sum3
p sum2