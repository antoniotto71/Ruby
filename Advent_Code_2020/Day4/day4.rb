codes = File.readlines("input.txt", "\n\n").map { |s| s.rstrip.gsub("\n", " ") }


# codes2 = codes.map { |s| s.gsub(" ", ", ").gsub(":", ": ") }

str1 = "hcl:5307c9 ecl:#cc4aff pid:#d80d30 hgt:72cm byr:2025 eyr:2039 iyr:2025"

def valid?(str)
  if str.count(":") == 8
    true
  else
    if str.count(":") == 7 && (str.include?("hcl:") && str.include?("ecl:") && str.include?("pid:") &&
      str.include?("hgt:") && str.include?("byr:") && str.include?("eyr:") && str.include?("iyr:"))
      true
    else
      false
    end
  end
end

response = codes.map { |x| valid?(x) }

answer = response.count(true)

p answer

