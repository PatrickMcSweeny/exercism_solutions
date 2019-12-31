const SOUNDS = {
  3: "Pling",
  5: "Plang",
  7: "Plong"
};

export const convert = number => {
  let sound = Object.keys(SOUNDS)
    .map(key => {
      if (number % key == 0) {
        return SOUNDS[key];
      }
    })
    .join("");

  if (sound.length > 0) {
    return sound;
  } else {
    return number.toString();
  }
};
