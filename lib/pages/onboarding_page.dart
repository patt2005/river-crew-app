import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:river_crew_app/models/onboarding_info.dart';
import 'package:river_crew_app/pages/nav_bar_page.dart';
import 'package:river_crew_app/utils/utils.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();

  Widget _buildOnboardingPage(OnboardingInfo info, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              info.imageAssetPath,
              width: double.infinity,
              height: size.height * 0.3,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Text(
            info.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            info.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
            onTap: () async {
              if (index == onboardingInfos.length - 1) {
                await Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => const NavBarPage(),
                  ),
                );
                return;
              }
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
            },
            child: Container(
              width: size.width * 0.75,
              height: size.height * 0.064, // Înălțimea containerului
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kforbutton,
                    kfortext,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14), // Colțuri rotunjite
              ),
              child: Center(
                child: Text(
                  info.buttonText,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      color: kPriaryColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < onboardingInfos.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5),
                    color:
                        i == index ? kforbutton : kforbutton.withOpacity(0.4),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: PageView(
        controller: _pageController,
        children: [
          for (int i = 0; i < onboardingInfos.length; i++)
            _buildOnboardingPage(onboardingInfos[i], i)
        ],
      ),
    );
  }
}
