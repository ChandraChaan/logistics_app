import 'package:flutter/material.dart';

class SlashScreen extends StatefulWidget {
  @override
  _SlashScreenState createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen>
    with SingleTickerProviderStateMixin {
  double _truckOffset = -250; // Start the truck off-screen to the left
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Total animation duration (2 + 3 seconds)
    );

    // After a delay of 2 seconds, move the truck from left to center
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _truckOffset = (MediaQuery.of(context).size.width - 230) / 2; // Center of the screen
        _animationController.forward(); // Start moving the truck to the center
      });
    });

    // After a total delay of 5 seconds, move the truck from center to right
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _truckOffset = MediaQuery.of(context).size.width - 10; // Right side of the screen
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade50,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Center(
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1), // Start from the bottom
                      end: Offset.zero,    // End at its original position
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeOut,
                    )),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/images/were_house.png'),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2), // Duration for the truck to reach the center
                    left: _truckOffset,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: SizedBox(
                        height: 230,
                        child: Center(
                          child: Image.asset('assets/images/truck.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
