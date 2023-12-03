

extension Pipe<T> on T {
  T pipe(T Function(T) fn){
    return fn(this);
  }
}