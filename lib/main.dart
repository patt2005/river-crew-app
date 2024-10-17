import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/home.page.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => AppService(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false, // Scoatem bannerul DEBUG
      home: const HomePage(),
    );
  }
}
