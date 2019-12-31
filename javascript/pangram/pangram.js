const alphabet = "abcdefghijklmnopqrstuvwxyz";

export const isPangram = (input) => {
  return alphabet.split("").every(function(letter) {
    return input.toLowerCase().includes(letter);
  });
};
