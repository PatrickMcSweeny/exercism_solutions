export class Words {
  count(inputString) {
    let counts = {};
    let words = inputString
      .toLowerCase()
      .trim()
      .split(/\s+/);

    words.forEach(function(word) {
      counts[word] = words.filter(wordMatch => word === wordMatch).length;
    });

    return counts;
  }
}
