obj = Object.new
puts obj.class

def obj.talk
  puts 'I am an object'
  puts '(Do you object?)'
end

obj.talk

obj2 = Object.new

# obj2.talk

# puts obj.methods.sort

puts "L'object id di obj è #{obj.object_id}"

puts "L'object id di obj2 è #{obj2.object_id}"

puts obj.to_s

puts obj2.to_s

def obj.c2f(c)
  c * 9.0 / 5 + 32
end

puts obj.c2f(37.5)

def la_rana_dettagli(*det)
  det.each { |dettagli| puts "La rana è #{dettagli}" }
end

la_rana_dettagli('verde', 'piccola', 'simpatica', 'saltellante')