import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  double _scale = 1.0;

  void _login() {
    if (_usernameController.text == 'basil' && _passwordController.text == '1234') {
      setState(() {
        _isLoggedIn = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully logged in.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _isLoggedIn ? _buildProfileDetails() : _buildLoginPage(),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginPage() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          SimpleGestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageView(),
                ),
              );
            },
            onDoubleTap: () {
              setState(() {
                _scale = 1.0;
              });
            },
            onHorizontalSwipe: (direction) {
              if (direction == SwipeDirection.left) {
                Navigator.pop(context);
              }
            },
            child: Transform.scale(
              scale: _scale,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome, ${_usernameController.text}!',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildProfileDetailRow(Icons.phone, 'Phone Number', '03355123512'),
          _buildProfileDetailRow(Icons.email, 'Email', 'basil1234@gmail.com'),
          _buildProfileDetailRow(Icons.location_on, 'Address', 'riphah-14 campus, Islamabad, Pakistan'),
        ],
      ),
    );
  }

  Widget _buildProfileDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 18),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 4.0,
          child: Image.asset('assets/images/profile.jpg'),
        ),
      ),
    );
  }
}
