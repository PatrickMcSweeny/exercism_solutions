const SECONDS_PER_EARTH_YEAR = 31557600;

const ORBITAL_PERIODS = {
  mercury: 0.2408467,
  venus: 0.61519726,
  earth: 1,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
};

export const age = (planet, seconds) =>
  roundTwo(ageOnEarth(seconds) / ORBITAL_PERIODS[planet]);

const ageOnEarth = seconds =>
  seconds / SECONDS_PER_EARTH_YEAR;

const roundTwo = number =>
  Math.round(number * 100) / 100;
