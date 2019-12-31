import BigInt from './lib/big-integer';

const NUMBER_OF_SQUARES = 64;

export class Grains {
  square(number) {
    return BigInt(2).pow(number - 1).toString();
  }

  total() {
    let total = BigInt(0);

    for(let i = 1; i <= NUMBER_OF_SQUARES; i++){
      total = total.add(this.square(i));
    }
    return total.toString();
  }
}
