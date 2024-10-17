import 'package:flutter/material.dart';
import 'package:river_crew_app/models/basics.dart';
import 'package:river_crew_app/models/tip.dart';

class AppService extends ChangeNotifier {
  List<Tip> get tipsList => tips;
  List<Basics> get basicsList => basics;

  void changeTipSavedStatus(Tip tip) {
    var foundTip = tipsList.firstWhere((e) => e == tip);
    foundTip.isSaved = !foundTip.isSaved;
    notifyListeners();
  }

  void changeBasicsSavedStatus(Basics basics) {
    var foundBasics = basicsList.firstWhere((e) => e == basics);
    foundBasics.isSaved = !foundBasics.isSaved;
    notifyListeners();
  }
}
