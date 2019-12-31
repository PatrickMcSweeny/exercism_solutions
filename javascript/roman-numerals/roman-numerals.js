const NUMERALS = {
  1: "I",
  4: "IV",
  5: "V",
  9: "IX",
  10: "X",
  40: "XL",
  50: "L",
  90: "XC",
  100: "C",
  400: "CD",
  500: "D",
  900: "CM",
  1000: "M"
};

export const toRoman = input => {
  let number = input;
  return Object.keys(NUMERALS)
    .reverse()
    .map(key => {
      let numeral = "";

      if (key <= number) {
        let times = Math.floor(number / key);
        number -= key * times;
        for (let i = 1; i <= times; i++) {
          numeral += NUMERALS[key];
        }
      }
      return numeral;
    })
    .join("");
};
