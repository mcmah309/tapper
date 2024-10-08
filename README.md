# Tapper

[![Pub Version](https://img.shields.io/pub/v/tapper.svg)](https://pub.dev/packages/tapper)
[![Dart Package Docs](https://img.shields.io/badge/documentation-pub.dev-blue.svg)](https://pub.dev/documentation/tapper/latest/)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://github.com/mcmah309/tapper/actions/workflows/dart.yml/badge.svg)](https://github.com/mcmah309/tapper/actions)

Provides extension methods on all types to allow 
 - inspection/mutation (tap),
 - transformation (pipe)
 - null chaining deconstruction (zip)
 - safe type conversion without casting (conv).

## Tap

The `Tap` extension allows you to perform an operation on an object and then return the original object. It's useful for
debugging, performing side effects, or logging.

```dart

int number = 10;
number = number
          .tap((n) => ++n )
          .tap((n) => print("The number is ${n}"));
// Prints: The number is 10
```

## Pipe

The Pipe extension lets you transform an object.

```dart
int number = 10;
number = number
          .pipe((n) => ++n )
          .pipe((n) { 
            print("The number is ${n}"); 
            return n;
          });
// Prints: The number is 11
```

## Zip
`zip` is an extension method for values and records that pulls any inner nullable values into the outer
scope. This can be combined with the `?` operator for more concise statements.

```dart
String? getName() => ...;
String? getPreferences() => ...;

if (getName()?
      .pipe((e) => e.zip(getPreferences()))?
      .pipe((e) => e.zip(getDetails()))
      case (String name, String preferences, String details)) {
  print("Hello $name, your preferences are $preferences and details are $details");
} else {
  return;
}
// vs
String? name = getName();
if (name == null) {
  return;
}
String? preferences = getPreferences();
if (preferences == null) {
  return;
}
String? details = getDetails();
if (details == null) {
  return;
}
print("Hello $name, your preferences are $preferences and details are $details");
```

## Conv

The Conv extension is used for type conversion. You can convert an object from one type to another, handling cases where
the conversion is not possible.

```dart

String numericString = "123";
int? number = numericString.convInt(); // convInt exists for this type
// number is now 123
```

Try Conv exists for dynamic inputs and concrete output.
```dart
Object nonNumericString = "abc";
Result<int, ConvException> numberResult = nonNumericString.tryConv<int>();
// conversion is not possible and handled with Result

List<Set<List<int>>> nestedInt = [{[1]}];
Result<double, ConvException> doubleResult = nestedInt.tryConv<double>();
// doubleResult is Ok(1.0)
```

### Valid Conversions

#### Built-In

| From Type | To Type   | Method Used    |
|-----------|-----------|----------------|
| `int`     | `double`  | `convDouble()` |
| `int`     | `num`     | `convNum()`    |
| `int`     | `BigInt`  | `convBigInt()` |
| `int`     | `String`  | `convString()` |
| `int`     | `bool`    | `convBool()`   |
| `double`  | `int`     | `convInt()`    |
| `double`  | `num`     | `convNum()`    |
| `double`  | `BigInt`  | `convBigInt()` |
| `double`  | `String`  | `convString()` |
| `double`  | `bool`    | `convBool()`   |
| `num`     | `int`     | `convInt()`    |
| `num`     | `double`  | `convDouble()` |
| `num`     | `BigInt`  | `convBigInt()` |
| `num`     | `String`  | `convString()` |
| `num`     | `bool`    | `convBool()`   |
| `BigInt`  | `int`     | `convInt()`    |
| `BigInt`  | `double`  | `convDouble()` |
| `BigInt`  | `num`     | `convNum()`    |
| `BigInt`  | `String`  | `convString()` |
| `BigInt`  | `bool`    | `convBool()`   |
| `bool`    | `int`     | `convInt()`    |
| `bool`    | `double`  | `convDouble()` |
| `bool`    | `num`     | `convNum()`    |
| `bool`    | `BigInt`  | `convBigInt()` |
| `bool`    | `String`  | `convString()` |
| `String`  | `int?`    | `convInt()`    |
| `String`  | `double?` | `convDouble()` |
| `String`  | `num?`    | `convNum()`    |
| `String`  | `BigInt?` | `convBigInt()` |
| `String`  | `bool`    | `convBool()`   |

#### Try Valid Conversions
Where `T` is any type in the current column.

| From Types | 
|------------|
| `int` |
| `double` |
| `num` |
| `BigInt` |
| `bool` |
| `String` |
| `Iterable<T>` |

| To Types | 
|------------|
| `int` |
| `double` |
| `num` |
| `BigInt` |
| `bool` |
| `String` |



[tap]: https://crates.io/crates/tap