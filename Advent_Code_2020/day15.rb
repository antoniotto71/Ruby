data = "0,3,6"
input = data.split(",").map(&:to_i)
p input

def solution(arr, target)
  (arr.size - 1).upto(target).each do |number|
    if arr[0,number -1].include?(arr[number])
      int = arr[0, number -1].rindex(arr[number])
      arr << (number - int)
    else
      arr << 0
    end
  end
  return arr
end

puts solution(input, 9)