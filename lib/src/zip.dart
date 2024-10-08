extension ZipExtension<A extends Object> on A? {
  @pragma("vm:prefer-inline")
  (A, Z)? zip<Z extends Object>(Z? other) {
    if (this == null) return null;
    if (other == null) return null;
    return (this!, other);
  }
}

extension Zip1Extension<A extends Object> on (A,) {
  @pragma("vm:prefer-inline")
  (A, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, other);
  }
}


extension Zip2Extension<A extends Object, B extends Object> on (A, B) {
  @pragma("vm:prefer-inline")
  (A, B, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, other);
  }
}


extension Zip3Extension<A extends Object, B extends Object, C extends Object>
    on (A, B, C) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, this.$3, other);
  }
}

extension Zip4Extension<A extends Object, B extends Object, C extends Object,
    D extends Object> on (A, B, C, D) {
  @pragma("vm:prefer-inline")
  (A, B, C, D, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, this.$3, this.$4, other);
  }
}

extension Zip5Extension<A extends Object, B extends Object, C extends Object,
    D extends Object, E extends Object> on (A, B, C, D, E) {
  @pragma("vm:prefer-inline")
  (A, B, C, D, E, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, this.$3, this.$4, this.$5, other);
  }
}
