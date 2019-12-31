const isSilence = message => message === "";

const isShouting = message =>
  message === message.toUpperCase() && message !== message.toLowerCase();

const isQuestion = message => message.endsWith("?");

export const hey = message => {
  message = message.trim();

  if (isSilence(message)) {
    return "Fine. Be that way!";
  } else if (isShouting(message)) {
    if (isQuestion(message)) {
      return "Calm down, I know what I'm doing!";
    } else {
      return "Whoa, chill out!";
    }
  } else if (isQuestion(message)) {
    return "Sure.";
  } else {
    return "Whatever.";
  }
};
