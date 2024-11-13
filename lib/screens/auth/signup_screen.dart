import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validation flags
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool isMobileValid = true;

  // Validate email to end with @kletech.ac.in
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-z0-9]+[a-z0-9._%+-]*@kletech\.ac\.in$');
    return regex.hasMatch(email.trim());
  }

  // Validate mobile number format (+91 followed by 10 digits, allows space or hyphen after +91)
  bool isValidMobile(String mobile) {
    final regex = RegExp(r'^(?:\+91[-\s]?)?\d{10}$');
    return regex.hasMatch(mobile.trim());
  }

  // Validate password
  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*]).{8,}$');
    return regex.hasMatch(password.trim());
  }

  // Handle form submission
  Future<void> _signup() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final mobileNumber = '+91 ${mobileNumberController.text.trim()}'; // Prefix +91
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    setState(() {
      isEmailValid = isValidEmail(email);
      isPasswordValid = isValidPassword(password);
      isConfirmPasswordValid = password == confirmPassword;
      isMobileValid = isValidMobile(mobileNumber);
    });

    if (!isEmailValid || !isPasswordValid || !isConfirmPasswordValid || !isMobileValid) {
      return; // If any field is invalid, exit without submitting
    }

    try {
      // Firebase Authentication
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'mobileNumber': mobileNumber,
        'email': email,
        'password': password, // In a real app, don't store plain text passwords!
      });

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("You have signed up successfully!"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-up failed: ${e.toString()}")),
      );
    }
  }

  // Handle Google Sign-In
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null && googleUser.email.endsWith('@kletech.ac.in')) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

        // Store user details in Firestore if not already stored
        final user = userCredential.user;
        if (user != null) {
          await _firestore.collection('users').doc(user.uid).set({
            'firstName': user.displayName?.split(' ').first ?? '',
            'lastName': user.displayName?.split(' ').last ?? '',
            'email': user.email,
          }, SetOptions(merge: true));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Google Sign-Up successful")),
          );

          Navigator.pushReplacementNamed(context, '/login');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an email ending with @kletech.ac.in")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-Up failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: "First Name"),
                maxLength: 15,
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: "Last Name"),
                maxLength: 15,
              ),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  prefixText: "+91 ",
                  errorText: !isMobileValid ? 'Enter a valid mobile number' : null,
                ),
                maxLength: 10, // Restrict length to digits only
                onChanged: (value) {
                  setState(() {
                    isMobileValid = isValidMobile('+91 $value'); // Add '+91' dynamically for validation
                  });
                },
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  helperText: "Must end with @kletech.ac.in",
                  errorText: !isEmailValid ? 'Email must end with @kletech.ac.in' : null,
                ),
                onChanged: (value) {
                  setState(() {
                    isEmailValid = isValidEmail(value);
                  });
                },
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  helperText: "At least 1 uppercase, 1 special character, minimum 8 characters",
                  errorText: !isPasswordValid ? 'Password format is incorrect' : null,
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isPasswordVisible,
                onChanged: (value) {
                  setState(() {
                    isPasswordValid = isValidPassword(value);
                  });
                },
              ),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  errorText: !isConfirmPasswordValid ? 'Passwords do not match' : null,
                  suffixIcon: IconButton(
                    icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isConfirmPasswordVisible,
                onChanged: (value) {
                  setState(() {
                    isConfirmPasswordValid = passwordController.text == value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signup,
                child: Text("Sign Up"),
              ),
              TextButton(
                onPressed: _googleSignUp,
                child: Text("Sign Up with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
