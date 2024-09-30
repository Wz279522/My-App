import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo and Title
            Image.asset('assets/logo.png', height: 100), // replace with your logo
            SizedBox(height: 20),
            Text(
              'Digital Z AI Art',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Email and Password Fields
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Main Input Screen when the "Log In" button is pressed
                Navigator.pushNamed(context, '/main');
              },
              child: Text('Log In'),
            ),
            SizedBox(height: 10),

	    // Skip Button for Testing
	    TextButton(
	      onPressed: () {
		Navigator.pushNamed(context, '/main'); // Skip to Main Input Screen
	      },
	      child: Text('Skip for Testing'),
	    ),

            // Forgot password and Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('Forgot password')),
                TextButton(onPressed: () {}, child: Text('Sign up')),
              ],
            ),
            SizedBox(height: 20),

            // Sign In Options
            OutlinedButton(
              onPressed: () {}, // handle Google sign-in
              child: Text('Sign in with Google'),
            ),
            OutlinedButton(
              onPressed: () {}, // handle Yahoo sign-in
              child: Text('Sign in with Yahoo'),
            ),
            OutlinedButton(
              onPressed: () {}, // handle passwordless sign-in
              child: Text('Passwordless Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
