export const isIsogram = candidate => {
  candidate = candidate.toLowerCase().replace(/\s|-/g, '');
  let uniqueChars = candidate.split("").filter(function(char, index){
    return candidate.indexOf(char) === index;
  });
  return uniqueChars.length === candidate.length;
};
