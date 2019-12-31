export class PhoneNumber {
  constructor(input) {
    input = input.replace(/\D/g, "");

    if(input[0] === "1"){
      input = input.slice(1);
    }

    this.phoneNumber = input;
  }

  number() {
    if(this.isValid()){
      return this.phoneNumber;
    }else{
      return null;
    }
  }

  isValid() {
    return this.validLength() && this.validFirstNumber();
  }

  validLength() {
    return this.phoneNumber.length === 10;
  }

  validFirstNumber() {
    return parseInt(this.phoneNumber[0]) > 1 && parseInt(this.phoneNumber[3]) > 1;
  }
}
