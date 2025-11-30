import 'dart:io';

void main() {
  // 1. Initialize our database (List)
  List<double> expenses = [];
  
  print("--- WALLET MANAGER ---");

  // 2. The Main Application Loop
  while (true) {
    stdout.write("\nCommand (add, undo, list, exit): ");
    String? command = stdin.readLineSync();

    // 3. Logic Control (Switch)
    switch (command) {
      case 'add':
        stdout.write("Enter amount: \$");
        String input = stdin.readLineSync()!;
        double amount = double.parse(input);
        
        // List Operation: Add
        expenses.add(amount); 
        print("Added \$$amount");
        break; // Breaks the switch, not the while loop

      case 'undo':
        // Logic: Check if safe to remove
        if (expenses.isNotEmpty) {
          double removed = expenses.removeLast(); // List Operation: Remove Last
          print("Removed \$$removed");
        } else {
          print("Nothing to undo!");
        }
        break;

      case 'list':
        print("--- Current Items ---");
        // Loop: For-in to read data
        for (var expense in expenses) {
          print("\$$expense");
        }
        break;

      case 'exit':
        print("Closing app...");
        // 4. Break the Infinite Loop
        gotoSummary(expenses); // (See helper function below)
        return; // Exits the 'main' function entirely

      default:
        print("Unknown command. Try again.");
    }
  }
}

// I moved the final calculation here to keep main() clean
void gotoSummary(List<double> data) {
  print("\n--- FINAL SUMMARY ---");
  
  double total = 0;
  
  // Math: Calculate sum
  for (var item in data) {
    total += item;
  }

  print("Total Spent: \$$total");

  // Logic: Ternary Operator for Status
  String status = (total > 500) ? "⚠️ Over Budget!" : "✅ Within Budget";
  print("Status: $status");
}