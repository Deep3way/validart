library validifydart;

import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class that provides various methods for validation
/// such as phone numbers, email, URLs, financial data, and more.
class ValidifyDart {
  // == Phone Number Identifiers ==
  /// Validates an international phone number.
  /// The phone number can start with a plus sign followed by country code and digits.
  /// Example: "+14155552671".
  static bool isValidPhone(String? phone) {
    if (phone == null || phone.isEmpty) return false;
    const regex = r"^\+?[1-9]\d{1,14}$";
    return RegExp(regex).hasMatch(phone);
  }

  // == Personal Identifiers ==

  /// Validates an Aadhaar number (India's national identity number).
  /// The Aadhaar number must be a 12-digit numeric value.
  static bool isValidAadhaar(String aadhaar) =>
      RegExp(r'^\d{12}$').hasMatch(aadhaar);

  /// Validates a PAN (Permanent Account Number) card.
  /// PAN format is 5 letters, 4 digits, and 1 letter (e.g., ABCDE1234F).
  static bool isValidPAN(String pan) =>
      RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(pan);

  /// Validates a Social Security Number (SSN).
  /// The SSN format is three digits, two digits, and four digits (e.g., 123-45-6789).
  static bool isValidSSN(String ssn) =>
      RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(ssn);

  /// Validates a passport number.
  /// The passport number starts with one letter followed by seven digits.
  static bool isValidPassport(String passport) =>
      RegExp(r'^[A-Z]{1}[0-9]{7}$').hasMatch(passport);

  /// Validates a driving license number.
  /// The format is two uppercase letters followed by 13 digits.
  static bool isValidDrivingLicense(String license) =>
      RegExp(r'^[A-Z]{2}[0-9]{13}$').hasMatch(license);

  /// Validates a voter ID.
  /// The format is three uppercase letters followed by seven digits (e.g., ABC1234567).
  static bool isValidVoterID(String voterId) =>
      RegExp(r'^[A-Z]{3}[0-9]{7}$').hasMatch(voterId);

  /// Validates an Employer Identification Number (EIN).
  /// The format is two digits, a hyphen, and seven digits (e.g., 12-3456789).
  static bool isValidEIN(String ein) => RegExp(r'^\d{2}-\d{7}$').hasMatch(ein);

  /// Validates an International Bank Account Number (IBAN).
  /// IBAN can range from 15 to 34 alphanumeric characters.
  static bool isValidIBAN(String iban) =>
      RegExp(r'^[A-Z0-9]{15,34}$').hasMatch(iban);

  // == Email & URLs ==

  /// Validates an email address.
  /// The email format includes alphanumeric characters, followed by an @ symbol,
  /// and a valid domain.
  static bool isValidEmail(String email) =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(email);

  /// Validates a URL.
  /// The URL must start with http or https followed by a valid domain.
  static bool isValidUrl(String url) =>
      RegExp(r'^(http|https):\/\/[^\s/$.?#].[^\s]*$').hasMatch(url);

  /// Validates an IPv6 address.
  /// The format follows the IPv6 standard for address representation.
  static bool isValidIPv6(String ip) =>
      RegExp(r'^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$').hasMatch(ip);

  /// Validates if a URL contains a valid subdomain.
  /// The URL must contain subdomains and a valid domain extension.
  static bool hasValidSubdomain(String url) =>
      RegExp(r'^[a-zA-Z0-9]+:\/\/[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,})$')
          .hasMatch(url);

  // == Internet & WiFi ==

