arr = File.readlines("input.txt", "\n").map(&:chomp).map(&:to_i)

arr = arr << 0
arr = arr << arr.max + 3

arr.sort!

arr2 = "10 5 1 11 7 6 4".split.map(&:to_i).sort

p arr2
p arr

count_1 = 0
count_3 = 0

i = 0
while i< arr.size - 1
  if arr[i+1] - arr[i] == 3
    count_3 += 1
  elsif
  arr[i+1] - arr[i] == 1
    count_1 += 1
  end
  i += 1
end

p count_1
p count_3
puts count_1 * count_3