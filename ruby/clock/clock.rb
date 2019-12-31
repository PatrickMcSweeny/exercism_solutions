module BookKeeping
  VERSION = 2
end

class Clock
  attr_accessor :hours, :minutes
  DAY = 24
  HOUR = 60
  private_constant :DAY, :HOUR

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    rollover_minutes
  end

  def self.at(hours, minutes)
    new(hours, minutes)
  end

  def to_s
    format '%02i:%02i', @hours, @minutes
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def +(other)
    @minutes += other
    rollover_minutes
    self
  end

  private

  def rollover_hours
    if @hours.negative?
      @hours = DAY - -@hours % DAY
    else
      @hours -= @hours / DAY * DAY
    end
    @hours = 0 if @hours == DAY
  end

  def rollover_minutes
    minutes = @minutes
    if @minutes.negative?
      @minutes = HOUR - -@minutes % HOUR
    else
      @minutes -= @minutes / HOUR * HOUR
    end
    @hours += minutes / HOUR
    rollover_hours
  end
end
