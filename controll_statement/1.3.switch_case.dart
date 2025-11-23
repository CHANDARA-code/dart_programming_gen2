/*
*
A switch statement evalutes an expression and compares its value againts a series of case clouses.
it executes the code associated with the first match case. it's a cleaner and ofen more efficient
alternative to long if-else when checking a single variable againt multiple constant value.
*
*/

/*
*

switch(expression){
case value1:
break;
case value2:
break;
default:
break;
}

*
*/
enum EnumColor { green, yellow, red }

void main(List<String> args) {
  EnumColor enumColor = EnumColor.green; // GREEN, YELLOW, RED

  switch (enumColor) {
    case EnumColor.green:
      print("GO");
      break;
    case EnumColor.yellow:
      print("Slow down");
      break;
    case EnumColor.red:
      print("Stop");
      break;
  }

  int myScore = 65;

  print("My score is $myScore and my grade is ${getGrade(myScore)}");
}

String getGrade(int score) {
  String grade;
  switch (score) {
    case >= 90:
      grade = "Grade A";
      break;
    case >= 80:
      grade = "Grade B";
      break;
    case >= 70:
      grade = "Grade C";
      break;
    case >= 60:
      grade = "Grade D";
      break;
    case >= 50:
      grade = "Grade E";
      break;
    default:
      grade = "You are failed";
      break;
  }
  print("Swift case operation done with grade: $grade ");
  return grade;
}
