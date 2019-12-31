use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut anagrams: HashSet<&str> = HashSet::new();
    let word_chars = sort_chars(word);
    for possible_anagram in possible_anagrams {
        if possible_anagram.to_lowercase() != word.to_lowercase()
            && word_chars == sort_chars(possible_anagram)
        {
            anagrams.insert(possible_anagram);
        }
    }
    anagrams
}

fn sort_chars(unsorted: &str) -> Vec<char> {
    let mut chars = unsorted.to_lowercase().chars().collect::<Vec<char>>();
    chars.sort();
    chars
}
