/**
 * 
Exercise: The "Apple Boxer" Challenge
Scenario: You are an apple farmer. You have picked a large pile of apples, and you need to pack them into boxes to sell.

You have 47 apples.

Each box fits exactly 8 apples.

The Goal: Write a program to calculate:

How many full boxes can you sell?

How many loose apples (leftovers) do you have to keep for yourself?
 * 
 * 
*/

/**
 * Expectec output

I have 47 apples.
I can fill 5 boxes.
I will have 7 apples left over.
*
*/


void main() {
  // 1. Define the data
  int totalApples = 47;
  int boxCapacity = 8;

  // 2. Perform the math
  int fullBoxes = totalApples ~/ boxCapacity; // Integer Division
  int leftOver = totalApples % boxCapacity;   // Modulo (Remainder)

  // 3. Display the result
  print('I have $totalApples apples.');
  print('I can fill $fullBoxes boxes.');
  print('I will have $leftOver apples left over.');
}