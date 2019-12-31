class PhoneNumber
  def self.clean(input)
    new(input).valid_number
  end

  def initialize(input)
    @phone_number = input
  end

  def valid_number
    remove_nondigits
    remove_leading_one
    phone_number if valid?
  end

  private

  attr_reader :phone_number

  def valid?
    phone_number.length == 10 && area_code_valid? && exchange_code_valid?
  end

  def area_code_valid?
    phone_number[0].match?(/[2-9]/)
  end

  def exchange_code_valid?
    phone_number[3].match?(/[2-9]/)
  end

  def remove_nondigits
    @phone_number.gsub!(/\D/, '')
  end

  def remove_leading_one
    @phone_number.gsub!(/^1/, '')
  end
end
