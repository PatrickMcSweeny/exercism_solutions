export class NucleotideCounts {
  static parse(strand) {
    let strandChars = strand.split("");
    let dnaTypes = ["A", "C", "G", "T"];

    if(strandChars.some(char => !dnaTypes.includes(char))){
      throw "Invalid nucleotide in strand";
    }

    return dnaTypes.map(type => {
      return strandChars.filter(char => char === type).length;
    })
    .map(num => num.toString())
    .join(" ");
  }
}
