import 'package:flutter/material.dart';
import 'package:meditation/screens/home_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../utils/constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignUp = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_isSignUp) {
      // Handle sign-up logic
      print('Sign Up Details:');
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
      print('Email: ${_emailController.text}');
    } else {
      // Handle log-in logic
      print('Log In Details:');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrown,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/img.png'),
          ),

          // Main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      // Sign Up / Log In switch buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AuthButton(
                            text: 'Sign Up',
                            onPressed: () {
                              setState(() {
                                _isSignUp = true;
                              });
                            },
                            backgroundColor: _isSignUp ? primaryBrown : lightBrown,
                            borderColor: primaryBrown,
                          ),
                          const SizedBox(width: 10),
                          AuthButton(
                            text: 'Log In',
                            onPressed: () {
                              setState(() {
                                _isSignUp = false;
                              });
                            },
                            backgroundColor: !_isSignUp ? primaryBrown : lightBrown,
                            borderColor: primaryBrown,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      // Text Fields
                      if (_isSignUp) ...[
                        CustomTextField(
                          controller: _usernameController,
                          hintText: 'Enter your username',
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Create a Password',
                          isPassword: true,
                        ),
                        CustomTextField(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm Password',
                          isPassword: true,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Enter your email address',
                        ),
                      ] else ...[
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Enter your email address',
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter Password',
                          isPassword: true,
                        ),
                      ],
                      const SizedBox(height: 30),
                      // Next button
                      AuthButton(
                        text: 'Next',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        backgroundColor: primaryBrown,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}