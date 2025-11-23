void main() {
  // 1. Initialize
  List<String> features = [];

  // 2. Add Elements
  // We can add them one by one, or use addAll
  features.add('Dark Mode');
  features.add('Push Notifications');
  features.add('Chat Support');
  
  print("Original list: $features");

  // 3. Insert at specific index (The CEO Request)
  features.insert(0, 'Login Screen');
  print("After CEO update: $features");

  // 4. Remove Element
  features.remove('Chat Support');
  print("After removing Chat: $features");

  // 5. Sort the list
  features.sort(); 
  print("Final Sorted List: $features");

  print("-------------------");

  // 6. Report properties
  // Note: We use .first and .last property
  if (features.isNotEmpty) {
    print("Priority Task: ${features.first}");
    print("Last Task: ${features.last}");
    print("Total Tasks: ${features.length}");
  }
}