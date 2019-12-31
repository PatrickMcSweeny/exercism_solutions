pub fn reply(message: &str) -> &str {
    match message.trim() {
        s if silence(s) => "Fine. Be that way!",
        s if forceful_question(s) => "Calm down, I know what I'm doing!",
        s if question(s) => "Sure.",
        s if shouting(s) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}

fn question(input: &str) -> bool {
    input.ends_with("?")
}

fn forceful_question(input: &str) -> bool {
    shouting(input) && question(input)
}

fn shouting(input: &str) -> bool {
    let mut chars = input.chars();
    chars.any(|char| char.is_alphabetic())
        && chars
            .filter(|char| char.is_alphabetic())
            .all(|char| char.is_uppercase())
}

fn silence(input: &str) -> bool {
    input.is_empty()
}
