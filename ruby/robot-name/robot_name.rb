module BookKeeping
  VERSION = 3
end

class Robot
  attr_accessor :name, :random
  @@existing_names = []

  def initialize
    @name = new_name
    self
  end

  def reset
    @name = new_name
  end

  def self.forget
    @@existing_names = []
  end

  private

  def new_name
    name = generate_name
    while @@existing_names.include? name
      name = generate_name
    end
    @@existing_names << name
    name
  end

  def generate_name
    @random ||= Random.new
    name = ''
    2.times { name << generate_letter }
    3.times { name << generate_number }
    name
  end

  def generate_letter
    @random.rand(65..90).chr
  end

  def generate_number
    @random.rand(0..9).to_s
  end
end
