
---

### `CHANGELOG.md`

```markdown
# Changelog

## 0.2.0

* Added new `ValidifyDartExtended` class with additional validations:
  * Advanced Personal Identifiers:
    - Canadian SIN (Social Insurance Number) with checksum validation
  * Advanced Network:
    - IPv4 address validation
    - Port number validation (0-65535)
  * Geographic:
    - Latitude validation (-90 to 90)
    - Longitude validation (-180 to 180)
    - US ZIP code validation
  * Advanced Financial:
    - Bitcoin address validation
    - Ethereum address validation
  * File Formats:
    - File extension validation
    - ISBN-13 validation with checksum
  * Security:
    - Password strength validation
  * Miscellaneous:
    - Semantic version number validation
    - VIN (Vehicle Identification Number) validation
* Improved library structure and code quality:
  - Renamed library to `validify_dart` following Dart naming conventions
  - Renamed class from `validifydart` to `ValidifyDart` to follow UpperCamelCase
  - Updated connectivity checks to handle `List<ConnectivityResult>` from `connectivity_plus`
* Added input validation for null/empty checks in key methods
* Extracted regex patterns into constants for better maintainability
* Enhanced documentation with parameter and return type details
* Added comprehensive unit test suite

## 0.1.0

* Initial release of the validifydart package.
* Implemented basic validation methods for:
    * Personal Identifiers:
        - Aadhaar
        - PAN
        - SSN (Social Security Number)
        - Passport
        - Driving License
        - Voter ID
        - EIN (Employer Identification Number)
        - IBAN (International Bank Account Number)
    * Email & URLs:
        - Email
        - URL
        - IPv6 Address
        - Subdomain Validation
    * Internet & WiFi:
        - Check if connected to the internet
        - Check if connected to WiFi
    * Numbers:
        - Even/Odd Number
        - Prime Number
        - Positive/Negative Number
        - Range Check
        - Divisibility Check
        - Square Number Check
        - Fibonacci Check
    * Financial:
        - Credit Card Number (Luhn's algorithm)
        - GSTIN (Goods and Services Tax Identification Number)
        - IFSC (Indian Financial System Code)
        - UPI ID (Unified Payments Interface ID)
        - Currency Code
        - ISIN (International Securities Identification Number)
        - CUSIP (Committee on Uniform Securities Identification Procedures)
        - MIC (Market Identifier Code)
    * Strings:
        - Alphabetic Check
        - Alphanumeric Check
        - Palindrome Check
        - Minimum/Maximum Length Check
        - Whitespace Check
        - Upper/Lower Case Check
        - Numeric Check
    * Dates:
        - Leap Year Check
        - Date Format Check (YYYY-MM-DD)
        - Time Format Check (HH:mm:ss)
    * Other:
        - Hexadecimal Color Check
        - Binary Check
        - Markdown Check
        - MAC Address Check
        - UUID Check
        - JSON Format Check
* Added test cases for each validation function.
* First version of the library for validating common data formats.
