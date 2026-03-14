# Reflection

QR1
The most difficult concept for me was async and await. At first I did
not understand why the program pauses before printing results. After
experimenting with Future.delayed() and removing await, I saw that the
program prints a Future object instead of the result. This helped me
understand that await waits for the asynchronous task to finish.

QR2
To change the program to List<double>, several parts would need to
change including the list declaration, function parameter types, and
return types. This shows how important it is to carefully choose data
types when designing a program.

QR3
In a real Flutter application, asynchronous operations are used when
fetching data from a server API. For example, a weather app may request
weather data from the internet. The Future would resolve to JSON data
containing weather information, and the UI would show a loading
indicator while waiting.

QR4
Using separate functions like add(), subtract(), multiply(), and divide()
improves readability and organization. However, a single function with
an operation parameter can reduce repetition. Both approaches have
advantages depending on the complexity of the program.
