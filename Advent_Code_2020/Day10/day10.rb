arr = File.readlines("input.txt", "\n").map(&:chomp).map(&:to_i).sort

p arr

# diff_1 = arr.chunk_while {|i, j| i + 1 == j }

diff_3 = arr.each_with_object([]) {|i, j| j-i == 3}



p diff_3
