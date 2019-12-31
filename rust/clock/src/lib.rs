use std::fmt;

#[derive(Debug)]
#[derive(PartialEq)]
#[derive(Eq)]

pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let clock = Self {
            hours: hours.rem_euclid(24),
            minutes: 0,
        };
        clock.add_minutes(minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let m = (&Clock::make_positive(minutes, 60) + self.minutes) % 60;
        let h = ((minutes as f32 + self.minutes as f32) / 60.0).floor() as i32;
        Self {
            hours: (self.hours + &Clock::make_positive(h, 24)) % 24,
            minutes: m,
        }
    }

    fn make_positive(units: i32, increments: i32) -> i32 {
        if units >= 0 {
            units
        } else {
            increments + (units % increments)
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}
