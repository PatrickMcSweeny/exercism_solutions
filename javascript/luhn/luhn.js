const add = (accumulator, currentValue) => accumulator + currentValue;

export class Luhn {
  constructor(input) {
    this.numbers = input
      .replace(/\s/g, "")
      .split("")
      .reverse()
      .map(char => parseInt(char));
    this.multiplyEvens();
    this.subtractNine();
  }

  get valid() {
    if (this.numbers.length < 2)
      return false;

    return this.numbers.reduce(add) % 10 == 0;
  }

  multiplyEvens() {
    this.numbers = this.numbers.map(function(number, i) {
      return i % 2 !== 0 ? number * 2 : number;
    });
  }

  subtractNine() {
    this.numbers = this.numbers.map(function(number) {
      return number > 9 ? number - 9 : number;
    });
  }
}
