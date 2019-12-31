module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(input)
    new(input).nth
  end

  def initialize(input)
    raise ArgumentError, 'There is no zeroth prime' if input.zero?
    @limit = input
  end

  def nth
    i = 2
    total = 0
    while total < limit
      if i.prime?
        prime = i
        total += 1
      end
      i += 1
    end
    prime
  end

  private

  attr_reader :limit
end

class Integer
  def prime?
    (2..(self / 2)).none? { |n| (self % n).zero? }
  end
end
