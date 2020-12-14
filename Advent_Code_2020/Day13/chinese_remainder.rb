def extended_gcd(a,b)
  last_remainder, remainder = a.abs, b.abs
  x, last_x, y, last_y =  0, 1, 1, 0
  while remainder != 0
    last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
    x, last_x = last_x - quotient*x, x
    y, last_y = last_y - quotient*y, y
  end
  return last_remainder, last_x * (a < 0 ? -1 : 1)
end

extended_gcd(44, 11)

def invmod(e, et)
  g, x = extended_gcd(e, et)
  if g != 1
    raise "Multiplicative inverse modulo does not exist!"
  end
  x % et
end

def chinese_remainder(mods, remainders)
  max = mods.inject(:*) # product of all moduli
  series = remainders.zip(mods).map {|r,m| r * max * invmod(max/m, m) / m}
  series.inject(:+) % max
end

puts invmod(6, 5)

p chinese_remainder([19, 41, 823, 23, 17, 29, 443, 37, 13], [0, 32, 804, 19, 15, 10, 393, 18, 2])
