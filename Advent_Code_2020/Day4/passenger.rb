class Passenger

  attr_accessor :byr, :cid, :ecl, :eyr, :hcl, :hgt, :iyr, :pid

  def initialize(hsh)
    @byr = hsh["byr"].to_i
    @cid = hsh["cid"]
    @ecl = hsh["ecl"]
    @eyr = hsh["eyr"].to_i
    @hcl = hsh["hcl"]
    @hgt = hsh["hgt"]
    @iyr = hsh["iyr"].to_i
    @pid = hsh["pid"]

  end

  def valid?
    a = (1920..2002).include?(@byr)
    b = (2010..2020).include?(@iyr)
    c = (2020...2030).include?(@eyr)
    d = !(@hcl =~ /\#\h{6}$/).nil?
    e = %w[amb blu brn gry grn hzl oth].include?(@ecl)
    f = !(@pid =~ /^\d{9}$/).nil?
    /(\d+)(\w\w)/ =~ hgt
    one = Regexp.last_match(2)
    two = Regexp.last_match(1).to_i
    g = (150..193).include?(two) if one == 'cm'
    g =  (59..76).include?(two) if one == 'in'
    a && b && c && d && e && f && g
  end
end



h = { "byr" => "2029",
      "ecl" => "utc",
      "eyr" => "2033",
      "hcl" => "#efcc98",
      "hgt" => "189cm",
      "iyr" => "2023",
      "pid" => "173cm"}

h1 = { "byr" => "1952",
       "cid" => "249",
       "ecl" => "grn",
       "eyr" => "2026",
       "hcl" => "#866857",
       "hgt" => "190in",
       "iyr" => "2017",
       "pid" => "337605855"}


codes = File.readlines("input.txt", "\n\n").map { |s|
  s.rstrip.gsub("\n", " ").gsub(":", " ").split(" ").each_slice(2).sort.to_h
}

arr = codes.select { |x| (x.size == 8 or (x.size == 7 and x["cid"].nil?)) }

p arr.size

arr_obj = arr.select { |x| Passenger.new(x).valid? }

p arr_obj

p arr_obj.size





