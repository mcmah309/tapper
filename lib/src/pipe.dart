extension Pipe<T> on T {
  /// Applies the provided transformation on the current value, returning the result
  R pipe<R>(R Function(T) fn) {
    return fn(this);
  }
}
