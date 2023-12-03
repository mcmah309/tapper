# Tap

Provides extension methods on all types to allow temporary, inspection/mutation (tap),
transformation (pipe), and safe type conversion without casting (conv).

## Valid Conversions

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