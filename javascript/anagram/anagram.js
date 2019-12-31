export class Anagram {
  constructor(subject) {
    this.subject = subject;
  }

  matches(candidates) {
    return candidates.filter(candidate => {
      return (
        candidate.toLowerCase() !== this.subject.toLowerCase() &&
        this.sortChars(candidate) === this.sortChars(this.subject)
      );
    });
  }

  sortChars(string) {
    let chars = string.toLowerCase().split("");
    chars.sort();
    return chars.join("");
  }
}
