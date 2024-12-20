// ignore_for_file: unused_local_variable

import 'package:rust/rust.dart';
import 'package:tapper/tapper.dart';

void main() {
  int? number = 10;
  number = number.tap((n) => ++n).tap((n) => print("The number is $n"));
  // Prints: The number is 10

  number.pipe((n) => ++n).pipe((n) {
    print("The number is $n");
    return n;
  });
  // Prints: The number is 11

  String numericString = "123";
  number = numericString.convInt(); // convInt exists for this type
  // number is now 123

  Object nonNumericString = "abc";
  Result<int, TryConvError> numberResult = nonNumericString.tryConv<int>();
  // conversion is not possible and handled with Result

  List<Set<List<int>>> nestedInt = [
    {
      [1]
    }
  ];
  Result<String, TryConvError> stringResult = nestedInt.tryConv<String>();
  // result is Ok("1")
}
