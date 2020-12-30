
data = "19,20,14,0,9,1"
input = data.split(",").map(&:to_i)

p input

def find_result(input, target)
  hashtable = Hash.new(0)
  start_arr = input[0..-2]
  last = input.last
  start_arr.each do |item|
    hashtable[item] = start_arr.index(item) + 1
  end
  ((input.size + 1)..target).each do |turn|
    if hashtable.has_key?(last)
      following = turn - 1 - hashtable[last]
    else following = 0
    end
    hashtable[last] = turn - 1
    last = following
  end
  last
end


p find_result(input, 30000000)