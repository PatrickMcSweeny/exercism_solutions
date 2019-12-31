const rna = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
};

export const toRna = dna =>
  dna
    .split("")
    .map(function(x) {
      if (x in rna) {
        return rna[x];
      } else {
        throw new Error("Invalid input");
      }
    })
    .join("");
