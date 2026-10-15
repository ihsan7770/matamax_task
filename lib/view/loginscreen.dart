
import 'package:flutter/material.dart';
import 'package:task/view/homescren.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final horizontalPadding = width * 0.06;
    final logoSize = width * 0.21;
    final headingSize = width * 0.075;
    final normalTextSize = width * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: height * 0.02,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),

                  // Logo
                  Center(
                    child: Container(
                      height: logoSize,
                      width: logoSize,
                      constraints: const BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 60,
                        minWidth: 60,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.lock_outline,
                        size: logoSize * 0.53,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  // Welcome Text
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: headingSize.clamp(25.0, 32.0),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF222222),
                    ),
                  ),

                  SizedBox(height: height * 0.012),

                  Text(
                    'Login to continue using the app.',
                    style: TextStyle(
                      fontSize: normalTextSize.clamp(14.0, 17.0),
                      color: Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: height * 0.035),

                  // Email Label
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: normalTextSize.clamp(14.0, 16.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: height * 0.012),

                  // Email Field
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Password Label
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: normalTextSize.clamp(14.0, 16.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: height * 0.012),

                  // Password Field
                  TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Forgot password clicked'),
                          ),
                        );
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: (height * 0.065).clamp(48.0, 58.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailController.text.trim().isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter email and password',
                              ),
                            ),
                          );
                        } else {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: normalTextSize.clamp(15.0, 18.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey.shade300),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                        ),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: normalTextSize.clamp(13.0, 15.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey.shade300),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.03),
                  Center(
                    child: TextButton(
                                    onPressed: () {
                    print('Sign Up clicked');
                                    },
                                    child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                                    ),
                                  ),
                  )

                

                 
     
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

