data = File.readlines("input.txt", "\n").map.to_a

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

data3 = data.map {|x| x.gsub("x", "0").split(",").map(&:to_i)}

p data3

p data3[1]

data_second = data3[1].each_with_index.
  map { |x,y| [x,y] }.
  each.reject { |x, y| x == 0 }

p data_second

@target = data_second.map { |x,y| x-y }

@target[0] = 0

@divs = data_second.map {|x,y| x}

p @divs

p @target

@target2 = [0, 32, 804, 19, 15, 10, 393, 18, 2]

def find_result
  test2 = []
  counter = 0
  (1068781..1068782).each do |num|
    test = []
    @divs.each do |elem|
      test << num%elem
    end
    test2 << test
    counter += 1
  end
  return test2
end

def find_result2
  test2 = []
  counter = 0
  (1058443396696790..1058443396696792).each do |num|
    test = []
    @divs.each do |elem|
      test << num%elem
    end
    counter += 1
    break if test == @target2
  end
  counter
end

p find_result2