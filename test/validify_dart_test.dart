import 'package:test/test.dart';
import 'package:validifydart/validify_dart.dart';

void main() {
  group('Validation Tests', () {
    // == Email Test ==
    test('Valid Email Test', () {
      expect(ValidifyDart.isValidEmail('test@example.com'), true);
      expect(ValidifyDart.isValidEmail('invalid-email'), false);
    });

    // == Phone Number Test ==
    test('Valid Phone Test', () {
      expect(ValidifyDart.isValidPhone('+1234567890'), true);
      expect(ValidifyDart.isValidPhone('9876543210'), true);
      expect(ValidifyDart.isValidPhone('123-456-7890'), false);
    });

    // == Credit Card Test ==
    test('Valid Credit Card Test', () {
      expect(ValidifyDart.isValidCreditCard('4532015112830366'), true);
      expect(ValidifyDart.isValidCreditCard('1234567890123456'), false);
      expect(ValidifyDart.isValidCreditCard('4111111111111111'), true);
      expect(ValidifyDart.isValidCreditCard('5500000000000004'), true);
    });

    // == PAN Test ==
    test('Valid PAN Test', () {
      expect(ValidifyDart.isValidPAN('ABCDE1234F'), true);
      expect(ValidifyDart.isValidPAN('ABC1234F'), false);
      expect(ValidifyDart.isValidPAN('ABCDE12345'), false);
    });

    // == Aadhar Test ==
    test('Valid Aadhar Test', () {
      expect(ValidifyDart.isValidAadhaar('123456789012'), true);
      expect(ValidifyDart.isValidAadhaar('12345'), false);
      expect(ValidifyDart.isValidAadhaar('A1234567890'), false);
    });

    // == URL Test ==
    test('Valid URL Test', () {
      expect(ValidifyDart.isValidUrl('https://www.example.com'), true);
      expect(ValidifyDart.isValidUrl('invalid-url'), false);
      expect(ValidifyDart.isValidUrl('http://example.com'), true);
      expect(ValidifyDart.isValidUrl('www.example.com'), false);
    });

    // == IPv6 Test ==
    test('Valid IPv6 Test', () {
      expect(ValidifyDart.isValidIPv6('2001:0db8:85a3:0000:0000:8a2e:0370:7334'), true);
      expect(ValidifyDart.isValidIPv6('2001:db8:85a3:0:0:8a2e:370:7334'), true);
      expect(ValidifyDart.isValidIPv6('2001:db8:85a3:0:0:8a2e:370:733g'), false);
    });

    // == ISIN Test ==
    test('Valid ISIN Test', () {
      expect(ValidifyDart.isValidISIN('US0378331005'), true);
      expect(ValidifyDart.isValidISIN('US037833100X'), false);
    });

    // == Currency Code Test ==
    test('Valid Currency Code Test', () {
      expect(ValidifyDart.isValidCurrencyCode('USD'), true);
      expect(ValidifyDart.isValidCurrencyCode('US1'), false);
    });

    // == GSTIN Test ==
    test('Valid GSTIN Test', () {
      expect(ValidifyDart.isValidGSTIN('27AAAPF1234A1Z5'), true);
      expect(ValidifyDart.isValidGSTIN('27AAAPF123A1Z5'), false);
    });

    // == MAC Address Test ==
    test('Valid MAC Address Test', () {
      expect(ValidifyDart.isValidMACAddress('00:14:22:01:23:45'), true);
      expect(ValidifyDart.isValidMACAddress('00:14:22:01:23:XX'), false);
    });

    // == UUID Test ==
    test('Valid UUID Test', () {
      expect(ValidifyDart.isValidUUID('123e4567-e89b-12d3-a456-426614174000'), true);
      expect(ValidifyDart.isValidUUID('123e4567-e89b-12d3-a456-42661417400X'), false);
    });

    // == JSON Test ==
    test('Valid JSON Test', () {
      expect(ValidifyDart.isValidJSON('{"name": "John", "age": 30}'), true);
      expect(ValidifyDart.isValidJSON('{"name": "John", "age": }'), false);
    });

    // == Hex Color Test ==
    test('Valid Hex Color Test', () {
      expect(ValidifyDart.isValidHexColor('#FF5733'), true);
      expect(ValidifyDart.isValidHexColor('#XYZ123'), false);
    });

    // == Extended Validations ==

    // == Canadian SIN Test ==
    test('Valid SIN Test', () {
      expect(ValidifyDart.isValidSIN('046-454-286'), true); // Valid SIN
      expect(ValidifyDart.isValidSIN('123-456-789'), false); // Invalid SIN
    });

    // == IPv4 Test ==
    test('Valid IPv4 Test', () {
      expect(ValidifyDart.isValidIPv4('192.168.1.1'), true);
      expect(ValidifyDart.isValidIPv4('256.256.256.256'), false);
      expect(ValidifyDart.isValidIPv4('192.168.1'), false);
    });

    // == Port Test ==
    test('Valid Port Test', () {
      expect(ValidifyDart.isValidPort(80), true);
      expect(ValidifyDart.isValidPort(65535), true);
      expect(ValidifyDart.isValidPort(65536), false);
      expect(ValidifyDart.isValidPort(-1), false);
    });

    // == Latitude Test ==
    test('Valid Latitude Test', () {
      expect(ValidifyDart.isValidLatitude(45.0), true);
      expect(ValidifyDart.isValidLatitude(-90.0), true);
      expect(ValidifyDart.isValidLatitude(90.1), false);
    });

    // == Longitude Test ==
    test('Valid Longitude Test', () {
      expect(ValidifyDart.isValidLongitude(0.0), true);
      expect(ValidifyDart.isValidLongitude(-180.0), true);
      expect(ValidifyDart.isValidLongitude(180.1), false);
    });

    // == US ZIP Code Test ==
    test('Valid US ZIP Code Test', () {
      expect(ValidifyDart.isValidUSZipCode('12345'), true);
      expect(ValidifyDart.isValidUSZipCode('12345-6789'), true);
      expect(ValidifyDart.isValidUSZipCode('1234'), false);
    });

    // == Bitcoin Address Test ==
    test('Valid Bitcoin Address Test', () {
      expect(ValidifyDart.isValidBitcoinAddress('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'), true);
      expect(ValidifyDart.isValidBitcoinAddress('invalid'), false);
    });

    // == Ethereum Address Test ==
    test('Valid Ethereum Address Test', () {
      expect(ValidifyDart.isValidEthereumAddress('0x742d35Cc6634C0532925a3b844Bc454e4438f44e'), true);
      expect(ValidifyDart.isValidEthereumAddress('0x123'), false);
    });

    // == File Extension Test ==
    test('Valid File Extension Test', () {
      expect(ValidifyDart.isValidFileExtension('document.pdf', ['pdf', 'doc']), true);
      expect(ValidifyDart.isValidFileExtension('image.jpg', ['pdf', 'doc']), false);
    });

    // == ISBN-13 Test ==
    test('Valid ISBN-13 Test', () {
      expect(ValidifyDart.isValidISBN13('978-0-306-40615-7'), true);
      expect(ValidifyDart.isValidISBN13('123-4-567-89012-3'), false);
    });

    // == Password Strength Test ==
    test('Valid Password Strength Test', () {
      expect(ValidifyDart.isStrongPassword('P@ssw0rd123'), true);
      expect(ValidifyDart.isStrongPassword('password'), false);
    });

    // == Semantic Version Test ==
    test('Valid Semantic Version Test', () {
      expect(ValidifyDart.isValidSemVer('1.2.3'), true);
      expect(ValidifyDart.isValidSemVer('1.2'), false);
      expect(ValidifyDart.isValidSemVer('1.2.3-beta'), false);
    });

    // == VIN Test ==
    // == VIN Test ==
    test('Valid VIN Test', () {
      expect(ValidifyDart.isValidVIN('1HGCM82633A004352'), true); // Valid VIN with correct check digit
      expect(ValidifyDart.isValidVIN('1HGCM82633A00435X'), false); // Invalid check digit
      expect(ValidifyDart.isValidVIN('1HGCM82633A00435'), false); // Too short
      expect(ValidifyDart.isValidVIN('1HGCM82633A00435Q'), false); // Invalid character Q
    });
  });
}