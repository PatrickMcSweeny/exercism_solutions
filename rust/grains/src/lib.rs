const SQUARES: u32 = 64;

pub fn square(s: u32) -> u64 {
    if s < 1 || s > SQUARES {
        panic!("Square must be between 1 and {}", SQUARES);
    }
    2_u64.pow(s - 1)
}

pub fn total() -> u64 {
    (1..=SQUARES).map(|number| square(number)).sum()
}
