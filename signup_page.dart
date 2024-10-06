import 'package:flutter/material.dart';
import 'bio_data_page.dart';
import 'main.dart'; // for accessing 'users' map

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  // ignore: unused_field
  String _confirmPassword = '';
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => _email = value,
                validator: (value) => value!.isEmpty ? "Enter your email" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                onChanged: (value) => _password = value,
                validator: (value) => value!.isEmpty ? "Enter your password" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                onChanged: (value) => _confirmPassword = value,
                validator: (value) => value != _password ? "Passwords do not match" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text("Sign Up"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 15, 128, 221)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = '';
      });

      if (users.containsKey(_email)) {
        setState(() {
          _errorMessage = 'Email already exists.';
        });
      } else {
        users[_email] = _password;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BioDataPage(email: _email)),
        );
      }
    }
  }
}
