# https://stackoverflow.com/questions/18825669/how-to-do-named-capture-in-ruby

str = "555-333-7777"

m = str.match(/(?<area>\d{3})-(?<city>\d{3})-(?<number>\d{4})/)

n = str =~ /(?<area>\d{3})-(?<city>\d{3})-(?<number>\d{4})/ # returns first position in string where the match happens

p n # n = 0

p m # #<MatchData "555-333-7777" area:"555" city:"333" number:"7777">

m.to_a.each {|x| puts x }

p m.named_captures # transforms named captures ito an hash

p $~ # Returns last match data

p Regexp.last_match # Again returns last match data

p [$1, $2, $3, $4] # Array of groups of pattern matching
