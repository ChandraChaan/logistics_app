import 'package:flutter/material.dart';

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
            left: 20,
            right: 20,
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPageIndex != 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Previous'),
                  ),
                if (_currentPageIndex != introScreens.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Next'),
                  ),
                if (_currentPageIndex == introScreens.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      // Handle Done action
                    },
                    child: Text('Done'),
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
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            introScreen.image,
            height: 300,
          ),
          SizedBox(height: 20.0),
          Text(
            introScreen.title,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            introScreen.description,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
