// Task 2: Async Calculator App
// Name: Getamesay Hailemichael
// Student ID: ATE/5152/13

import 'dart:async';

class Calculator {

  final String name;

  // Constructor
  Calculator(this.name);

  // Addition
  double add(double a, double b) {
    return a + b;
  }

  // Subtraction
  double subtract(double a, double b) {
    return a - b;
  }

  // Multiplication
  double multiply(double a, double b) {
    return a * b;
  }

  // Division with error handling
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero.");
    }

    return a / b;
  }

  // Asynchronous computation
  Future<double> computeAsync(double a, double b, String op) async {

    double result;

    switch (op) {
      case 'add':
        result = add(a, b);
        break;

      case 'subtract':
        result = subtract(a, b);
        break;

      case 'multiply':
        result = multiply(a, b);
        break;

      case 'divide':
        result = divide(a, b);
        break;

      default:
        throw ArgumentError("Unknown operation: $op");
    }

    // Simulate delay
    await Future.delayed(Duration(milliseconds: 1500));

    return result;
  }

  // Display result with try-catch
  Future<void> displayResult(double a, double b, String op) async {

    try {
      final result = await computeAsync(a, b, op);
      print("$op($a, $b) = $result");

    } catch (e) {
      print("Error: $e");
    }
  }
}

Future<void> main() async {

  final calc = Calculator("MyCalculator");

  print("--- ${calc.name} ---");

  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');
  await calc.displayResult(10, 0, 'divide');

  print("All calculations complete.");
}


/*
================================================
Conceptual Questions
================================================

Q6. What is the difference between synchronous and asynchronous functions?

A synchronous function executes one instruction at a time and blocks
the program until the task is completed.

An asynchronous function allows the program to continue running while
waiting for a long operation to finish.

In this calculator, divide() is synchronous because it performs a quick
mathematical operation. computeAsync() is asynchronous because it uses
Future.delayed() to simulate a delay like a network request.


Q7. What is the purpose of await?

The await keyword pauses execution of an async function until the Future
completes and returns its result.

If await is not used, the program will return a Future object instead of
the final result. The output would show something like:

Instance of 'Future<double>'


Q8. What is the purpose of try-catch?

The try-catch block is used to handle runtime errors safely.

If an exception occurs, the catch block captures it and prints an error
message instead of crashing the program.

Without try-catch, dividing by zero would terminate the program.


Q9. Why throw ArgumentError in divide()?

Throwing an ArgumentError informs the calling function that an invalid
argument was provided.

Returning 0 would hide the error and could produce incorrect results.
Throwing an exception follows good programming practices by allowing
errors to be handled properly.


Q10. Why make main() async?

The async keyword allows the main() function to use await when calling
asynchronous methods.

Without async, we would not be able to use await and would need to use
Future.then(), which is harder to read and maintain.
*/
