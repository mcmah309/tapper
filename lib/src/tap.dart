extension Tap<T> on T {
  T tap(void Function(T) fn) {
    fn(this);
    return this;
  }
}
