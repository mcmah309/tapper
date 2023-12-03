# Tapper

Provides extension methods on all types to allow temporary, inspection/mutation (tap),
transformation (pipe), and safe type conversion without casting (conv).

Based on the Rust crate with a similar name [tap].

## Tap

The `Tap` extension allows you to perform an operation on an object and then return the original object. It's useful for
debugging or performing side effects.

Example:

```dart

int number = 10;
number = number.tap
(
(n) => print("The number is $n")
);
// Prints: The number is 10
// number remains 10
```

## Pipe

The Pipe extension lets you transform an object using a provided function and returns the transformed object.

Example:

```dart

String greeting = "Hello";
String excitedGreeting = greeting.pipe((g) => g.toUpperCase() + "!!!");
// excitedGreeting is now "HELLO!!!"
```

## Conv

The Conv extension is used for type conversion. You can convert an object from one type to another, handling cases where
the conversion is not possible.

Example:

```dart

String numericString = "123";
int number = numericString.convInt(); // convInt exists for this type
// number is now 123

dynamic nonNumericString = "abc";
Result<int, ConvException> result = nonNumericString.tryConv<int>();
// conversion is not possible and handled with Result
```

### Valid Conversions

There also exists `tryConv` for dynamic inputs and concrete output.

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

[tap]:(https://crates.io/crates/tap)