import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false; // To track login status

  void _login() {
    // Simulated login check
    if (_usernameController.text == 'basil' &&
        _passwordController.text == '1234') {
      setState(() {
        _isLoggedIn = true; // Simulate successful login
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully logged in.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _isLoggedIn ? _buildProfileDetails() : _buildLoginPage(),
        ),
      ),
    );
  }

  Widget _buildLoginPage() {
    return Align(
      alignment: Alignment.topCenter, // Align the column to the top center
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink the column to fit its children
        children: [
          SizedBox(height: 50), // Add some spacing from the top
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login, // Call the login function
            child: Text('Login'),
          ),
        ],
      ),
    );
  }


  Widget _buildProfileDetails() {
    return Align(
      alignment: Alignment.topCenter,
      // Align the profile details to the top center
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink the column to fit its children
        children: [
          SizedBox(height: 50), // Add some spacing from the top
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/images/profile.jpg'), // Profile image
          ),
          SizedBox(height: 20),
          Text(
            'Welcome, ${_usernameController.text}!',
            // Welcome message with username
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}