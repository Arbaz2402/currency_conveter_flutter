import 'package:currency_converter/currency_converter_cupertino_page.dart';
import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: CurrencyConverterMaterialPage(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: CurrencyConverterCupertinoPage(),
    );
  }
}