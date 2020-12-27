data = "19,20,14,0,9,1"
input = data.split(",").map(&:to_i)
p input

def solution(arr, turn)
  target = turn - 2
  (arr.size - 1).upto(target).each do |number|
    int = arr[0, number]
    if arr[0,number -1].include?(arr[number])
      int = arr[0, number].rindex(arr[number])
      arr << (number - int)
    else
      arr << 0
    end
  end
  return arr
end

puts solution(input, 2020)