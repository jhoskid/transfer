import 'package:flutter/material.dart';
import 'transfer_page.dart';

void main() {
  runApp(DigitalWalletApp());
}

class DigitalWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransferPage(),
    );
  }
}
