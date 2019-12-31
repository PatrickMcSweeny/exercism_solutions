const LETTERS = {
  1: /A|E|I|O|U|L|N|R|S|T/gi,
  2: /D|G/gi,
  3: /B|C|M|P/gi,
  4: /F|H|V|W|Y/gi,
  5: /K/gi,
  8: /J|X/gi,
  10: /Q|Z/gi
};

export const score = word => {
  return Object.keys(LETTERS)
    .map(key => {
      return numberOfMatches(word, LETTERS[key]) * key;
    })
    .reduce((sum, number) => sum + number);
};

export const numberOfMatches = (word, regex) => {
  let matches = word.match(regex);

  return matches !== null ? matches.length : 0;
};
