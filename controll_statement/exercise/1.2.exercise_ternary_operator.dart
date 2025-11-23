import 'dart:io';

void main() {
  stdout.write("How much money did you spend today? \$");

  String userInput = stdin.readLineSync()!;
  int spending = int.parse(userInput);

  // The Logic: Nested Ternary Operator
  // Read it as: "Is it >= 500? If yes 'VIP'. If no, ask the next question..."

  String status = (spending >= 500)
      ? 'VIP'
      : (spending >= 200)
      ? 'Gold'
      : (spending >= 100)
      ? 'Silver'
      : 'Regular';

  print('--------------------------');
  print('You spent: \$$spending');
  print('Your Status: $status');
}
