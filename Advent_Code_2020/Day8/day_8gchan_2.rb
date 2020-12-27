require 'set'

ops =  File.readlines("input.txt").map(&:chomp)

def run(ops)  # this method returns nil if loop is present
  i = 0
  acc = 0
  executed = Set.new

  while i < ops.length
    return nil if executed.include?(i)
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
  acc
end

ops.length.times do |i|
  fixed_ops = ops.map(&:clone) # generates a frozen replica of ops

  instr = fixed_ops[i] # iterates on all the elements of ops

  if instr =~ /jmp/
    instr.gsub!("jmp", "nop")
  elsif instr =~ /nop/
    instr.gsub!("nop", "jmp")
  else
    next
  end

  acc = run(fixed_ops) # it will return nil if loop present

  if acc # if returns not nil we have found the error!
    puts acc
    puts instr
    puts i
    exit
  end

end


