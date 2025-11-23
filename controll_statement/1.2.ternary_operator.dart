/**
 * 
 * Ternary operator is short hand if else statment
 * 
*/

void main(List<String> args) {
  int batteryLevel = 50;
  String status = batteryLevel <= 20 ? "Low Battery" : "Battery is fine";
  print("Battery status: $status");
  print(
    "The user is ${status == "Battery is fine" ? "Able to continue" : "advice to charge"}",
  );
}
