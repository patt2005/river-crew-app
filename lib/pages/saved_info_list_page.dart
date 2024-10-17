import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:river_crew_app/widgets/basics_card.dart';
import 'package:river_crew_app/widgets/tip_card.dart';

class SavedInfoListPage extends StatefulWidget {
  const SavedInfoListPage({super.key});

  @override
  State<SavedInfoListPage> createState() => _SavedInfoListPageState();
}

class _SavedInfoListPageState extends State<SavedInfoListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kforbutton,
                  width: 2,
                ),
              ),
            ),
            labelColor: kforbutton,
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            tabs: const [
              Tab(text: 'Saved tips'),
              Tab(text: 'Saved basics'),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Consumer<AppService>(
            builder: (context, value, child) => Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  provider.tipsList.where((e) => e.isSaved).toList().isEmpty
                      ? const Center(
                          child: Text(
                            'Saved tips list is empty.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsetsDirectional.only(
                              bottom: size.height * 0.11),
                          child: ListView.builder(
                            itemCount: provider.tipsList
                                .where((e) => e.isSaved)
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              return TipCard(
                                tip: provider.tipsList
                                    .where((e) => e.isSaved)
                                    .toList()[index],
                              );
                            },
                          ),
                        ),
                  provider.basicsList.where((e) => e.isSaved).toList().isEmpty
                      ? const Center(
                          child: Text(
                            'Saved basics list is empty.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsetsDirectional.only(
                              bottom: size.height * 0.11),
                          child: ListView.builder(
                            itemCount: provider.basicsList
                                .where((e) => e.isSaved)
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: BasicsCard(
                                  basics: provider.basicsList
                                      .where((e) => e.isSaved)
                                      .toList()[index],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
