import 'dart:async';

extension Tap<T> on T {
  /// Introspects the current value with the provided function
  T tap(void Function(T) fn) {
    fn(this);
    return this;
  }
}


extension FutureTap<T> on Future<T> {
  /// Introspects the current value with the provided function
  Future<T> tap(FutureOr<void> Function(T) fn) async {
    await fn(await this);
    return this;
  }
}

extension TapFuture<T> on T {
  /// Introspects the current value with the provided function
  Future<T> tapFuture(Future<void> Function(T) fn) async {
    await fn(this);
    return this;
  }
}