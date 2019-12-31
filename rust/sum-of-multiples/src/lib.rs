pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit)
        .filter(|i| factors.into_iter().any(|n| *n > 0 && i % n == 0))
        .sum()
}
