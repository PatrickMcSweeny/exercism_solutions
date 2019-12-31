class TwelveDays
  GIFTS = {
    'first': "a Partridge in a Pear Tree.\n",
    'second': 'two Turtle Doves',
    'third': 'three French Hens',
    'fourth': 'four Calling Birds',
    'fifth': 'five Gold Rings',
    'sixth': 'six Geese-a-Laying',
    'seventh': 'seven Swans-a-Swimming',
    'eighth': 'eight Maids-a-Milking',
    'ninth': 'nine Ladies Dancing',
    'tenth': 'ten Lords-a-Leaping',
    'eleventh': 'eleven Pipers Piping',
    'twelfth': 'twelve Drummers Drumming'
  }.freeze

  def self.song
    new.sing
  end

  def sing
    day_names
      .map do |day_name|
        state_day(day_name) + list_gifts(day_name)
        .push(first_day(day_name))
        .join(', ')
      end
      .join("\n")
  end

  def day_names
    GIFTS.keys
  end

  def state_day(day)
    "On the #{day} day of Christmas my true love gave to me: "
  end

  def list_gifts(day_name)
    day_names[1..day_names.find_index(day_name)]
      .reverse
      .map { |day_name| GIFTS[day_name] }
  end

  def first_day(day_name)
    ('and ' unless day_name == :first).to_s + GIFTS[:first]
  end
end
