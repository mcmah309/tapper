import 'package:tapper/tapper.dart';
import 'package:test/test.dart';

void main() {
  test('Tap extension calls the function with the object and returns it',
      () async {
    int number = 5;
    int result = number.tap((n) {
      expect(n, number);
    });
    expect(result, number);

    String text = "hello";
    String modifiedText = text.tap((t) {
      expect(t, text);
    });
    expect(modifiedText, text);

    var point = Point(2, 3);
    var tappedPoint = point.tap((p) {
      expect(p, point);
    });
    expect(tappedPoint, point);

    tappedPoint = await point.tapFuture((p) async {
      await Future.delayed(Duration(milliseconds: 100));
      expect(p, point);
      point = Point(3, 4);
    });
    expect(point, Point(3, 4));
  });

  test('Future Tap extension calls the function with the object and returns it',
      () async {
    Future<int> number = Future.value(5);
    int result = await number.tap((n) {
      expect(n, 5);
    });
    expect(result, 5);

    Future<String> text = Future.value("hello");
    String modifiedText = await text.tap((t) {
      expect(t, "hello");
    });
    expect(modifiedText, "hello");

    var point = Future.value(Point(2, 3));
    var tappedPoint = await point.tap((p) {
      expect(p, isA<Point>());
    });
    expect(tappedPoint, isA<Point>());

    tappedPoint = await point.tap((p) async {
      await Future.delayed(Duration(milliseconds: 100));
      expect(p, isA<Point>());
      point = Future.value(Point(3, 4));
    });
    expect(await point, Point(3, 4));
  });
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}
