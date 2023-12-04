extension Pipe<T> on T {
  R pipe<R>(R Function(T) fn) {
    return fn(this);
  }
}
