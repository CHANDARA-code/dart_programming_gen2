/*
Control flow statements allow you to manage the order in which your progrma's code
is executedd. the most fundamental desision-making tool is the if statment. it executed a 
block of code only in if a specified condition evaluates to true.
*/

/*
if(condition){
Code runs only if 'condition' is true
}

if(condition){
run if 'condition' is true
}else{
run if 'condition' is false
}

*/

/**
 * 
 * ##### Logical Operators
 * 
*/

/*
And(&&): Return true only if both conditions are true.
e.g: if (isLoggedIn && isAdmini) {}


OR(||): Return true if at least one of the condition is true.

e.g: if(isWeekend || isHoliday){}


NOT(!): inverts a boolean value. !true becomes false and !false become true

if(!isRaining){}

*/

import 'dart:io';

void main(List<String> args) {
  int ageInputArgs;
  stdout.write("Input your age: ");
  String? ageInputString = stdin.readLineSync();
  if (ageInputString == null) {
    throw Exception("Input must be not null");
  }
  ageInputArgs = int.parse(ageInputString);
  if (ageInputArgs >= 18) {
    print("You are eligible to vote");
  } else {
    print("You are not eligible to vote yet");
  }
}
