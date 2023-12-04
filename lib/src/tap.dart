extension Tap<T> on T {
  /// Introspects the current value with the provided function
  T tap(void Function(T) fn) {
    fn(this);
    return this;
  }
}
