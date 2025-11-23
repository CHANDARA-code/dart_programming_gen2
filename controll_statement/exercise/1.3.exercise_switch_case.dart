import 'dart:io';

void main() {
  stdout.write("How much money did you spend today? \$");

  String userInput = stdin.readLineSync()!;
  int spending = int.parse(userInput);

  String status;

  // The Logic: Switch with Pattern Matching
  // Dart checks these from TOP to BOTTOM.
  switch (spending) {
    case >= 500:
      status = 'VIP';
    case >= 200:
      status = 'Gold';
    case >= 100:
      status = 'Silver';
    default:
      status = 'Regular';
  }

  print('--------------------------');
  print('You spent: \$$spending');
  print('Your Status: $status');
}
