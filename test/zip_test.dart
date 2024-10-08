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
    x = (missing(),).zip(provided());
    expect(x, null);
    x = (1,).zip(missing());
    expect(x, null);
    x = (missing(),).zip(1);
    expect(x, null);
    x = (missing(),).zip(missing());
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
    x = (provided(), missing()).zip(missing());
    expect(x, null);
    x = (missing(), provided()).zip(missing());
    expect(x, null);
    x = (missing(), missing()).zip(missing());
    expect(x, null);

    x = (provided(), provided()).zip(provided());
    expect(x, (1,1,1));
    x = (provided(), missing()).zip(provided());
    expect(x, null);
    x = (missing(), provided()).zip(provided());
    expect(x, null);
    x = (missing(), missing()).zip(provided());
    expect(x, null);

  });

  test('zip3', (){
    (int, int, int, int)? x;

    x = (provided(), provided(), provided()).zip(missing());
    expect(x, null);
    x = (provided(), provided(), missing()).zip(missing());
    expect(x, null);
    x = (provided(), missing(), provided()).zip(missing());
    expect(x, null);
    x = (missing(), provided(), provided()).zip(missing());
    expect(x, null);
    x = (missing(), provided(), missing()).zip(missing());
    expect(x, null);
    x = (missing(), missing(), provided()).zip(missing());
    expect(x, null);
    x = (provided(), missing(), missing()).zip(missing());
    expect(x, null);
    x = (missing(), missing(), missing()).zip(missing());
    expect(x, null);

    x = (provided(), provided(), provided()).zip(provided());
    expect(x, (1,1,1,1));
    x = (provided(), provided(), missing()).zip(provided());
    expect(x, null);
    x = (provided(), missing(), provided()).zip(provided());
    expect(x, null);
    x = (missing(), provided(), provided()).zip(provided());
    expect(x, null);
    x = (missing(), provided(), missing()).zip(provided());
    expect(x, null);
    x = (missing(), missing(), provided()).zip(provided());
    expect(x, null);
    x = (provided(), missing(), missing()).zip(provided());
    expect(x, null);
    x = (missing(), missing(), missing()).zip(provided());
  });
}
