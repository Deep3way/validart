import 'package:validifydart/validify_dart.dart';

Future<void> main() async {
  print(ValidifyDart.isValidEmail("rudradeep@gmail.com")); // true
  print(ValidifyDart.isConnectedToInternet()); // true

// Validating phone number
  bool isPhoneValid = ValidifyDart.isValidPhone('+1234567890');

// Validating Aadhaar number
  bool isAadhaarValid = ValidifyDart.isValidAadhaar('123456789012');

// Checking if connected to the internet
  bool isConnected = await ValidifyDart.isConnectedToInternet();

// Checking if a number is prime
  bool isPrime = ValidifyDart.isPrime(7);

// Validating email
  bool isEmailValid = ValidifyDart.isValidEmail('rudradeep@gmail.com');
}
