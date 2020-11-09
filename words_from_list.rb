def words_from_list(string)
  string.downcase.scan(/[\w']+/)
end

p words_from_list("Let’s round off this section with a simple program that calculates the number of times each
  word occurs in some text. (So, for example, in this sentence, the word the occurs two times.)")