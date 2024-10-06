import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'bio_data_page.dart';
import 'main.dart'; // for accessing 'users' map

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("Login"),
                style:ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 15, 128, 221)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),

                )
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: const Text("Don't have an account? Sign up here."),
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

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = '';
      });

      if (users.containsKey(_email) && users[_email] == _password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BioDataPage(email: _email)),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid email or password.';
        });
      }
    }
  }
}
