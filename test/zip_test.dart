import 'package:tapper/tapper.dart';
import 'package:test/test.dart';

void main() {
  int provided() => 1;
  int? missing() => null;

  test('zip', () {
    (int, int)? x = provided().zip(missing());
    expect(x, null);
    x = missing().zip(provided());
    expect(x, null);
    x = 1.zip(missing());
    expect(x, null);
    x = missing().zip(1);
    expect(x, null);
    x = missing().zip(missing());
    expect(x, null);
    x = provided().zip(provided());
    expect(x, (1, 1));
    x = 1.zip(2);
    expect(x, (1, 2));
  });

  test('zip1', () {
    (int, int)? x = (provided(),).zip(missing());
    expect(x, null);
    x = (provided(),).zip(provided());
    expect(x, (1, 1));
    x = (1,).zip(2);
    expect(x, (1, 2));
  });

  test('zip2', () {
    (int, int, int)? x;

    x = (provided(), provided()).zip(missing());
    expect(x, null);

    x = (provided(), provided()).zip(provided());
    expect(x, (1, 1, 1));
  });

  test('zip3', () {
    (int, int, int, int)? x;

    x = (provided(), provided(), provided()).zip(missing());
    expect(x, null);

    x = (provided(), provided(), provided()).zip(provided());
    expect(x, (1, 1, 1, 1));
  });

  test('zip4', () {
    (int, int, int, int, int)? x;

    x = (provided(), provided(), provided(), provided()).zip(missing());
    expect(x, null);

    x = (provided(), provided(), provided(), provided()).zip(provided());
    expect(x, (1, 1, 1, 1, 1));
  });

  test('zip5', () {
    (int, int, int, int, int, int)? x;

    x = (provided(), provided(), provided(), provided(), provided())
        .zip(missing());
    expect(x, null);

    x = (provided(), provided(), provided(), provided(), provided())
        .zip(provided());
    expect(x, (1, 1, 1, 1, 1, 1));
  });
}
