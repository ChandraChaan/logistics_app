import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logistics_app/sign_in.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  int _remainingTime = 30; // Initial time for OTP resend in seconds
  bool _isTimerActive = false;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    if (!_isTimerActive) {
      setState(() {
        _isTimerActive = true;
        _remainingTime = 30;
      });
      _startCountdown();
    }
  }

  void _startCountdown() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_remainingTime < 1) {
          _isTimerActive = false;
          timer.cancel();
        } else {
          _remainingTime = _remainingTime - 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: [
          const Expanded(
            flex: 7,
            child: Center(
              child: SizedBox(
                height: 220,
                width: 220,
                // Your logo image or widget goes here
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0, right: 32),
                      child: Text(
                        '6 Digit OTP Has been send to your registered Mobile number end with 0202',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text(
                        'Enter OTP here',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // OTP boxes
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOtpBox(),
                          _buildOtpBox(),
                          _buildOtpBox(),
                          _buildOtpBox(),
                          _buildOtpBox(),
                          _buildOtpBox(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Resend OTP button and timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _isTimerActive
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Resend OTP in $_remainingTime seconds',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    const Text('Didn’t Receive?'),
                                    TextButton(
                                      onPressed: _startTimer,
                                      child: const Text(
                                        'Resend OTP',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Verify OTP button tap
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Colors.green;
                                },
                              ),
                            ),
                            child: const Text(
                              'Verify',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    // "Don't Have an Account? Please Sign Up" text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Go back?",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
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

  Widget _buildOtpBox() {
    return SizedBox(
      width: 40.0,
      height: 45.0,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20.0),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
