class Isogram
  def self.isogram?(input)
    input = input.downcase.scan /\w/
    input.size == input.uniq.size
  end
end
