import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  final stopwatch = Stopwatch()..start();
  Map<String, dynamic> product = {};

  print("--- App Starting ---");

  // The blocking execution
  product = await getProduct();

  print("product: $product");
  print("product: id: ${product['id']}");
  print("product: title: ${product['title']}");

  final schoolNew = fetchSchoolNews(); // Takes 3 seconds
  final schoolNewValue = await schoolNew;
  print("School New Vavle: $schoolNewValue");
  await fetchUserData(); // Takes 2 seconds
  await fetchWeather(); // Takes 3 seconds

  stopwatch.stop();
  print("stopwatch isRunning: ${stopwatch.isRunning}");
  print("stopwatch instance: ${stopwatch.elapsed}");
  print("--- App Loaded in ${stopwatch.elapsed.inSeconds} seconds ---");
}

// Mock API Functions
Future<String> fetchSchoolNews() async {
  await Future.delayed(Duration(seconds: 3)); // Calling Api
  print("✔ News Loaded");
  return "News Data";
}

Future<Map<String, dynamic>> getProduct() async {
  print("Loading product...");
  final url = 'https://fakestoreapi.com/products/1';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print("Get Product Success");
    return json.decode(response.body) as Map<String, dynamic>;
  } else {
    print("Cannot Get Product");
    throw Exception('Failed to fetch product');
  }
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 2));
  print("✔ User Data Loaded");
  return "User Data";
}

Future<String> fetchWeather() async {
  await Future.delayed(Duration(seconds: 3));
  print("✔ Weather Loaded");
  return "Weather Data";
}
