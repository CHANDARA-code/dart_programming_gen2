import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  print("--- 🛒 Reading Items... ---");

  final stopwatch = Stopwatch()..start();

  // 1. Fetch all products in PARALLEL
  // We get a List of Maps back (each map has title & price)

  // [
  //   {
  //     'title': name,
  //     'price': price,
  //   }
  //   ,
  //   .....
  //   {
  //     'title': name,
  //     'price': price,
  //   }
  // ];
  List<Map<String, dynamic>> cartItems = await Future.wait([
    fetchProduct(1),
    fetchProduct(5),
    fetchProduct(10),
  ]);

  print("CartItems: $cartItems");

  // 2. Print the List of Products
  print("\n--- 📦 YOUR CART ---");

  /**
   * Explain function reduce in dart: 
   * list = [1,2,3,4] 
   * list.reduce
  */

  var list = [1, 2, 3, 4];
  var listString = ["Hello", "World", "Peace"];
  var singleValue = list.reduce((previous, current) => previous + current);
  var singleValueString =
      listString.reduce((previous, current) => "$previous " + current);
  print("singleValue: $singleValue");
  print("singleValueString: $singleValueString");

  double total = 0.0;
  final mapPriceOfEachElement = cartItems.map((e) => e['price'] as num);
  final totalWithReduce = mapPriceOfEachElement.reduce((p, v) => p + v);
  print("💰 GRAND TOTAL WITH REDUCE: \$${totalWithReduce.toStringAsFixed(2)}");

  for (var item in cartItems) {
    // Print details
    print("• ${item['title']}");
    print("  Price: \$${item['price']}\n");

    // Add to total
    total += item['price'];
  }

  // 3. Execute Checkout
  print("----------------------");
  print("✅ CHECKOUT COMPLETE");
  print("💰 GRAND TOTAL: \$${total.toStringAsFixed(2)}");

  stopwatch.stop();
  print("\n(Process finished in ${stopwatch.elapsed.inMilliseconds}ms)");
}

// Helper: Fetches Title and Price
Future<Map<String, dynamic>> fetchProduct(int id) async {
  final url = Uri.parse('https://fakestoreapi.com/products/$id');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print("response.body: ${response.body}");
      // {"id":5,"title":"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet","price":695,"description":"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.","category":"jewelery","image":"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png","rating":{"rate":4.6,"count":400}}
      final jsonMap = json.decode(response.body);
      // {id: 5, title: John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet, price: 695, description: From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection., category: jewelery, image: https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png, rating: {rate: 4.6, count: 400}}
      // print("jsonMap: ${jsonMap}");

      // Return a Map with just the info we need
      return {
        'title': jsonMap['title'],
        // Safety: Ensure price is a double
        'price': (jsonMap['price'] as num).toDouble(),
      };
    } else {
      return {'title': 'Unknown Item', 'price': 0.0};
    }
  } catch (e) {
    return {'title': 'Error Loading', 'price': 0.0};
  }
}
