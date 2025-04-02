# validifydart

A library that provides a wide range of validations in Flutter. It includes validations for personal
identifiers, email, URLs, numbers, financial data, and more.

## Features

- **Email, URL, and IP Validations:** Validate emails, URLs, and IPv6 addresses.
- **Personal Identifier Validations:** Validate PAN, Aadhaar, Passport, Driving License, Voter ID,
  SIN, and more.
- **Financial Validations:** Validate Credit Card numbers, GSTIN, IFSC, UPI IDs, Bitcoin, and
  Ethereum addresses.
- **Mathematical Checks:** Prime numbers, Fibonacci sequence, even/odd, and more.
- **Connectivity Checks:** Check if the device is connected to the internet or WiFi.
- **String Validations:** Check for alphabetic, alphanumeric, palindrome strings, password strength,
  and more.
- **Date Validations:** Check for valid date and time formats, and leap year checks.
- **Geographic Validations:** Validate latitude, longitude, and US ZIP codes.
- **File Format Validations:** Validate file extensions and ISBN-13 numbers.
- **Hex, Binary, UUID, MAC Address, and JSON Validations.**
- **Advanced Formats:** Validate semantic versions and VIN numbers.

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  validifydart: ^0.2.0
```

## Usage

To use `validifydart`, you can directly call its static validation methods like so:

### Example:

```dart
import 'package:validifydart/validifydart.dart';

Future<void> main() async {
// Validate Email
  bool isEmailValid = validifydart.isValidEmail("example@example.com");

// Validate Phone Number
  bool isPhoneValid = validifydart.isValidPhone("+1234567890");

// Check if number is prime
  bool isPrimeNumber = validifydart.isPrime(7);

// Check Internet Connectivity
  bool isConnected = await validifydart.isConnectedToInternet();
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

- **Advanced Personal Identifiers:**
    - Canadian SIN (Social Insurance Number)

- **Advanced Network:**
    - IPv4 address validation
    - Port number validation (0-65535)

- **Geographic:**
    - Latitude validation (-90 to 90)
    - Longitude validation (-180 to 180)

- **US ZIP code validation**

- **Advanced Financial:**
    - Bitcoin address validation
    - Ethereum address validation

- **File Formats:**
    - File extension validation
    - ISBN-13 validation

- **Security:**
    - Password strength validation

- **Miscellaneous:**
    - Semantic version number validation
    - VIN (Vehicle Identification Number) validation

## Contribution

Feel free to fork the repository, create pull requests, and contribute to the library. Please ensure
all tests are passing before submitting any changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
