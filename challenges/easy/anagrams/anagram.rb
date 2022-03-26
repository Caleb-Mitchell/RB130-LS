class Anagram
  def initialize(pattern_string)
    @pattern_string = pattern_string.downcase
  end

  def match(word_list)
    anagrams_array = []
    word_list.each do |word|
      lowercase_word = word.downcase
      anagrams_array << word if anagram?(@pattern_string, lowercase_word)
    end
    anagrams_array
  end

  private

  def anagram?(word1, word2)
    word1.chars.sort == word2.chars.sort && word1 != word2
  end
end
