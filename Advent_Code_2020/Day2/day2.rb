
array = File.readlines('input.txt')

str = array.map { |x| x.strip.split(':') }

str2 = str.map { |x, y| x + y }

p str
p str2

def decode(key)
  nums = key.scan(/(\d+)/)
  letter = key.scan(/[a-z]/)
  nums + letter
end


p decode("1-3 c")