  /// Checks if the device is connected to the internet.
  /// Returns true if connected to any network (WiFi or mobile data).
  static Future<bool> isConnectedToInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    // Changed comparison to handle List<ConnectivityResult> in newer versions
    return connectivityResult.isNotEmpty &&
        connectivityResult != [ConnectivityResult.none];
  }
  /// Checks if the device is connected to WiFi.
  /// Returns true if connected to a WiFi network.
  static Future<bool> isConnectedToWiFi() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    // Changed to handle List<ConnectivityResult>
    return connectivityResult.contains(ConnectivityResult.wifi);
  }

  // == Numbers ==

  /// Checks if the number is even.
  static bool isEven(int number) => number % 2 == 0;

  /// Checks if the number is odd.
  static bool isOdd(int number) => number % 2 != 0;

  /// Checks if the number is prime.
  /// A prime number is greater than 1 and has no divisors other than 1 and itself.
  static bool isPrime(int number) {
    if (number <= 1) return false;
    for (var i = 2; i <= sqrt(number).toInt(); i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  /// Checks if the number is positive.
  static bool isPositive(num value) => value > 0;

  /// Checks if the number is negative.
  static bool isNegative(num value) => value < 0;

  /// Checks if the value is within the specified range.
  static bool isInRange(num value, num min, num max) =>
      value >= min && value <= max;

  /// Checks if the number is divisible by the given divisor.
  static bool isDivisibleBy(int number, int divisor) => number % divisor == 0;

  /// Checks if the number is a perfect square.
  static bool isSquareNumber(int number) =>
      sqrt(number).toInt() * sqrt(number).toInt() == number;

  /// Checks if the number is a Fibonacci number.
  static bool isFibonacci(int number) {
    int a = 0, b = 1, temp;
    while (b < number) {
      temp = a;
      a = b;
      b = temp + b;
    }
    return b == number || number == 0;
  }

  // == Financial ==

  /// Validates a credit card number using the Luhn algorithm.
  /// Returns true if the credit card number is valid.
  static bool isValidCreditCard(String number) {
    var sum = 0;
    var alternate = false;
    for (var i = number.length - 1; i >= 0; i--) {
      var n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  /// Validates a GSTIN (Goods and Services Tax Identification Number).
  /// GSTIN format: 15 alphanumeric characters in a specific pattern.
  static bool isValidGSTIN(String gstin) =>
      RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[A-Z0-9]{1}Z[A-Z0-9]{1}$')
          .hasMatch(gstin);

  /// Validates an IFSC (Indian Financial System Code).
  /// IFSC format: Four uppercase letters followed by zero and six alphanumeric characters.
  static bool isValidIFSC(String ifsc) =>
      RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(ifsc);

  /// Validates a UPI ID (Unified Payments Interface ID).
  static bool isValidUPIID(String upiId) =>
      RegExp(r'^[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}$').hasMatch(upiId);

  /// Validates a 3-letter currency code (e.g., USD, EUR).
  static bool isValidCurrencyCode(String code) =>
      RegExp(r'^[A-Z]{3}$').hasMatch(code);

  /// Validates an ISIN (International Securities Identification Number).
  /// ISIN format: Two letters, followed by nine alphanumeric characters, and a single digit.
  static bool isValidISIN(String isin) =>
      RegExp(r'^[A-Z]{2}[A-Z0-9]{9}[0-9]$').hasMatch(isin);

  /// Validates a CUSIP (Committee on Uniform Securities Identification Procedures).
  static bool isValidCUSIP(String cusip) =>
      RegExp(r'^[A-Z0-9]{9}$').hasMatch(cusip);

  /// Validates an MIC (Market Identifier Code).
  static bool isValidMIC(String mic) => RegExp(r'^[A-Z]{4}$').hasMatch(mic);

  // == Strings ==

  /// Validates if the value contains only alphabetic characters.
  static bool isAlphabetic(String value) =>
      RegExp(r'^[a-zA-Z]+$').hasMatch(value);

  /// Validates if the value contains only alphanumeric characters.
  static bool isAlphanumeric(String value) =>
      RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);

  /// Checks if the value is a palindrome.
  static bool isPalindrome(String value) =>
      value == value.split('').reversed.join();

  /// Checks if the string has a minimum length.
  static bool hasMinLength(String value, int minLength) =>
      value.length >= minLength;

  /// Checks if the string has a maximum length.
  static bool hasMaxLength(String value, int maxLength) =>
      value.length <= maxLength;

  /// Checks if the string contains only whitespace.
  static bool containsOnlyWhitespace(String value) => value.trim().isEmpty;

  /// Checks if the string is in uppercase.
  static bool isUpperCase(String value) => value == value.toUpperCase();

  /// Checks if the string is in lowercase.
  static bool isLowerCase(String value) => value == value.toLowerCase();

  /// Checks if the string contains numeric digits.
  static bool containsNumeric(String value) => RegExp(r'\d').hasMatch(value);

  // == Dates ==

  /// Checks if the year is a leap year.
  static bool isLeapYear(int year) =>
      (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  /// Validates the date format (YYYY-MM-DD).
  static bool isValidDateFormat(String date) =>
      RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date);

  /// Validates the time format (HH:MM:SS).
  static bool isValidTimeFormat(String time) =>
      RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(time);

  // == Other ==

  /// Validates a hex color code (e.g., #FFFFFF, #000).
  static bool isValidHexColor(String color) =>
      RegExp(r'^#(?:[0-9a-fA-F]{3}){1,2}$').hasMatch(color);

  /// Validates if the value is a binary number (only 0 and 1).
  static bool isValidBinary(String value) => RegExp(r'^[01]+$').hasMatch(value);

  /// Validates Markdown syntax for headers, bold, and italic text.
  static bool isValidMarkdown(String markdown) =>
      RegExp(r'^(#+\s?.+|\*\*.+\*\*|__.+__)$').hasMatch(markdown);

  /// Validates a MAC (Media Access Control) address.
  static bool isValidMACAddress(String mac) =>
      RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$').hasMatch(mac);

  /// Validates a UUID (Universally Unique Identifier).
  static bool isValidUUID(String uuid) => RegExp(
          r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
      .hasMatch(uuid);

  /// Validates if the string is a valid JSON.
  static bool isValidJSON(String json) {
    try {
      jsonDecode(json);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isValidSIN(String sin) {
    final cleanSin = sin.replaceAll(RegExp(r'[\s-]'), '');
    return RegExp(r'^\d{9}$').hasMatch(cleanSin) && _validateSINChecksum(cleanSin);
  }

  static bool _validateSINChecksum(String sin) {
    if (sin.length != 9) return false;
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      int digit = int.parse(sin[i]);
      if (i % 2 == 1) {
        digit *= 2;
        sum += (digit > 9) ? digit - 9 : digit;
      } else {
        sum += digit;
      }
    }
    return sum % 10 == 0;
  }

  // == Advanced Network ==

  /// Validates an IPv4 address
  /// Format: Four octets separated by dots (e.g., 192.168.1.1)
  static bool isValidIPv4(String ip) {
    return RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(ip) &&
        ip.split('.').every((octet) => int.parse(octet) <= 255);
  }

  /// Validates a port number
  /// Range: 0-65535
  static bool isValidPort(int port) => port >= 0 && port <= 65535;

  // == Geographic ==

  /// Validates latitude value
  /// Range: -90 to 90 degrees
  static bool isValidLatitude(double lat) => lat >= -90 && lat <= 90;

  /// Validates longitude value
  /// Range: -180 to 180 degrees
  static bool isValidLongitude(double lon) => lon >= -180 && lon <= 180;

  /// Validates a ZIP code (US format)
  /// Format: 5 digits or 5+4 digits with hyphen (e.g., 12345 or 12345-6789)
  static bool isValidUSZipCode(String zip) =>
      RegExp(r'^\d{5}(-\d{4})?$').hasMatch(zip);

  // == Advanced Financial ==

  /// Validates a Bitcoin address (Base58Check format)
  static bool isValidBitcoinAddress(String address) =>
      RegExp(r'^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$').hasMatch(address);

  /// Validates an Ethereum address
  /// Format: 40 hexadecimal characters prefixed with 0x
  static bool isValidEthereumAddress(String address) =>
      RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(address);

  // == File Formats ==

  /// Validates a file extension
  static bool isValidFileExtension(String filename, List<String> validExtensions) {
    final ext = filename.split('.').last.toLowerCase();
    return validExtensions.contains(ext);
  }

  /// Validates an ISBN-13 number
  static bool isValidISBN13(String isbn) {
    final cleanIsbn = isbn.replaceAll(RegExp(r'[\s-]'), '');
    if (!RegExp(r'^\d{13}$').hasMatch(cleanIsbn)) return false;
    int sum = 0;
    for (int i = 0; i < 13; i++) {
      sum += int.parse(cleanIsbn[i]) * (i % 2 == 0 ? 1 : 3);
    }
    return sum % 10 == 0;
  }

  // == Security ==

  /// Validates password strength
  /// Requirements: 8+ chars, 1 uppercase, 1 lowercase, 1 number, 1 special char
  static bool isStrongPassword(String password) =>
      password.length >= 8 &&
          RegExp(r'[A-Z]').hasMatch(password) &&
          RegExp(r'[a-z]').hasMatch(password) &&
          RegExp(r'[0-9]').hasMatch(password) &&
          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

  // == Miscellaneous ==

  /// Validates a semantic version number
  /// Format: MAJOR.MINOR.PATCH (e.g., 1.2.3)
  static bool isValidSemVer(String version) =>
      RegExp(r'^\d+\.\d+\.\d+$').hasMatch(version);

  /// Validates a VIN (Vehicle Identification Number)
  /// Format: 17 alphanumeric characters
  /// Validates a VIN (Vehicle Identification Number).
  /// Format: 17 alphanumeric characters with a valid check digit (9th position).
  static bool isValidVIN(String vin) {
    if (!RegExp(r'^[A-HJ-NPR-Z0-9]{17}$').hasMatch(vin)) return false;

    // VIN character value mapping (A=1, B=2, ..., Z=26, excluding I, O, Q)
    const vinValues = {
      'A': 1, 'B': 2, 'C': 3, 'D': 4, 'E': 5, 'F': 6, 'G': 7, 'H': 8,
      'J': 1, 'K': 2, 'L': 3, 'M': 4, 'N': 5, 'P': 7, 'R': 9,
      'S': 2, 'T': 3, 'U': 4, 'V': 5, 'W': 6, 'X': 7, 'Y': 8, 'Z': 9,
      '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
    };

    // Position weights (1-based index, so subtract 1 for 0-based array)
    const weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];

    int sum = 0;
    for (int i = 0; i < 17; i++) {
      sum += vinValues[vin[i]]! * weights[i];
    }

    int checkDigit = sum % 11;
    String expectedCheck = checkDigit == 10 ? 'X' : checkDigit.toString();
    return vin[8] == expectedCheck;
  }
}
