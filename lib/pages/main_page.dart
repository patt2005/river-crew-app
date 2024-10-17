import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/models/basics.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:river_crew_app/widgets/basics_card.dart';
import 'package:river_crew_app/widgets/tip_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final _pageController = PageController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCategoryView(AppService provider, String categoryId) {
    List<Basics> filteredBasics =
        provider.basicsList.where((b) => b.categoryId == categoryId).toList();

    return ListView.builder(
      itemCount: filteredBasics.length,
      itemBuilder: (context, index) {
        final basicsItem = filteredBasics[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BasicsCard(basics: basicsItem),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppService>(context, listen: false);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text(
                "Basic tips:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              height: size.height * 0.28,
              child: PageView(
                controller: _pageController,
                children: [
                  for (var tip in provider.tipsList.take(5)) TipCard(tip: tip),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 5,
                effect: ExpandingDotsEffect(
                  activeDotColor: kforbutton,
                  dotColor: Colors.grey,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            DefaultTabController(
              length: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text(
                      "Read the most important basics:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < basics.length; i++)
                        GestureDetector(
                          onTap: () {
                            _tabController.animateTo(i);
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: _tabController.index == i
                                ? BoxDecoration(
                                    color: kBackgroundColor,
                                    border: Border.all(color: kforbutton),
                                    borderRadius: BorderRadius.circular(5),
                                  )
                                : null,
                            child: Text(
                              provider.basicsList[i].categoryId,
                              style: TextStyle(
                                color: _tabController.index == i
                                    ? kforbutton
                                    : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: size.width * 0.03,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.4,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildCategoryView(provider, 'Safety'),
                        _buildCategoryView(provider, 'Techniques'),
                        _buildCategoryView(provider, 'Equipment'),
                        _buildCategoryView(provider, 'Preparation'),
                        _buildCategoryView(provider, 'Community'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
