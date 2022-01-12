# frozen_string_literal: true
class Caesar
  def caesar_cipher(string, key = 0)
    new_word = ''
    string.each_char do |char|
      # checks if char is uppercase or lowercase before applying the key shift factor
      if char.ord.between?(65, 90) || char.ord.between?(97, 122)
          new_char = char.ord + key

        # wraps from Z to A or z to a
        new_char -= 26 if (new_char > 90 && char.ord < 91) || new_char > 122
        new_char += 26 if  (new_char < 97 && char.ord > 96) || new_char < 65

        new_word += new_char.chr
      else

        # if the char is a symbol, it will be added to the new_word without the shift
        new_word += char
      end
    end
    new_word
  end
end

# puts(caesar_cipher('my name is simon', -5))

# a: 97 z: 122  // A: 65 Z: 90
