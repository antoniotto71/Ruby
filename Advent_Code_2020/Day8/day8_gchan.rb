require 'set'

ops =  File.readlines("input.txt").map(&:chomp)

p ops

p ops.length

i = 0
acc = 0
executed = Set.new

while true
  if executed.include?(i)
    puts acc
    puts i
    exit
  end

  executed.add(i)
  op, arg = ops[i].split
  arg = arg.to_i

  case op
  when "acc"
    acc += arg
  when "jmp"
    i += arg - 1
  end

  i += 1
end

