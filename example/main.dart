import 'package:validifyDart/validifyDart.dart';

Future<void> main() async {
  print(validifyDart.isValidEmail("rudradeep@gmail.com"));  // true
  print(validifyDart.isConnectedToInternet());  // true/falseimport 'package:validifyDart/validifyDart.dart';

// Validating phone number
  bool isPhoneValid = validifyDart.isValidPhone('+1234567890');

// Validating Aadhaar number
  bool isAadhaarValid = validifyDart.isValidAadhaar('123456789012');

// Checking if connected to the internet
  bool isConnected = await validifyDart.isConnectedToInternet();

// Checking if a number is prime
  bool isPrime = validifyDart.isPrime(7);

// Validating email
  bool isEmailValid = validifyDart.isValidEmail('rudradeep@gmail.com');

}
