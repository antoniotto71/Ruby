
file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

passes = input.split("\n\n")

expect = %w(byr iyr eyr hgt hcl ecl pid)

# Count all the passes that satisfy this condition: the elements of the array
# expect are passed to the block to see if in all cases it returns true.
# The second block checks if an element of pass matches all the elements of expected
# ("field") in the specific pattern eg "byr: one_or_more_no_space_character_s" and all others.

puts passes.count {|pass|
  expect.all? { |field| pass.match?(/#{field}:\S+/) }

}


pass = "byr:1920 eyr:2023 cid:146 pid:890112986 hgt:171cm hcl:#b6652a iyr:2017 ecl:hzl"

fields = Hash[
  pass.split(/\s/).map { |field| field.split(":")}
]

p fields