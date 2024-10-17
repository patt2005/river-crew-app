import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:river_crew_app/models/basics.dart';
import 'package:river_crew_app/utils/utils.dart';

class BasicsInfoPage extends StatefulWidget {
  final Basics basics;

  const BasicsInfoPage({
    super.key,
    required this.basics,
  });

  @override
  State<BasicsInfoPage> createState() => _BasicsInfoPageState();
}

class _BasicsInfoPageState extends State<BasicsInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: kBackgroundColor,
        title: const Text("Basics"),
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              Text(
                widget.basics.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                widget.basics.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: size.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
