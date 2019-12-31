class Phrase
  attr_reader :words

  def initialize(phrase)
    @words = phrase.downcase.scan /\b[\w\']+\b/
  end

  def word_count
    words.uniq.each_with_object({}) do |word, word_count|
      word_count[word] = words.count(word)
    end
  end
end
