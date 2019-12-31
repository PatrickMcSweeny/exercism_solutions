const firstLetters = phrase =>
  phrase
    .replace(/_|\'/g, "")
    .match(/\b\w/g);

export const parse = phrase =>
  firstLetters(phrase)
    .join("")
    .toUpperCase();
