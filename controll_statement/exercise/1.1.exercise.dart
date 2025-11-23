import 'dart:io'; // 1. Don't forget to import this!

void main() {
  // 2. Ask the question
  stdout.write("How much money did you spend today? \$");

  // 3. Read input and convert to Integer
  // We use '!' to promise we won't give an empty value
  String userInput = stdin.readLineSync()!;
  int spending = int.parse(userInput);

  String status;

  // 4. The Logic (Order matters!)
  if (spending >= 500) {
    status = 'VIP';
  } else if (spending >= 200) {
    status = 'Gold';
  } else if (spending >= 100) {
    status = 'Silver';
  } else {
    status = 'Regular';
  }

  // 5. Show the result
  print('--------------------------');
  print('You spent: \$$spending');
  print('Your Status: $status');
}