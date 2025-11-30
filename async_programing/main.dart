/**
 * Async programing is running not blocking in block of code
*/

Future<void> main(List<String> args) async {
  print("--------- Program is start running ----------");
  await runAllAsyncFunction();
  print("--------- Program is end ----------");
}

Future<void> runAllAsyncFunction() async {
  await getClasses(3);
   getAllStudentProfile(2);
   getAllStudentSchedule(1);
  // Do something sequential:
  for (int i = 0; i < 10; i++) {
    final startTime = DateTime.now();
    print(" Time: $startTime Doing main thread work $i");
  }
  // Async Task
}

Future<void> getClasses(int sec) async {
  final startTime = DateTime.now();
  print("Time: $startTime Loading Classes...!");
  // Simulate calling API
  await Future.delayed(Duration(seconds: sec));
  print("Get Classes Success in $sec s");
}

Future<void> getAllStudentProfile(int sec) async {
  final startTime = DateTime.now();
  print("Time: $startTime Loading Student Profile...!");
  // Simulate calling API
  await Future.delayed(Duration(seconds: sec));
  print("Get Student Profile Success in $sec s");
}

Future<void> getAllStudentSchedule(int sec) async {
  final startTime = DateTime.now();
  print("Time: $startTime Loading  Student Schedule...!");
  // Simulate calling API
  await Future.delayed(Duration(seconds: sec));
  print("Get Student Schedule Success in $sec s");
}
