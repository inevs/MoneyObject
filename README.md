# MoneyObject

## Introduction
A Swift Library for dealing with money. It is inspired by this [Ruby Library](https://github.com/RubyMoney/money)
## Features
Provides a Money struct which encapsulates all information about an certain amount of money, such as its value and its currency.

Provides a Currency struct which encapsulates all information about a monetary unit.

Represents monetary values as integers, in cents. This avoids floating point rounding errors. The cents is the minor currency value. It currently does not support currencies with other exponents than 2 (see [Wikipedia ISO 4217](https://en.wikipedia.org/wiki/ISO_4217))
