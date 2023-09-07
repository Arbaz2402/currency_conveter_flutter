import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({Key? key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  String selectedCurrency = 'USD'; // Default selected currency
  Map<String, double> conversionRates = {
    'USD': 83.20, // Conversion rate for USD to INR
    'POUND': 103.74, // Conversion rate for GBP to INR
    'Pakistani Rupee': 0.27, // Conversion rate for PKR to INR
    'Euro': 89.11, // Conversion rate for EUR to INR
    'Canadian Dollar': 60.94, // Conversion rate for CAD to INR
    'Japanese Yen': 0.56, // Conversion rate for JPY to INR
    // Add more currencies and their conversion rates as needed
  };

  void convert() {
    final inputAmount = double.tryParse(textEditingController.text);
    if (inputAmount != null) {
      final conversionRate = conversionRates[selectedCurrency];
      if (conversionRate != null) {
        result = inputAmount * conversionRate;
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromARGB(255, 19, 43, 147),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 19, 43, 147),
        middle: Text('Currency Converter'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              CupertinoPicker(
                itemExtent: 50,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedCurrency = conversionRates.keys.toList()[index];
                  });
                },
                children: conversionRates.keys.map((String currency) {
                  return Center(
                    child: Text(
                      currency,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                placeholder: 'Please enter the amount in selected currency',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: convert,
                color: const Color.fromARGB(255, 180, 22, 22),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
