
passports = File.readlines("input.txt", "\n\n").map {
  |str| str.gsub(":", " ").split(/\s/).each_slice(2).sort.to_h
}

valid = passports.select { |x| (x.size == 8 or (x.size == 7 and x["cid"].nil?)) }

p valid

p valid.size


