
# validifyDart

A library that provides a wide range of validations in Flutter. It includes validations for personal identifiers, email, URLs, numbers, financial data, and more.

## Features

- **Email, URL, and IP Validations:** Validate emails, URLs, and IPv6 addresses.
- **Personal Identifier Validations:** Validate PAN, Aadhaar, Passport, Driving License, Voter ID, and more.
- **Financial Validations:** Validate Credit Card numbers, GSTIN, IFSC, and UPI IDs.
- **Mathematical Checks:** Prime numbers, Fibonacci sequence, even/odd, and more.
- **Connectivity Checks:** Check if the device is connected to the internet or WiFi.
- **String Validations:** Check for alphabetic, alphanumeric, and palindrome strings, and more.
- **Date Validations:** Check for valid date and time formats, and leap year checks.
- **Hex, Binary, UUID, and MAC Address Validations.**
- **JSON Validation:** Check if a string is a valid JSON.


## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  validifyDart: ^0.1.2
```

## Usage

To use `validifyDart`, you can directly call its static validation methods like so:

### Example:

```dart
import 'package:validifyDart/validifyDart.dart';

Future<void> main() async {
// Validate Email
  bool isEmailValid = validifyDart.isValidEmail("example@example.com");

// Validate Phone Number
  bool isPhoneValid = validifyDart.isValidPhone("+1234567890");

// Check if number is prime
  bool isPrimeNumber = validifyDart.isPrime(7);

// Check Internet Connectivity
  bool isConnected = await validifyDart.isConnectedToInternet();
}
```

## Validations Provided:

- **Personal Identifiers:**
    - Aadhaar
    - PAN
    - SSN
    - Passport
    - Driving License
    - Voter ID
    - EIN
    - IBAN

- **Email & URL Validations:**
    - Email format
    - URL format
    - IPv6 format
    - Subdomain validity

- **Internet & WiFi Connectivity:**
    - Check internet connection
    - Check WiFi connection

- **Mathematical Validations:**
    - Prime number check
    - Fibonacci number check
    - Even/Odd check
    - Divisibility check
    - Square number check

- **Financial Validations:**
    - Credit card validity
    - GSTIN format
    - IFSC code format
    - UPI ID format
    - Currency code format
    - ISIN format
    - CUSIP format
    - MIC format

- **String Validations:**
    - Alphabetic check
    - Alphanumeric check
    - Palindrome check
    - Case checks (Uppercase/Lowercase)
    - Numeric presence check
    - Length checks (Min/Max)

- **Other Validations:**
    - Hex color code validity
    - Binary validity
    - Markdown syntax validity
    - MAC address validity
    - UUID validity
    - JSON validity

## Contribution

Feel free to fork the repository, create pull requests, and contribute to the library. Please ensure all tests are passing before submitting any changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
