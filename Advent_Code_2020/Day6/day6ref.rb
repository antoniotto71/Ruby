require 'set'

sum1 = File.readlines("input.txt", "\n\n").map {
  |s| s.rstrip.gsub("\n", "").chars.to_a }.map(&:to_set).map(&:size).inject(0, :+)

puts sum1


sum2 = ((File.readlines("input.txt", "\n\n").map { |s| s.rstrip.split("\n") }.map {
  |x| x.map { |y| y.chars.to_a.to_set } }).map { |x| x.inject(("a".."z").to_set) {
  |a, b| a & b } }).map(&:size).inject(0, :+)

puts sum2
