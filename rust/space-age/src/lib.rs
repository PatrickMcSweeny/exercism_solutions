const SECONDS_PER_EARTH_YEAR: f64 = 31_557_600.0;

#[derive(Debug)]
pub struct Duration {
    years_on_earth: f64,
}

impl From<u64> for Duration {
    fn from(seconds: u64) -> Self {
        Duration {
            years_on_earth: seconds as f64 / SECONDS_PER_EARTH_YEAR,
        }
    }
}

pub trait Planet {
    const ORBITAL_PERIOD: f64;
    fn years_during(duration: &Duration) -> f64 {
        duration.years_on_earth / Self::ORBITAL_PERIOD
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    const ORBITAL_PERIOD: f64 = 0.2408467;
}

impl Planet for Venus {
    const ORBITAL_PERIOD: f64 = 0.61519726;
}

impl Planet for Earth {
    const ORBITAL_PERIOD: f64 = 1.0;
}

impl Planet for Mars {
    const ORBITAL_PERIOD: f64 = 1.8808158;
}

impl Planet for Jupiter {
    const ORBITAL_PERIOD: f64 = 11.862615;
}

impl Planet for Saturn {
    const ORBITAL_PERIOD: f64 = 29.447498;
}

impl Planet for Uranus {
    const ORBITAL_PERIOD: f64 = 84.016846;
}

impl Planet for Neptune {
    const ORBITAL_PERIOD: f64 = 164.79132;
}
