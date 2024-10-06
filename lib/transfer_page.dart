import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _accountNumberController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitTransfer() {
    if (_formKey.currentState!.validate()) {
      String accountNumber = _accountNumberController.text;
      String amount = _amountController.text;
      // ignore: unused_local_variable
      String description = _descriptionController.text;

      // Proses transfer di sini (misalnya, panggilan API)
      // Simulasi berhasil
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Transfer Berhasil'),
            content: Text('Uang sejumlah Rp $amount telah dikirim ke rekening $accountNumber.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Uang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Nomor Rekening Tujuan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor rekening harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah Transfer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah transfer harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Keterangan (Opsional)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTransfer,
                child: Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
