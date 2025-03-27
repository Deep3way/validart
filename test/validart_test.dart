import 'package:test/test.dart';
import 'package:validifyDart/validifyDart.dart';

void main() {
  group('Validation Tests', () {
    // == Email Test ==
    test('Valid Email Test', () {
      expect(validifyDart.isValidEmail('test@example.com'), true);
      expect(validifyDart.isValidEmail('invalid-email'), false);
    });

    // == Phone Number Test ==
    test('Valid Phone Test', () {
      expect(validifyDart.isValidPhone('+1234567890'), true); // Valid case
      expect(validifyDart.isValidPhone('9876543210'), true); // Valid case
      expect(validifyDart.isValidPhone('123-456-7890'), false); // Invalid case
    });

    // == Credit Card Test ==
    test('Valid Credit Card Test', () {
      expect(
          validifyDart.isValidCreditCard('4532015112830366'), true); // Valid case
      expect(validifyDart.isValidCreditCard('1234567890123456'),
          false); // Invalid case
      expect(validifyDart.isValidCreditCard('4111111111111111'),
          true); // Valid case (Visa)
      expect(validifyDart.isValidCreditCard('5500000000000004'),
          true); // Valid case (MasterCard)
    });

    // == PAN Test ==
    test('Valid PAN Test', () {
      expect(validifyDart.isValidPAN('ABCDE1234F'), true); // Valid PAN
      expect(validifyDart.isValidPAN('ABC1234F'), false); // Invalid PAN
      expect(validifyDart.isValidPAN('ABCDE12345'),
          false); // Invalid PAN (Extra character)
    });

    // == Aadhar Test ==
    test('Valid Aadhar Test', () {
      expect(validifyDart.isValidAadhaar('123456789012'), true); // Valid Aadhar
      expect(validifyDart.isValidAadhaar('12345'), false); // Invalid Aadhar
      expect(validifyDart.isValidAadhaar('A1234567890'),
          false); // Invalid Aadhar (Alphabetical character)
    });

    // == URL Test ==
    test('Valid URL Test', () {
      expect(validifyDart.isValidUrl('https://www.example.com'), true); // Valid URL
      expect(validifyDart.isValidUrl('invalid-url'), false); // Invalid URL
      expect(validifyDart.isValidUrl('http://example.com'), true); // Valid URL
      expect(validifyDart.isValidUrl('www.example.com'),
          false); // Invalid URL (Missing protocol)
    });

    // == IPv6 Test ==
    test('Valid IPv6 Test', () {
      expect(validifyDart.isValidIPv6('2001:0db8:85a3:0000:0000:8a2e:0370:7334'),
          true); // Valid IPv6
      expect(validifyDart.isValidIPv6('2001:db8:85a3:0:0:8a2e:370:7334'),
          true); // Valid IPv6
      expect(validifyDart.isValidIPv6('2001:db8:85a3:0:0:8a2e:370:733g'),
          false); // Invalid IPv6
    });

    // == ISIN Test ==
    test('Valid ISIN Test', () {
      expect(validifyDart.isValidISIN('US0378331005'), true); // Valid ISIN
      expect(validifyDart.isValidISIN('US037833100X'), false); // Invalid ISIN
    });

    // == Currency Code Test ==
    test('Valid Currency Code Test', () {
      expect(validifyDart.isValidCurrencyCode('USD'), true); // Valid currency code
      expect(
          validifyDart.isValidCurrencyCode('US1'), false); // Invalid currency code
    });

    // == GSTIN Test ==
    test('Valid GSTIN Test', () {
      expect(validifyDart.isValidGSTIN('27AAAPF1234A1Z5'), true); // Valid GSTIN
      expect(validifyDart.isValidGSTIN('27AAAPF123A1Z5'), false); // Invalid GSTIN
    });

    // == MAC Address Test ==
    test('Valid MAC Address Test', () {
      expect(
          validifyDart.isValidMACAddress('00:14:22:01:23:45'), true); // Valid MAC
      expect(validifyDart.isValidMACAddress('00:14:22:01:23:XX'),
          false); // Invalid MAC
    });

    // == UUID Test ==
    test('Valid UUID Test', () {
      expect(validifyDart.isValidUUID('123e4567-e89b-12d3-a456-426614174000'),
          true); // Valid UUID
      expect(validifyDart.isValidUUID('123e4567-e89b-12d3-a456-42661417400X'),
          false); // Invalid UUID
    });

    // == JSON Test ==
    test('Valid JSON Test', () {
      expect(validifyDart.isValidJSON('{"name": "John", "age": 30}'),
          true); // Valid JSON
      expect(validifyDart.isValidJSON('{"name": "John", "age": }'),
          false); // Invalid JSON
    });

    // == Hex Color Test ==
    test('Valid Hex Color Test', () {
      expect(validifyDart.isValidHexColor('#FF5733'), true); // Valid hex color
      expect(validifyDart.isValidHexColor('#XYZ123'), false); // Invalid hex color
    });
  });
}
