const add = (accumulator, currentValue) => accumulator + currentValue;

export class Squares {
  constructor(number) {
    this.range = Array.from(new Array(number), (x, i) => i + 1);
  }

  get sumOfSquares() {
    return this.range.reduce((sum, n) => sum + n ** 2);
  }

  get squareOfSum() {
    return this.range.reduce(add) ** 2;
  }

  get difference() {
    return this.squareOfSum - this.sumOfSquares;
  }
}
