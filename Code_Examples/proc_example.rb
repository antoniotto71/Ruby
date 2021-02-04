def multiple_of(factor)
  Proc.new { |product| (product % factor).zero? }
end

n = 13

case n
when multiple_of(5)
  puts "#{n} is multiple of 5"
when multiple_of(3)
  puts "#{n} is multiple of 3"
when multiple_of(10)
  puts "#{n} is multiple of 10" # does not get executed
else
  puts "#{n} is not multiple of anything"
end

