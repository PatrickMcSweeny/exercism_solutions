static A_INDEX: u8 = b'a';
static Z_INDEX: u8 = b'z';

/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {
    let mut output = decode(plain);

    (5..output.chars().count()).for_each(|i| {
        if i % 5 == 0 {
            let offset = (i / 5) - 1;
            output.insert(i + offset, ' ');
        }
    });
    output
}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {
    cipher
        .to_lowercase()
        .chars()
        .filter(|char| char.is_ascii_alphanumeric())
        .map(|char| {
            if char.is_alphabetic() {
                (Z_INDEX - char as u8 + A_INDEX) as char
            } else {
                char
            }
        })
        .collect::<String>()
}
