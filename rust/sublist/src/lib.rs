#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
  if _first_list == _second_list {
      Comparison::Equal
  } else if _first_list.iter().all(|item| _second_list.contains(item)) {
      Comparison::Sublist
  } else if _second_list.iter().all(|item| _first_list.contains(item)) {
      Comparison::Superlist
  } else {
      Comparison::Unequal
  }
}
