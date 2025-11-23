/**
 * 
 * Loop is control flow structure that you can execute a block of code 
 * repeatedly. Dart offer server types of loops, each suited for different scenarios
 * 
*/

/*
*

for(initializtion; condition; update){
}

e.g: for(int i =0;i < 100; i ++){
}



For-in Loop

for (var item in collection){
}

While Loop


while(condition){
}



Do while Loop

do{
execute the block code right here
}while(condition);


Loop Control Statement: break and continue

break: immediately terminates the innermost loop it's in. Execution continue at the statement following the loop.

continue: Skips the rest of the current iteration and jumps to the next iteration of the loop. the loop's condition
is re-evaluted (for while and do-while) or the update expression is run (for for-loops)
*
*/

void main(List<String> args) {
  /**
   * 
   * For loop
  */
  for (int i = 1; i <= 5; i++) {
    print("Number: $i");
  }

  /**
 * 
 * For in loop
*/
  var fruits = ['Apple', 'Orange'];
  for (var fruit in fruits) {
    print("$fruit fruit");
  }

  /**
   *  While loop
  */

  int countDown = 3;
  while (countDown > 0) {
    print("Countdown: $countDown");
    countDown--;
  }

  /**
   * Do While loop
  */
  int number = 10;
  do {
    print("This will print at least once. Number is $number");
    number--;
  } while (number > 5);
  {
    print("Done!(do-while-loop)");
  }

  /**
   * 
   * Loop Controll Statement
  */

  /*
 ## Using break;
 */

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print("Found 5 exiting loop operation");
      break;
    }
    print(i);
  }

  /**
   * # Using continue
  */

  for (int i = 1; i <= 5; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print("Odd Number: $i");
  }
}
