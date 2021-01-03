sample = [1, 4, 5, 6, 7, 22, 45, 56, 23, 12, 99, 12, 32, 44, 123, 334]

test1 = sample.one? {|a| a == 6}

puts test1 # returns true

test2 = sample.one? {|a| a == 12334}

puts test2 # returns false

test3 = sample.combination(3).one? { |triplet| triplet.sum == 27 }

p test3 # returns true (22 + 4 + 1) = 27

test4 = sample.combination(3).none? { |triplet| triplet.sum == 3 }

p test4 # returns true no triplet sums to 3

test5 = sample.none?(Float)

p test5 # returns true no Floats in sample







