import 'dart:async';

extension Pipe<T> on T {
  /// Applies the provided transformation on the current value, returning the result
  R pipe<R>(R Function(T) fn) {
    return fn(this);
  }
}

extension FuturePipe<T> on Future<T> {
  /// Applies the provided transformation on the current value, returning the result
  Future<R> pipe<R>(FutureOr<R> Function(T) fn) {
    return then(fn);
  }
}

