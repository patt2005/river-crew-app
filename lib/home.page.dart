import 'package:flutter/material.dart';
import 'package:river_crew_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "images/Designer (17) 1.png",
                  fit: BoxFit.cover,
                  width: size.width * 0.8,
                  height: size.height * 0.25,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Welcome to River Crew: Kayak Tips",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
