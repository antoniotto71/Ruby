
codes = File.readlines("input.txt", "\n\n").map { |s|
  s.rstrip.gsub("\n", " ").gsub(":", " ").split(" ").each_slice(2).sort.to_h
}


arr = codes.select { |x| (x.size == 8 or (x.size == 7 and x["cid"].nil?)) }

p arr

p arr.size



