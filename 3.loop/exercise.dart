import 'dart:io';

void main() {
  // 1. Create a list to hold the items
  List<double> prices = [];

  print("--- Welcome to Smart Cashier ---");

  // 2. Loop forever until we manually break
  while (true) {
    stdout.write("Enter price (0 to finish): ");
    
    // Read and parse input
    String input = stdin.readLineSync()!;
    double price = double.parse(input);

    // CONTROL STATEMENT: BREAK
    // If price is 0, we are done. Stop the loop.
    if (price == 0) {
      print("Scanning finished.");
      break; 
    }

    // CONTROL STATEMENT: CONTINUE
    // If price is negative, it's a mistake. Skip this turn.
    if (price < 0) {
      print("Invalid price! Skipping...");
      continue; // Jumps back to 'stdout.write'
    }

    // If we get here, the price is valid. Add it.
    prices.add(price);
  }

  // 3. Calculate Total using FOR-IN
  double total = 0;
  
  print("\n--- Receipt ---");
  for (var p in prices) {
    print("Item: \$$p");
    total += p; // Short for: total = total + p;
  }

  print("----------------");
  print("Total to pay: \$$total");
}