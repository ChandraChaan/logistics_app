import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IntroductionScreenPage extends StatefulWidget {
  @override
  _IntroductionScreenPageState createState() => _IntroductionScreenPageState();
}

class _IntroductionScreenPageState extends State<IntroductionScreenPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  final List<IntroScreen> introScreens = [
    IntroScreen(
      title: "Find the Perfect Truck",
      description:
      "Browse through a wide range of trucks and find the one that suits your requirements. Filter by size, capacity, and other specifications to ensure a perfect match.",
      color: Colors.blue,
      image: 'assets/images/intro_screen_1.png',
    ),
    IntroScreen(
      title: "Track Your Shipment",
      description:
      "Stay updated throughout the journey. Track your shipment in real-time and receive notifications at every step of the process.",
      color: Colors.green,
      image: 'assets/images/intro_screen_2.png',
    ),
    IntroScreen(
      title: "Effortless Delivery",
      description: "Sit back and relax while we handle the delivery for you.",
      color: Colors.orange,
      image: 'assets/images/intro_screen_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: introScreens.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return IntroScreenWidget(introScreens[index]);
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Center(
              child: DotsIndicator(
                dotsCount: introScreens.length,
                position: _currentPageIndex.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  activeColor: Colors.white,
                  spacing: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_currentPageIndex != introScreens.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Next'),
                  ),
                if (_currentPageIndex == introScreens.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Handle Done action
                    },
                    child: const Text('Done'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IntroScreen {
  final String title;
  final String description;
  final Color color;
  final String image;

  IntroScreen({required this.title, required this.description, required this.color, required this.image});
}

class IntroScreenWidget extends StatelessWidget {
  final IntroScreen introScreen;

  IntroScreenWidget(this.introScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: introScreen.color,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            introScreen.image,
            height: 300,
          ),
          const SizedBox(height: 20.0),
          Text(
            introScreen.title,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            introScreen.description,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
