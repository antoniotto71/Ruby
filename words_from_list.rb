def words_from_list(string)
  string.downcase.scan(/[\w']+/)
end

text = "Let’s round off this section with a simple program that calculates the number of times each
word occurs in some text. (So, for example, in this sentence, the word the occurs two times.)"

p words_from_list(text)

puts words_from_list(text).class
