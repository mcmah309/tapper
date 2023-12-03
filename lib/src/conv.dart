import 'package:rust_core/core.dart';

extension Conv<T extends Object> on T {
  Result<U, ConvException> tryConv<U extends Object>() {
    T y = this;
    U? to;
    switch (y) {
      case int():
        switch (U) {
          case int:
            to = y as U?;
          case double:
            to = y.convDouble() as U?;
          case num:
            to = y.convNum() as U?;
          case bool:
            to = y.convBool() as U?;
          case String:
            to = y.convString() as U?;
          case BigInt:
            to = y.convBigInt() as U?;
        }
        break;
      case double():
        switch (U) {
          case int:
            to = y.convInt() as U?;
          case double:
            to = y as U?;
          case num:
            to = y.convNum() as U?;
          case bool:
            to = y.convBool() as U?;
          case String:
            to = y.toString() as U?;
          case BigInt:
            to = y.convBigInt() as U?;
        }
        break;
      // case num():
      //   switch (U) {
      //     case int:
      //       to = y.convInt()as U?;
      //     case double:
      //       to = y.convDouble()as U?;
      //     case num:
      //       to = y as U?;
      //     case bool:
      //       to = y.convBool()as U?;
      //     case String:
      //       to = y.convString()as U?;
      //     case BigInt:
      //       to = y.convBigInt()as U?;
      //   }
      //   break;
      case bool():
        switch (U) {
          case int:
            to = y.convInt() as U?;
          case double:
            to = y.convDouble() as U?;
          case num:
            to = y.convNum() as U?;
          case bool:
            to = y as U?;
          case String:
            to = y.convString() as U?;
          case BigInt:
            to = y.convBigInt() as U?;
        }
        break;
      case String():
        switch (U) {
          case int:
            to = y.convInt() as U?;
          case double:
            to = y.convDouble() as U?;
          case num:
            to = y.convNum() as U?;
          case bool:
            to = y.convBool() as U?;
          case String:
            to = y as U?;
          case BigInt:
            to = y.convBigInt() as U?;
        }
        break;
      case BigInt():
        switch (U) {
          case int:
            to = y.convInt() as U?;
          case double:
            to = y.convDouble() as U?;
          case num:
            to = y.convNum() as U?;
          case bool:
            to = y.convBool() as U?;
          case String:
            to = y.convString() as U?;
          case BigInt:
            to = y as U?;
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
