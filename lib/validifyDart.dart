library validifyDart;

import 'dart:convert';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class that provides various methods for validation
/// such as phone numbers, email, URLs, financial data, and more.
class validifyDart {
  // == Phone Number Identifiers ==
  /// Validates an international phone number.
  /// The phone number can start with a plus sign followed by country code and digits.
  /// Example: "+14155552671".
  static bool isValidPhone(String phone) {
    const regex = r"^\+?[1-9]\d{1,14}$"; // International phone number regex
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
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  /// Checks if the device is connected to WiFi.
  /// Returns true if connected to a WiFi network.
  static Future<bool> isConnectedToWiFi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi;
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
}
