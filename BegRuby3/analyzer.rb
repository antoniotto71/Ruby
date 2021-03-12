
stopwords = %w{the a by on for are with just but and to the my I has some in}
lines = File.readlines("text.txt")  # array with lines of the file as elements
line_count = lines.size # count the lines as elements of the array
text = lines.join # join all the lines to have a unique big text \n is at the end of each line

# Count the words, characters, paragraphs and senternces
word_count = text.split.length #convert text to an array of words and count them
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, "").length # collapse all the spaces and count all characters
paragraph_count = text.split(/\n\n/).length # split at double newlines and count
sentence_count = text.split(/\.|\?|!/).length # split the text at each ., ? or ! and count

# Make a list of words in the text that aren't stop words
# cont them, and work out the percentage of non-stop words
# against all words

all_words = text.scan(/\w+/)
good_words = all_words.select {|word| !stopwords.include?(word)}
good_percentage = (good_words.length.to_f / all_words.length.to_f * 100).to_i

# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} word per sentence (average)"
puts "#{good_percentage}% of words re non-fluff words"

