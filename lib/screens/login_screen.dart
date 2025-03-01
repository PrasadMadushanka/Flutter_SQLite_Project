import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/database_srvice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final response = await ApiService.login(username, password);

    if (response != null) {
      await DatabaseService.saveUserData(response);
      print('User saved');
      // Navigate to another page (e.g., HomePage)
    } else {
      print('Login failed');
    }
  }
}
