import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:river_crew_app/pages/basics_list_page.dart';
import 'package:river_crew_app/pages/main_page.dart';
import 'package:river_crew_app/pages/saved_info_list_page.dart';
import 'package:river_crew_app/pages/tips_list_page.dart';
import 'package:river_crew_app/utils/utils.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedTabIndex = 0;

  final List<Widget> _pagesList = [
    const MainPage(),
    const TipsListPage(),
    const BasicsListPage(),
    const SavedInfoListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            _pagesList[_selectedTabIndex],
            Positioned(
              right: 15,
              left: 15,
              bottom: 15,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: kforbutton),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1B1B1B),
                      Color(0xFF070707),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(7),
                        border: _selectedTabIndex == 0
                            ? Border.all(color: kforbutton)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedTabIndex = 0;
                          });
                        },
                        icon: const Icon(CupertinoIcons.square_grid_2x2_fill),
                        color:
                            _selectedTabIndex == 0 ? kforbutton : Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(7),
                        border: _selectedTabIndex == 1
                            ? Border.all(color: kforbutton)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedTabIndex = 1;
                          });
                        },
                        icon: const Icon(CupertinoIcons.bubble_left_fill),
                        color:
                            _selectedTabIndex == 1 ? kforbutton : Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(7),
                        border: _selectedTabIndex == 2
                            ? Border.all(color: kforbutton)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedTabIndex = 2;
                          });
                        },
                        icon: const Icon(CupertinoIcons.list_bullet),
                        color:
                            _selectedTabIndex == 2 ? kforbutton : Colors.grey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(7),
                        border: _selectedTabIndex == 3
                            ? Border.all(color: kforbutton)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedTabIndex = 3;
                          });
                        },
                        icon: const Icon(CupertinoIcons.bookmark_solid),
                        color:
                            _selectedTabIndex == 3 ? kforbutton : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
