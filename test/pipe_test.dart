import 'package:tapper/tapper.dart';
import 'package:test/test.dart';

void main() {
  test('Pipe extension applies the function correctly', () async {
    int number = 5;
    int result = number.pipe((n) => n * 2);
    expect(result, 10);

    String text = "hello";
    String modifiedText = text.pipe((t) => t.toUpperCase());
    expect(modifiedText, "HELLO");

    var point = Point(2, 3);
    var movedPoint = point.pipe((p) => Point(p.x + 1, p.y + 1));
    expect(movedPoint.x, 3);
    expect(movedPoint.y, 4);

    movedPoint = await movedPoint.pipe((p) async {
      Future.delayed(Duration(milliseconds: 100));
      return Point(p.x + 1, p.y + 1);
    });

    expect(movedPoint.x, 4);
    expect(movedPoint.y, 5);
  });

  test('Future Pipe extension applies the function correctly', () async {
    Future<int> number = Future.value(5);
    int result = await number.pipe((n) => n * 2);
    expect(result, 10);

    Future<String> text = Future.value("hello");
    String modifiedText = await text.pipe((t) => t.toUpperCase());
    expect(modifiedText, "HELLO");

    var point = Future.value(Point(2, 3));
    var movedPoint = await point.pipe((p) => Point(p.x + 1, p.y + 1));
    expect(movedPoint.x, 3);
    expect(movedPoint.y, 4);

    movedPoint = await movedPoint.pipe((p) async {
      await Future.delayed(Duration(milliseconds: 100));
      return Point(p.x + 1, p.y + 1);
    });
    expect(movedPoint.x, 4);
    expect(movedPoint.y, 5);
  });
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}
