arr = File.readlines("input.txt", "\n").map(&:chomp).map(&:to_i).sort

p arr

arr2 = [0, *arr, arr.max + 3 ]

p arr2

arr3 = arr2.each_cons(2).map { |x, y| y - x  }

result = arr3.count(1) * arr3.count(3)

p result

