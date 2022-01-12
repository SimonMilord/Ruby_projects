# frozen_string_literal: true

def substrings(word, dictionary)
  result = Hash.new(0)
  insensitive_word = word.downcase

  dictionary.each do |word|
    match = insensitive_word.scan(word).length
    result[word] = match unless match.zero?
  end
  result
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts(substrings("Howdy partner, sit down! How's it going?", dictionary))

# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

# 1) create the new hash containing results
# 2) make all words lowercase/case insensitive
# 3) iterate through the dictionary and scan for match
# 4) return the result hash
