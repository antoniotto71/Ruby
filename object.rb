obj = Object.new 
puts obj.class

def obj.talk
  puts "I am an object"
  puts "(Do you object?)"
end

obj.talk

obj2 = Object.new
# obj2.talk

# puts obj.methods.sort

puts obj.object_id
obj2 = Object.new
puts obj2.object_id

puts obj.to_s
