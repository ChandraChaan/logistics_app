import 'package:flutter/material.dart';
import 'package:logistics_app/sign_in.dart';
import 'package:logistics_app/verify_screen.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildTextFormField('Full Name', TextInputType.text),
                    const SizedBox(height: 20),
                    buildTextFormField('Email Id', TextInputType.emailAddress),
                    const SizedBox(height: 20),
                    buildTextFormField('Phone Number', TextInputType.phone),
                    const SizedBox(height: 20),
                    buildTextFormField('Password', TextInputType.text,
                        obscureText: true),
                    const SizedBox(height: 20),
                    buildTextFormField('Confirm Password', TextInputType.text,
                        obscureText: true),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 0.0),
                      value: false,
                      // Change this value with the checkbox state
                      onChanged: (value) {
                        // Handle checkbox value change
                      },
                      title: const Text.rich(
                        TextSpan(
                          text: "I agree all ",
                          children: [
                            TextSpan(
                              text: "Terms and Conditions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerifyScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // "Don't Have an Account? Please Sign Up" text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have an Account?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SingInPage()),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField(String label, TextInputType keyboardType,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 45,
          child: TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              label: Text(label),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
