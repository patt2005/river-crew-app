import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:river_crew_app/pages/onboarding_page.dart';
import 'package:river_crew_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obține dimensiunea ecranului

    return Scaffold(
      backgroundColor:
          kBackgroundColor, // Asigură-te că această culoare este definită
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20), // Spațiu între partea de sus și imagine
            SizedBox(
              width: size.width, // Image takes the full width of the screen
              height: size.height * 0.45, // 45% of the screen height
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/Designer (17) 1.png", // Make sure the image path is correct
                      fit: BoxFit.cover, // Covers the entire container
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6), // Dark overlay
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Spațiu între imagine și text
            const Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            // Folosește RichText pentru a aplica gradient pe text
            Center(
              // Adăugat widget Center pentru a centra textul
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "River Crew: Kayak Tips",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              kforbutton,
                              kfortext,
                              kfortext1,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(Rect.fromLTWH(0, 0, size.width,
                              50)), // Dimensiunea gradientului aplicat
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    "Discover essential tips and tricks to enhance your kayaking experience.\n Let’s get you started!",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Montserrat",
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3, // Limitează la 3 rânduri
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                await Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => const OnboardingPage(),
                  ),
                );
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
                    "Get Started",
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
          ],
        ),
      ),
    );
  }
}
