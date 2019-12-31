class Grains
  SQUARES = 64

  def self.square(number)
    unless number.between?(1, SQUARES)
      raise ArgumentError, "Number must be between 1 and #{SQUARES}."
    end
    2**(number - 1)
  end

  def self.total
    (1..SQUARES).sum { |number| square(number) }
  end
end
