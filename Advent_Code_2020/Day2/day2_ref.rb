arr = File.readlines('input.txt').map(&:chomp)


def decode(key)
  /(\d+)-(\d+)\s(\w):\s(.+)/ =~ key
  inf = Regexp.last_match(1).to_i
  sup = Regexp.last_match(2).to_i
  letter = Regexp.last_match(3)
  password = Regexp.last_match(4)
  digit = password.count letter
  (digit >= inf) && (digit <= sup)
end

str2 = arr.map { |x| decode(x) }

s = decode(strr)

p str2




