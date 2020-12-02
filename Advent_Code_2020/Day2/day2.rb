require 'debase'

array = File.readlines('input.txt')

str = array.map { |x| x.strip.split(':') }

def decode(key, password)
  nums = key.scan(/\d+/)
  letter = key.scan(/[a-z]/).to_s
  inf = nums[0].to_i
  sup = nums[1].to_i
  digit = password.count letter
  (digit >= inf) && (digit <= sup)
end

def decode2(key, password)
  nums = key.scan(/\d+/)
  letter = key.scan(/[a-z]/)[0]
  first = nums[0].to_i
  second = nums[1].to_i
  m = password[first] == letter
  n = password[second] == letter
  m ^ n
end

#str2 = str.map { |x, y| decode(x, y) }

str3 = str.map { |x, y| decode2(x, y) }


p decode2("1-3 a", "abcde")

#p str2.count(true)

p str3.count(true)

