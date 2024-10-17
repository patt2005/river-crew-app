import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/models/tip.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:river_crew_app/widgets/tip_card.dart';

class TipsListPage extends StatefulWidget {
  const TipsListPage({super.key});

  @override
  State<TipsListPage> createState() => _TipsListPageState();
}

class _TipsListPageState extends State<TipsListPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedId = "Safety";

  Widget _buildCategoryView(AppService provider, String categoryId) {
    List<Tip> filteredBasics =
        provider.tipsList.where((b) => b.categoryId == categoryId).toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredBasics.length,
      itemBuilder: (context, index) {
        final basicsItem = filteredBasics[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TipCard(tip: basicsItem),
        );
      },
    );
  }

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
                "Tips of Kayaking:",
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
                for (int i = 0; i < provider.basicsList.length; i++)
                  GestureDetector(
                    onTap: () {
                      _tabController.animateTo(i);
                      setState(() {
                        _selectedId = provider.basicsList[i].categoryId;
                      });
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
            _buildCategoryView(provider, _selectedId),
            SizedBox(height: size.height * 0.12),
          ],
        ),
      ),
    );
  }
}
