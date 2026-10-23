///|
test "construct internal enum through facade inside library" {
  let value = @y.TypeA::VariantA
  match value {
    VariantA => inspect("constructed", content="constructed")
  }
}

///|
test "call internal method through facade inside library" {
  let value : @y.TypeA = @y.make()
  inspect(value.method1(), content="42")
}

///|
test "catch internal error through facade inside library" {
  try @y.fail_resolution() catch {
    @y.ResolveError::CurrentDirectoryUnavailable =>
      inspect("caught", content="caught")
  } noraise {
    _ => fail("expected an error")
  }
}
