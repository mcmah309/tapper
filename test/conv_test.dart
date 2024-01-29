import 'dart:math';

import 'package:tapper/src/conv.dart';
import 'package:test/test.dart';

void main() {
  group("tryConv", () {
    test('Int conversion to various types', () {
      expect(5.tryConv<int>().unwrap(), 5);
      expect(5.tryConv<double>().unwrap(), 5.0);
      expect(5.tryConv<num>().unwrap(), 5);
      expect(5.tryConv<bool>().unwrap(), isTrue);
      expect(5.tryConv<String>().unwrap(), '5');
      expect(5.tryConv<BigInt>().unwrap(), BigInt.from(5));
    });

    test('Double conversion to various types', () {
      expect(5.0.tryConv<int>().unwrap(), 5);
      expect(5.0.tryConv<double>().unwrap(), 5.0);
      expect(5.0.tryConv<num>().unwrap(), 5.0);
      expect(5.0.tryConv<bool>().unwrap(), isTrue);
      expect(5.0.tryConv<String>().unwrap(), '5.0');
      expect(5.0.tryConv<BigInt>().unwrap(), BigInt.from(5));
    });

    test('Bool conversion to various types', () {
      expect(true.tryConv<int>().unwrap(), 1);
      expect(true.tryConv<double>().unwrap(), 1.0);
      expect(true.tryConv<num>().unwrap(), 1);
      expect(true.tryConv<bool>().unwrap(), true);
      expect(true.tryConv<String>().unwrap(), 'true');
      expect(true.tryConv<BigInt>().unwrap(), BigInt.from(1));

      expect(false.tryConv<int>().unwrap(), 0);
      expect(false.tryConv<double>().unwrap(), 0.0);
      expect(false.tryConv<num>().unwrap(), 0);
      expect(false.tryConv<bool>().unwrap(), false);
      expect(false.tryConv<String>().unwrap(), 'false');
      expect(false.tryConv<BigInt>().unwrap(), BigInt.zero);
    });

    test('String conversion to various types', () {
      expect('123'.tryConv<int>().unwrap(), 123);
      expect('123.45'.tryConv<double>().unwrap(), 123.45);
      expect('123'.tryConv<num>().unwrap(), 123);
      expect('true'.tryConv<bool>().unwrap(), true);
      expect('string'.tryConv<String>().unwrap(), 'string');
      expect(
          '1234567890'.tryConv<BigInt>().unwrap(), BigInt.parse('1234567890'));
    });

    test('BigInt conversion to various types', () {
      expect(BigInt.from(123).tryConv<int>().unwrap(), 123);
      expect(BigInt.from(123).tryConv<double>().unwrap(), 123.0);
      expect(BigInt.from(123).tryConv<num>().unwrap(), 123);
      expect(BigInt.from(123).tryConv<bool>().unwrap(), isTrue);
      expect(BigInt.from(123).tryConv<String>().unwrap(), '123');
      expect(BigInt.from(123).tryConv<BigInt>().unwrap(), BigInt.from(123));
    });

    test('Iterable to single', () {
      expect([1].tryConv<int>().unwrap(), 1);
      expect([1].tryConv<double>().unwrap(), 1.0);
      expect([1].tryConv<num>().unwrap(), 1);
      expect([1].tryConv<bool>().unwrap(), isTrue);
      expect([1].tryConv<String>().unwrap(), '1');
      expect([1].tryConv<BigInt>().unwrap(), BigInt.from(1));

      expect([1, 2].tryConv<int>().isOk(), false);
      expect([1, 2].tryConv<double>().isOk(), false);
      expect([1, 2].tryConv<num>().isOk(), false);
      expect([1, 2].tryConv<bool>().isOk(), false);
      expect([1, 2].tryConv<String>().isOk(), false);
      expect([1, 2].tryConv<BigInt>().isOk(), false);

      Iterable<int?> nullIterable = [1];
      expect(nullIterable.tryConv<int>().unwrap(), 1);
      expect(nullIterable.tryConv<double>().unwrap(), 1.0);

      nullIterable = [null];
      expect(nullIterable.tryConv<int>().isOk(), false);
      expect(nullIterable.tryConv<double>().isOk(), false);

      nullIterable = [null, 2];
      expect(nullIterable.tryConv<int>().isOk(), false);
      expect(nullIterable.tryConv<double>().isOk(), false);

      final nested = [
        [
          [1]
        ]
      ];
      expect(nested.tryConv<int>().unwrap(), 1);
      expect(nested.tryConv<String>().unwrap(), "1");
    });
  });

  //************************************************************************//

  group("int conv", () {
    test('convDouble returns a double representation of an integer', () {
      expect(5.convDouble(), 5.0);
      expect((-3).convDouble(), -3.0);
      expect(0.convDouble(), 0.0);
    });
    test('convNum returns the same number', () {
      expect(7.convNum(), 7);
      expect((-1).convNum(), -1);
      expect(0.convNum(), 0);
    });
    test('convBigInt returns a BigInt representation of an integer', () {
      expect(2.convBigInt(), BigInt.from(2));
      expect((-4).convBigInt(), BigInt.from(-4));
      expect(0.convBigInt(), BigInt.zero);
    });
    test('convString returns a String representation of an integer', () {
      expect(9.convString(), '9');
      expect((-5).convString(), '-5');
      expect(0.convString(), '0');
    });
    test('convBool returns false for 0 and true for any other integer', () {
      expect(1.convBool(), true);
      expect((-1).convBool(), true);
      expect(0.convBool(), false);
    });
  });

  group("double conv", () {
    test('convInt returns an int representation of a double', () {
      expect(5.0.convInt(), 5);
      expect((-3.5).convInt(), -3);
      expect(0.0.convInt(), 0);
    });

    test('convNum returns the same number', () {
      expect(7.2.convNum(), 7.2);
      expect((-1.1).convNum(), -1.1);
      expect(0.0.convNum(), 0.0);
    });

    test('convBigInt returns a BigInt representation of a double', () {
      expect(2.6.convBigInt(), BigInt.from(2));
      expect((-4.3).convBigInt(), BigInt.from(-4));
      expect(0.0.convBigInt(), BigInt.zero);
    });

    test('convString returns a String representation of a double', () {
      expect(9.7.convString(), '9.7');
      expect((-5.2).convString(), '-5.2');
      expect(0.0.convString(), '0.0');
    });

    test('convBool returns false for 0.0 and true for any other double', () {
      expect(1.1.convBool(), true);
      expect((-1.5).convBool(), true);
      expect(0.0.convBool(), false);
    });
  });

  group("num", () {
    test('convInt returns an int representation of a num', () {
      expect(5.0.convInt(), 5);
      expect((-3.5).convInt(), -3);
      expect(0.convInt(), 0);
    });

    test('convDouble returns a double representation of a num', () {
      expect(7.convDouble(), 7.0);
      expect((-1.1).convDouble(), -1.1);
      expect(0.convDouble(), 0.0);
    });

    test('convBigInt returns a BigInt representation of a num', () {
      expect(2.6.convBigInt(), BigInt.from(2));
      expect((-4).convBigInt(), BigInt.from(-4));
      expect(0.convBigInt(), BigInt.zero);
    });

    test('convString returns a String representation of a num', () {
      expect(9.7.convString(), '9.7');
      expect((-5).convString(), '-5');
      expect(0.convString(), '0');
    });

    test('convBool returns false for 0 and true for any other num', () {
      expect(1.1.convBool(), true);
      expect((-1).convBool(), true);
      expect(0.convBool(), false);
    });
  });

  group("BigInt conv", () {
    test('convInt returns an int representation of a BigInt', () {
      expect(BigInt.from(5).convInt(), 5);
      expect(BigInt.from(-3).convInt(), -3);
      expect(BigInt.zero.convInt(), 0);
    });

    test('convDouble returns a double representation of a BigInt', () {
      expect(BigInt.from(7).convDouble(), 7.0);
      expect(BigInt.from(-1).convDouble(), -1.0);
      expect(BigInt.zero.convDouble(), 0.0);
    });

    test('convNum returns a num representation of a BigInt', () {
      expect(BigInt.from(2).convNum(), 2.0);
      expect(BigInt.from(-4).convNum(), -4.0);
      expect(BigInt.zero.convNum(), 0.0);
    });

    test('convString returns a String representation of a BigInt', () {
      expect(BigInt.from(9).convString(), '9');
      expect(BigInt.from(-5).convString(), '-5');
      expect(BigInt.zero.convString(), '0');
    });

    test('convBool returns false for BigInt.zero and true for any other BigInt',
        () {
      expect(BigInt.from(1).convBool(), true);
      expect(BigInt.from(-1).convBool(), true);
      expect(BigInt.zero.convBool(), false);
    });
  });

  group("bool conv", () {
    test('convInt returns 1 for true and 0 for false', () {
      expect(true.convInt(), 1);
      expect(false.convInt(), 0);
    });

    test('convDouble returns 1.0 for true and 0.0 for false', () {
      expect(true.convDouble(), 1.0);
      expect(false.convDouble(), 0.0);
    });

    test('convNum returns 1 for true and 0 for false', () {
      expect(true.convNum(), 1);
      expect(false.convNum(), 0);
    });

    test('convBigInt returns BigInt.one for true and BigInt.zero for false',
        () {
      expect(true.convBigInt(), BigInt.one);
      expect(false.convBigInt(), BigInt.zero);
    });

    test('convString returns "true" for true and "false" for false', () {
      expect(true.convString(), 'true');
      expect(false.convString(), 'false');
    });
  });

  group("String conv", () {
    test('convInt returns int for valid string and null for invalid', () {
      expect('123'.convInt(), 123);
      expect('-456'.convInt(), -456);
      expect('abc'.convInt(), null);
    });

    test('convDouble returns double for valid string and null for invalid', () {
      expect('123.45'.convDouble(), 123.45);
      expect('-456.78'.convDouble(), -456.78);
      expect('abc'.convDouble(), null);
    });

    test('convNum returns num for valid string and null for invalid', () {
      expect('123'.convNum(), 123);
      expect('123.45'.convNum(), 123.45);
      expect('abc'.convNum(), null);
    });

    test('convBigInt returns BigInt for valid string and null for invalid', () {
      expect('12345678901234567890'.convBigInt(),
          BigInt.parse('12345678901234567890'));
      expect('-12345678901234567890'.convBigInt(),
          BigInt.parse('-12345678901234567890'));
      expect('abc'.convBigInt(), null);
    });

    test('convBool returns false for empty string and true for non-empty', () {
      expect(''.convBool(), false);
      expect('true'.convBool(), true);
      expect('false'.convBool(), true);
    });
  });
}
