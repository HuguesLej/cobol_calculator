# cobol_calculator

A simple calculator coded in COBOL.

It allows you to perform basic operations such as:
- `+` (add)
- `-` (subtract)
- `*` (multiply)
- `**` (exponent)
- `/` (divide)
- `%` (modulo)

All real numbers can be used as long as they have no more than 10 digits before the decimal point and no more than 10 digits after the decimal point.

The result can not have more than 20 digits before the decimal point and more than 10 digits after the decimal point.

Note: The use of `COMPUTE` statement is voluntarily avoided to perform operations.

## How to use

First, you need to download a Cobol compilator such as [GnuCOBOL](https://gnucobol.sourceforge.io/).

Compile the program. Here is an example using GnuCOBOL.
```
cobc -x CALCULATOR.cbl
```
Run the program and follow instructions.
```
./CALCULATOR
```
