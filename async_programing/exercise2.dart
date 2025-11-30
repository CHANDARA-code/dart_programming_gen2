import 'dart:io';

// 1. Change main to return Future<void> and mark as async
Future<void> main() async {
  List<double> expenses = [];

  print("--- CLOUD WALLET MANAGER (Async Mode) ---");

  while (true) {
    stdout.write("\nCommand (add, undo, list, exit): ");
    String? command = stdin.readLineSync();

    switch (command) {
      case 'add':
        stdout.write("Enter amount: \$");
        String input = stdin.readLineSync()!;
        double amount = double.parse(input);

        // --- ASYNC CHANGE HERE ---
        // We simulate a network call. The program must 'await' 
        // for the data to be saved before asking for the next command.
        await saveToDatabase(amount); 
        
        expenses.add(amount); 
        break;

      case 'undo':
        if (expenses.isNotEmpty) {
          double removed = expenses.removeLast();
          print("Removing from server...");
          // We can simulate a small delay here too for consistency
          await Future.delayed(Duration(milliseconds: 500)); 
          print("Removed \$$removed");
        } else {
          print("Nothing to undo!");
        }
        break;

      case 'list':
        print("--- Fetching Current Items ---");
        
        // --- ASYNC CHANGE HERE ---
        // Instead of showing the list instantly, we simulate a loading delay.
        await loadFromDatabase();
        
        for (var expense in expenses) {
          print("\$$expense");
        }
        break;

      case 'exit':
        print("Syncing final data...");
        // Simulate one last sync before closing
        await Future.delayed(Duration(seconds: 1)); 
        
        gotoSummary(expenses);
        return; 

      default:
        print("Unknown command. Try again.");
    }
  }
}

// --- MOCK API FUNCTIONS (The "Server") ---

// Simulates saving data to a slow server (1.5 seconds)
Future<void> saveToDatabase(double amount) async {
  stdout.write("Saving to cloud..."); // UX: Tell user something is happening
  
  await Future.delayed(Duration(milliseconds: 1500)); // The "Wait"
  
  print(" Done! (Saved \$$amount)");
}

// Simulates fetching data (1 second)
Future<void> loadFromDatabase() async {
  stdout.write("Loading data...");
  
  await Future.delayed(Duration(seconds: 1)); // The "Wait"
  
  print(" Done!");
}

// (Helper remains standard synchronous code, as math is usually instant)
void gotoSummary(List<double> data) {
  print("\n--- FINAL CLOUD SUMMARY ---");
  double total = 0;
  for (var item in data) {
    total += item;
  }
  print("Total Spent: \$$total");
  String status = (total > 500) ? "⚠️ Over Budget!" : "✅ Within Budget";
  print("Status: $status");
}