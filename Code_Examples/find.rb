sample = [1, 4, 5, 6, 7, 22, 45, 56, 23, 12, 99, 12, 32, 44, 123, 334]

test1 = sample.find {|x| x<=12 && x >= 1}

p test1 # returns 1 as the first occurrence of block requirements

test2 = sample.find {|x| x%2 ==0 }

p test2 # returns 4 as the first even number





