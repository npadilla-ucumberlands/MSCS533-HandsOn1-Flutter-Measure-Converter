import 'package:flutter/material.dart';

void main() {
  runApp(const ConversionApp());
}

/// Main application widget.
class ConversionApp extends StatelessWidget {
  const ConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Measure Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ConversionHomePage(),
    );
  }
}

/// Home screen for the measurement conversion application.
class ConversionHomePage extends StatefulWidget {
  const ConversionHomePage({super.key});

  @override
  State<ConversionHomePage> createState() => _ConversionHomePageState();
}

class _ConversionHomePageState extends State<ConversionHomePage> {
  final TextEditingController _valueController = TextEditingController();

  final List<String> _units = [
    'Miles',
    'Kilometers',
    'Meters',
    'Feet',
    'Pounds',
    'Kilograms',
    'Fahrenheit',
    'Celsius',
  ];

  String _fromUnit = 'Miles';
  String _toUnit = 'Kilometers';
  String _result = 'Result will appear here';

  /// Converts the entered value between compatible units.
  void _convert() {
    final double? inputValue = double.tryParse(_valueController.text);

    if (inputValue == null) {
      setState(() {
        _result = 'Please enter a valid number.';
      });
      return;
    }

    double? convertedValue;

    // Length conversions.
    if (_fromUnit == 'Miles' && _toUnit == 'Kilometers') {
      convertedValue = inputValue * 1.60934;
    } else if (_fromUnit == 'Kilometers' && _toUnit == 'Miles') {
      convertedValue = inputValue / 1.60934;
    } else if (_fromUnit == 'Meters' && _toUnit == 'Feet') {
      convertedValue = inputValue * 3.28084;
    } else if (_fromUnit == 'Feet' && _toUnit == 'Meters') {
      convertedValue = inputValue / 3.28084;
    }

    // Weight conversions.
    else if (_fromUnit == 'Pounds' && _toUnit == 'Kilograms') {
      convertedValue = inputValue * 0.453592;
    } else if (_fromUnit == 'Kilograms' && _toUnit == 'Pounds') {
      convertedValue = inputValue * 2.20462;
    }

    // Temperature conversions.
    else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      convertedValue = (inputValue - 32) * 5 / 9;
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      convertedValue = (inputValue * 9 / 5) + 32;
    }

    // Same-unit conversion.
    else if (_fromUnit == _toUnit) {
      convertedValue = inputValue;
    }

    setState(() {
      if (convertedValue != null) {
        _result =
            '${inputValue.toStringAsFixed(2)} $_fromUnit = '
            '${convertedValue!.toStringAsFixed(2)} $_toUnit';
      } else {
        _result = 'These units cannot be converted directly.';
      }
    });
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Converter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.swap_horiz,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Metric & Imperial Conversion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Enter Value',
                hintText: 'Example: 10',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: _fromUnit,
              decoration: const InputDecoration(
                labelText: 'Convert From',
                border: OutlineInputBorder(),
              ),
              items: _units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _fromUnit = newValue;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: _toUnit,
              decoration: const InputDecoration(
                labelText: 'Convert To',
                border: OutlineInputBorder(),
              ),
              items: _units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _toUnit = newValue;
                  });
                }
              },
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _convert,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}