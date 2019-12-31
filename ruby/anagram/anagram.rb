class Anagram
  def initialize(input)
    @input = input.downcase
  end

  def match(candidates)
    candidates.select do |candidate|
      candidate.downcase != input &&
      candidate.downcase.chars.sort == input.chars.sort
    end
  end

  private

  attr_reader :input
end
