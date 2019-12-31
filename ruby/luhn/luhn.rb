class Luhn
  def self.valid?(input)
    input.delete! ' '
    return false if input.match?(/^.{1}$|\D/)
    luhn = new(input)
    (luhn.sum % 10).zero?
  end

  def initialize(number_input)
    @numbers = number_input.reverse.each_char.map(&:to_i)
    multiply_evens
    subtract_nine
  end

  def multiply_evens
    @numbers.map!.with_index do |n, i|
      i.odd? ? n * 2 : n
    end
  end

  def subtract_nine
    @numbers.map! do |n|
      n > 9 ? n - 9 : n
    end
  end

  def sum
    @numbers.sum
  end
end
