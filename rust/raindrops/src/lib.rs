pub fn raindrops(n: u32) -> String {
    let mut rain_sounds = String::new();

    for key in [3, 5, 7].iter() {
        if n % key == 0 {
            rain_sounds.push_str(&get_sound(*key))
        }
    }

    if rain_sounds.is_empty() {
        n.to_string()
    } else {
        rain_sounds
    }
}

fn get_sound(n: u32) -> String {
    match n {
        3 => "Pling".to_string(),
        5 => "Plang".to_string(),
        7 => "Plong".to_string(),
        _ => "".to_string()
    }
}
