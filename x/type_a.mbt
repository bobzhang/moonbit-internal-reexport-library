///|
pub(all) enum TypeA {
  VariantA
}

///|
pub fn TypeA::method1(_self : TypeA) -> Int32 {
  42
}

///|
pub(all) suberror ResolveError {
  CurrentDirectoryUnavailable
}

///|
pub fn fail_resolution() -> Unit raise ResolveError {
  raise CurrentDirectoryUnavailable
}
