import 'package:tapper/tapper.dart';
import 'package:test/test.dart';

void main() {
  test('Pipe extension applies the function correctly', () {
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
  });
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);
}
