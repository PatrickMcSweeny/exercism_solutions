const alphabet = "abcdefghijklmnopqrstuvwxyz";

export const isPangram = (input) => {
  input = input.toLowerCase();
  return alphabet.split("").every(function(letter) {
    return input.includes(letter);
  });
};
