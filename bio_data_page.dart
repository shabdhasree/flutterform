import 'package:flutter/material.dart';

class BioDataPage extends StatefulWidget {
  final String email;

  BioDataPage({required this.email});

  @override
  _BioDataPageState createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _age = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bio Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Bio Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _age = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Address"),
                onChanged: (value) {
                  _address = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitBioData,
                child: Text("Submit"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 15, 128, 221)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitBioData() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display the bio data
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bio Data Submitted"),
            content: Text(
              "Name: $_name\nEmail: ${widget.email}\nAge: $_age\nAddress: $_address",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
