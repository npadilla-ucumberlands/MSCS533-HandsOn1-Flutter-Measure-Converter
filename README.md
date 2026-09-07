# MSCS-533 Hands-on Assignment 1: Flutter Measure Converter

A Flutter application developed using Dart for Software Engineering and Multiplatform App Development (MSCS-533-M20).

This project was created for Hands-on Assignment 1: Construct Your First Flutter App using Dart. The application allows users to enter a numerical value and convert between common metric and imperial measurement units.

## Features

- Simple Flutter Material user interface
- Numerical value input
- Source and destination unit selection
- Metric and imperial conversions
- Input validation
- Results displayed to two decimal places
- Distance, weight, and temperature conversions

## Supported Conversions

### Distance

- Miles to Kilometers
- Kilometers to Miles
- Meters to Feet
- Feet to Meters

### Weight

- Pounds to Kilograms
- Kilograms to Pounds

### Temperature

- Fahrenheit to Celsius
- Celsius to Fahrenheit

The application also supports conversions where the source and destination units are the same.

## Technologies Used

- Dart
- Flutter
- Material Design
- Visual Studio Code
- Google Chrome for Flutter web testing

## Project Structure

The primary Dart source code is located in:

lib/main.dart

The Android manifest is located in:

android/app/src/main/AndroidManifest.xml

Additional platform-specific Flutter files are included for Android, iOS, web, Windows, Linux, and macOS.

## Running the Application

Make sure Flutter is installed and configured.

Install project dependencies:

    flutter pub get

Check available devices:

    flutter devices

Run the application:

    flutter run

To run the application using Google Chrome:

    flutter run -d chrome

## Example Conversion

Input:

    Value: 10
    Convert From: Miles
    Convert To: Kilometers

Output:

    10.00 Miles = 16.09 Kilometers

## Application Design

The application uses a StatefulWidget to manage user selections and conversion results. A TextEditingController retrieves numerical input, while dropdown controls allow the user to select the source and destination measurement units.

Conversion calculations are performed locally using Dart. Invalid numerical input is handled using double.tryParse(), allowing the application to display an error message instead of failing when invalid input is entered.

## Course Information

**Course:** Software Engineering and Multiplatform App Development

**Course Number:** MSCS-533-M20

**Assignment:** Hands-on Assignment 1 - Construct Your First Flutter App using Dart

## Author

Nasser Hasan