data = File.readlines("input.txt", "\n").map(&:chop).to_a

data2 = data.map {|x| x.gsub(",x", "").split(",").map(&:to_i)}

p data2

p data2[0]

p data2[1]

def transform(arr)
  minutes = arr[1].map { |x| x - arr[0][0]%x}
  reshash = Hash[arr[1].zip(minutes)]
  minhash = reshash.select {|i, j| j == reshash.values.min}
  prod = minhash.map { |a, b| a*b  }
  return prod[0]
end

p transform(data2)