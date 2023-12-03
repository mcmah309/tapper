import 'package:rust_core/core.dart';

extension Conv<T extends Object> on T {
  Result<U, ConvException> tryConv<U extends Object>() {
    T from = this;
    U? to;
    switch (from) {
      case int():
        switch (U) {
          case int:
            to = from as U?;
          case double:
            to = from.convDouble() as U?;
          case num:
            to = from.convNum() as U?;
          case bool:
            to = from.convBool() as U?;
          case String:
            to = from.convString() as U?;
          case BigInt:
            to = from.convBigInt() as U?;
        }
        break;
      case double():
        switch (U) {
          case int:
            to = from.convInt() as U?;
          case double:
            to = from as U?;
          case num:
            to = from.convNum() as U?;
          case bool:
            to = from.convBool() as U?;
          case String:
            to = from.toString() as U?;
          case BigInt:
            to = from.convBigInt() as U?;
        }
        break;
      // case num: //already handled by int and double
      case bool():
        switch (U) {
          case int:
            to = from.convInt() as U?;
          case double:
            to = from.convDouble() as U?;
          case num:
            to = from.convNum() as U?;
          case bool:
            to = from as U?;
          case String:
            to = from.convString() as U?;
          case BigInt:
            to = from.convBigInt() as U?;
        }
        break;
      case String():
        switch (U) {
          case int:
            to = from.convInt() as U?;
          case double:
            to = from.convDouble() as U?;
          case num:
            to = from.convNum() as U?;
          case bool:
            to = from.convBool() as U?;
          case String:
            to = from as U?;
          case BigInt:
            to = from.convBigInt() as U?;
        }
        break;
      case BigInt():
        switch (U) {
          case int:
            to = from.convInt() as U?;
          case double:
            to = from.convDouble() as U?;
          case num:
            to = from.convNum() as U?;
          case bool:
            to = from.convBool() as U?;
          case String:
            to = from.convString() as U?;
          case BigInt:
            to = from as U?;
        }
        break;
    }
    if (to == null) {
      return Err(ConvException(T, U));
    }
    return Ok(to);
  }
}

//************************************************************************//

extension ConvInt on int {
  double convDouble() {
    return toDouble();
  }

  num convNum() {
    return this;
  }

  BigInt convBigInt() {
    return BigInt.from(this);
  }

  String convString() {
    return toString();
  }

  bool convBool() {
    return this == 0 ? false : true;
  }
}

extension ConvDouble on double {
  int convInt() {
    return toInt();
  }

  num convNum() {
    return this;
  }

  BigInt convBigInt() {
    return BigInt.from(this);
  }

  String convString() {
    return toString();
  }

  bool convBool() {
    return this == 0.0 ? false : true;
  }
}

extension ConvNum on num {
  int convInt() {
    return toInt();
  }

  double convDouble() {
    return toDouble();
  }

  BigInt convBigInt() {
    return BigInt.from(this);
  }

  String convString() {
    return toString();
  }

  bool convBool() {
    return this == 0 ? false : true;
  }
}

extension ConvBigInt on BigInt {
  int convInt() {
    return toInt();
  }

  double convDouble() {
    return toDouble();
  }

  num convNum() {
    return toDouble();
  }

  String convString() {
    return toString();
  }

  bool convBool() {
    return this == BigInt.zero ? false : true;
  }
}

extension ConvBool on bool {
  int convInt() {
    return this ? 1 : 0;
  }

  double convDouble() {
    return this ? 1.0 : 0.0;
  }

  num convNum() {
    return this ? 1 : 0;
  }

  BigInt convBigInt() {
    return this ? BigInt.one : BigInt.zero;
  }

  String convString() {
    return toString();
  }
}

extension ConvString on String {
  int? convInt() {
    return int.tryParse(this);
  }

  double? convDouble() {
    return double.tryParse(this);
  }

  num? convNum() {
    return num.tryParse(this);
  }

  BigInt? convBigInt() {
    return BigInt.tryParse(this);
  }

  bool convBool() {
    return this == "" ? false : true;
  }
}

//************************************************************************//

class ConvException implements Exception {
  final Type from;
  final Type to;

  ConvException(this.from, this.to);

  @override
  String toString() {
    return "ConversionException: Failed to convert from type '$from' to '$to'.";
  }
}
