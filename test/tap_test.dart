import 'package:tapper/tapper.dart';
import 'package:test/test.dart';

void main() {
  test('Tap extension calls the function with the object and returns it', () {
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
  });
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);
}
