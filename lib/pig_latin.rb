
def translate(users_phrase)
  vowels = %w(a e i o u A E I O U)
  consonants = %w(b B c C d D f F g G h H j J k K l L m M n N p P q Q r R s S t T v V w W x X y Y z Z)
  answer = []
  found_consonants = ''
  words_array = users_phrase.split(' ')
  words_array.each do |word|
    letters_in_word = word.split('')
    if(word.start_with?(*vowels))
      word = word + 'ay'
    else
      while(word.start_with?(*consonants)) do
        temp_hold_consonant = letters_in_word.shift
        cap_flag = (temp_hold_consonant == temp_hold_consonant.upcase) ? true : false
        if(temp_hold_consonant == 'q' || temp_hold_consonant == 'Q')
          temp2_hold_consonant = letters_in_word.shift
          if(temp2_hold_consonant == 'u' || temp2_hold_consonant == 'U')
          found_consonants = found_consonants + temp_hold_consonant
          found_consonants = found_consonants + temp2_hold_consonant
          end
        else
          found_consonants = found_consonants + temp_hold_consonant
        end
        word = letters_in_word.join('')
        word = word.downcase
        if(cap_flag)
          word = word.capitalize
        end
      end
      word = letters_in_word.join('')
      word = word << found_consonants + 'ay'
      found_consonants = ''
    end
    answer.push(word)
  end
  return answer.join(' ')
end
