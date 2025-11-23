void main(List<String> args) {
  /**
   * 
  Basic Operators

Operators are special symbols used to perform operations. The most common are arithmetic operators 9:
+ (Addition)
- (Subtraction)
* (Multiplication)
/ (Division, always results in a double)
~/ (Integer Division, results in an int)
% (Modulo, gives the remainder of a division)
* 
  */

  print("List<String> $args");
  print("first args: ${args[0]}");
  print("second args: ${args[1]}");

  int a = 10;
  int b = 3;
  int sum = a + b;
  int difference = a - b;
  int integreDivision = a ~/ b;
  int remainder = a % b;
  double division = a / b;

  print('The sum of $a and $b is $sum');
  print('The differenct of $a and $b is $difference');

  print(
    'when you divided $a by $b, the integer result is $integreDivision with  a remainder of $remainder',
  );
  print("divsion a of b is $division");
}
