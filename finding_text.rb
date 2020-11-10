# frozen_string_literal: true

puts 'Please enter some information'

user_input = gets.chomp

user_input_index = user_input.index('name')

if user_input_index # se e' nil e' falso
  if user_input_index.zero?
    puts 'Found at the beginning'
  else
    puts 'Found somewhere else'
  end
else
  puts 'No name in the input'
end

p user_input_index
