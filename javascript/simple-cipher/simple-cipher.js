const alphabet = "abcdefghijklmnopqrstuvwxyz";

export class Cipher {
  constructor(key) {
    if (key === undefined) {
      this.generateKey();
    } else {
      this.key = key;
    }
  }

  encode(input) {
    var key = this.key;
    return this.transcode(input, function(l, keyPointer) {
      var letterKey = alphabet.indexOf(l) + alphabet.indexOf(key[keyPointer]);
      if (letterKey > 25) {
        letterKey -= 26;
      }
      return letterKey;
    });
  }

  decode(input) {
    var key = this.key;
    return this.transcode(input, function(l, keyPointer) {
      var letterKey = alphabet.indexOf(l) - alphabet.indexOf(key[keyPointer]);
      if (letterKey < 0) {
        letterKey += 26;
      }
      return letterKey;
    });
  }

  keyPointer(index, key) {
    if (index >= this.key.length) {
      return index - this.key.length * Math.floor(index / this.key.length);
    } else {
      return index;
    }
  }

  transcode(input, coder) {
    var keyPointer = 0;
    var key = this.key;
    return input
      .split("")
      .map(function(l) {
        var newLetter = coder(l, keyPointer);

        keyPointer += 1;
        if (keyPointer >= key.length) {
          keyPointer -= key.length;
        }
        return alphabet[newLetter];
      })
      .join("");
  }

  generateKey() {
    var keyLength = Math.floor(Math.random() * 100) + 100;

    for (var i = 0; i <= keyLength; i++) {
      this.key += alphabet[Math.floor(Math.random() * 26)];
    }
  }
}
