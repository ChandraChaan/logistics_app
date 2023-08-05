import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:logistics_app/sign_in.dart';

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
      color: Colors.green,
      image: 'assets/images/intro_screen_1.png',
    ),
    IntroScreen(
      title: "Track Your Shipment",
      description:
          "Stay updated throughout the journey. Track your shipment in real-time and receive notifications at every step of the process.",
      color: Colors.blue,
      image: 'assets/images/intro_screen_2.png',
    ),
    IntroScreen(
      title: "Effortless Delivery",
      description: "Sit back and relax while we handle the delivery for you.",
      color: Colors.orange,
      image: 'assets/images/intro_screen_3.png',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _onNextButtonTap() {
    if (_currentPageIndex < introScreens.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SingInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: introScreens.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return IntroScreenWidget(
                introScreen: introScreens[index],
              );
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
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  activeColor: Colors.green,
                  spacing: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.green,
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
                SizedBox(
                  width: 83,
                  child: ElevatedButton(
                    onPressed: _onNextButtonTap,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return _currentPageIndex == introScreens.length - 1
                              ? Colors.blueAccent
                              : Colors.green;
                        },
                      ),
                    ),
                    child: Text(
                      _currentPageIndex == introScreens.length - 1
                          ? 'Sign In'
                          : 'Next',
                    ),
                  ),
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

  IntroScreen({
    required this.title,
    required this.description,
    required this.color,
    required this.image,
  });
}

class IntroScreenWidget extends StatelessWidget {
  final IntroScreen introScreen;

  const IntroScreenWidget({required this.introScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: introScreen.color.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: SizedBox(
                height: 320,
                child: Image.asset(
                  introScreen.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      introScreen.title,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      introScreen.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
