extension ZipExtension<A extends Object> on A? {
  @pragma("vm:prefer-inline")
  (A, Z)? zip<Z extends Object>(Z? other) {
    if (this == null) return null;
    if (other == null) return null;
    return (this!, other);
  }
}

extension ZipExtension1A<A extends Object> on (A,) {
  @pragma("vm:prefer-inline")
  (A, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, other);
  }
}

extension ZipExtension1B<A extends Object> on (A?,) {
  @pragma("vm:prefer-inline")
  (A, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (other == null) return null;
    return (this.$1!, other);
  }
}

//************************************************************************//

extension ZipExtension2A<A extends Object, B extends Object> on (A, B) {
  @pragma("vm:prefer-inline")
  (A, B, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, other);
  }
}

extension ZipExtension2B<A extends Object, B extends Object> on (A?, B) {
  @pragma("vm:prefer-inline")
  (A, B, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2, other);
  }
}

extension ZipExtension2C<A extends Object, B extends Object> on (A, B?) {
  @pragma("vm:prefer-inline")
  (A, B, Z)? zip<Z extends Object>(Z? other) {
    if (this.$2 == null) return null;
    if (other == null) return null;
    return (this.$1, this.$2!, other);
  }
}

extension ZipExtension2D<A extends Object, B extends Object> on (A?, B?) {
  @pragma("vm:prefer-inline")
  (A, B, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (this.$2 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2!, other);
  }
}

//************************************************************************//

extension ZipExtension3A<A extends Object, B extends Object, C extends Object>
    on (A, B, C) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (other == null) return null;
    return (this.$1, this.$2, this.$3, other);
  }
}

extension ZipExtension3B<A extends Object, B extends Object, C extends Object>
    on (A?, B, C) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2, this.$3, other);
  }
}

extension ZipExtension3C<A extends Object, B extends Object, C extends Object>
    on (A, B?, C) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$2 == null) return null;
    if (other == null) return null;
    return (this.$1, this.$2!, this.$3, other);
  }
}

extension ZipExtension3D<A extends Object, B extends Object, C extends Object>
    on (A, B, C?) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$3 == null) return null;
    if (other == null) return null;
    return (this.$1, this.$2, this.$3!, other);
  }
}

extension ZipExtension3E<A extends Object, B extends Object, C extends Object>
    on (A?, B?, C) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (this.$2 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2!, this.$3, other);
  }
}

extension ZipExtension3F<A extends Object, B extends Object, C extends Object>
    on (A?, B, C?) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (this.$3 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2, this.$3!, other);
  }
}

extension ZipExtension3G<A extends Object, B extends Object, C extends Object>
    on (A, B?, C?) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$2 == null) return null;
    if (this.$3 == null) return null;
    if (other == null) return null;
    return (this.$1, this.$2!, this.$3!, other);
  }
}

extension ZipExtension3H<A extends Object, B extends Object, C extends Object>
    on (A?, B?, C?) {
  @pragma("vm:prefer-inline")
  (A, B, C, Z)? zip<Z extends Object>(Z? other) {
    if (this.$1 == null) return null;
    if (this.$2 == null) return null;
    if (this.$3 == null) return null;
    if (other == null) return null;
    return (this.$1!, this.$2!, this.$3!, other);
  }
}
