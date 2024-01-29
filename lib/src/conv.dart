import 'package:rust_core/result.dart';

extension Conv<T extends Object> on T {
  /// Attempts to convert this into [U].
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
      case Iterable<Object?>():
        switch (U) {
          case int:
            to = _tryConvFromIterableHelper<U>(from);
          case double:
            to = _tryConvFromIterableHelper<U>(from);
          case num:
            to = _tryConvFromIterableHelper<U>(from);
          case bool:
            to = _tryConvFromIterableHelper<U>(from);
          case String:
            to = _tryConvFromIterableHelper<U>(from);
          case BigInt:
            to = _tryConvFromIterableHelper<U>(from);
        }
        break;
    }
    if (to == null) {
      return Err(ConvException(T, U));
    }
    return Ok(to);
  }
}

U? _tryConvFromIterableHelper<U extends Object>(Iterable<Object?> from) {
  final inner = from.singleOrNull;
  if (inner == null) {
    return null;
  }
  final innerConv = inner.tryConv<U>();
  if (innerConv.isErr()) {
    return null;
  }
  return innerConv.unwrap();
}

//************************************************************************//

extension ConvInt on int {
  /// Converts this into a [double].
  double convDouble() {
    return toDouble();
  }

  /// Converts this into a [num].
  num convNum() {
    return this;
  }

  /// Converts this into a [BigInt].
  BigInt convBigInt() {
    return BigInt.from(this);
  }

  /// Converts this into a [String].
  String convString() {
    return toString();
  }

  /// Converts this into a [bool]. Returns false if this is zero, otherwise true.
  bool convBool() {
    return this == 0 ? false : true;
  }
}

extension ConvDouble on double {
  /// Converts this into an [int].
  int convInt() {
    return toInt();
  }

  /// Converts this into a [num].
  num convNum() {
    return this;
  }

  /// Converts this into a [BigInt].
  BigInt convBigInt() {
    return BigInt.from(this);
  }

  /// Converts this into a [String].
  String convString() {
    return toString();
  }

  /// Converts this into a [bool]. Returns false if this is zero, otherwise true.
  bool convBool() {
    return this == 0.0 ? false : true;
  }
}

extension ConvNum on num {
  /// Converts this into an [int].
  int convInt() {
    return toInt();
  }

  /// Converts this into a [double].
  double convDouble() {
    return toDouble();
  }

  /// Converts this into a [BigInt].
  BigInt convBigInt() {
    return BigInt.from(this);
  }

  /// Converts this into a [String].
  String convString() {
    return toString();
  }

  /// Converts this into a [bool]. Returns false if this is zero, otherwise true.
  bool convBool() {
    return this == 0 ? false : true;
  }
}

extension ConvBigInt on BigInt {
  /// Converts this into an [int].
  int convInt() {
    return toInt();
  }

  /// Converts this into a [double].
  double convDouble() {
    return toDouble();
  }

  /// Converts this into a [num].
  num convNum() {
    return toDouble();
  }

  /// Converts this into a [String].
  String convString() {
    return toString();
  }

  /// Converts this into a [bool]. Returns false if this is zero, otherwise true.
  bool convBool() {
    return this == BigInt.zero ? false : true;
  }
}

extension ConvBool on bool {
  /// Converts this into an [int]. Returns 1 if this is true, otherwise 0.
  int convInt() {
    return this ? 1 : 0;
  }

  /// Converts this into a [double]. Returns 1.0 if this is true, otherwise 0.0.
  double convDouble() {
    return this ? 1.0 : 0.0;
  }

  /// Converts this into a [num]. Returns 1 if this is true, otherwise 0.
  num convNum() {
    return this ? 1 : 0;
  }

  /// Converts this into a [BigInt]. Returns 1 if this is true, otherwise 0.
  BigInt convBigInt() {
    return this ? BigInt.one : BigInt.zero;
  }

  /// Converts this into a [String]. Returns "true" if this is true, otherwise "false".
  String convString() {
    return toString();
  }
}

extension ConvString on String {
  /// Converts this into an [int]. Returns null if this is not a valid [int].
  int? convInt() {
    return int.tryParse(this);
  }

  /// Converts this into a [double]. Returns null if this is not a valid [double].
  double? convDouble() {
    return double.tryParse(this);
  }

  /// Converts this into a [num]. Returns null if this is not a valid [num].
  num? convNum() {
    return num.tryParse(this);
  }

  /// Converts this into a [BigInt]. Returns null if this is not a valid [BigInt].
  BigInt? convBigInt() {
    return BigInt.tryParse(this);
  }

  /// Converts this into a [bool]. Returns false if this is an empty string, otherwise true.
  bool convBool() {
    return this == "" ? false : true;
  }
}

//************************************************************************//

/// Exception from a failed conversion
class ConvException implements Exception {
  final Type from;
  final Type to;

  ConvException(this.from, this.to);

  @override
  String toString() {
    return "ConversionException: Failed to convert from type '$from' to '$to'.";
  }
}
