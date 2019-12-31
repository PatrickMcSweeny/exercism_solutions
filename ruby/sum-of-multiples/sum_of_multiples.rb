class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    @limit = limit
    natural_numbers.sum
  end

  private

  attr_reader :numbers, :limit

  def range
    (1...limit)
  end

  def natural_numbers
    range.select do |number|
      numbers.any? do |n|
        (number % n).zero?
      end
    end
  end
end
