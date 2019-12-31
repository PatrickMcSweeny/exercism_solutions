class Complement
  RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(dna)
    dna.chars.map { |char| RNA.fetch(char) { return '' } }.join
  end
end
