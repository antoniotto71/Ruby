require_relative './assembly/machine'
require_relative './assembly/instructions'
require_relative './assembly/instructions_parser'

raw_instructions = File.readlines("input.txt").map(&:chomp)


module HandheldHalting
  class << self
    def fix_program(instructions)
      instructions.each.with_index do |instruction, index|
        next unless instruction.swappable?

        instructions[index] = instruction.swap
        state = Assembly::Machine.execute(instructions)
        return state.accumulator unless state.loop_detected?

        instruction[index] = instruction
      end
      raise 'Expected to find at least one instruction combination without loop'
    end

    def accumulator_before_loop(instructions)
      Assembly::Machine.execute(instructions).accumulator
    end
  end
end

p raw_instructions

instructions = Assembly::Instructions::Parser.parse_instructions(raw_instructions)

p instructions

p HandheldHalting.accumulator_before_loop(instructions)

