import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/models/basics.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class BasicsListPage extends StatefulWidget {
  const BasicsListPage({super.key});

  @override
  State<BasicsListPage> createState() => _BasicsListPageState();
}

class _BasicsListPageState extends State<BasicsListPage>
    with TickerProviderStateMixin {
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

  Widget _buildBasicsTextCard(Basics basics) {
    return SingleChildScrollView(
      child: Consumer<AppService>(
        builder: (context, value, child) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF141414),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                basics.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                basics.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      value.changeBasicsSavedStatus(basics);
                    },
                    icon:
                        value.basicsList.firstWhere((e) => e == basics).isSaved
                            ? Icon(
                                CupertinoIcons.bookmark_fill,
                                color: kforbutton,
                              )
                            : const Icon(
                                CupertinoIcons.bookmark,
                                color: Colors.white,
                              ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Share.share(basics.title);
                    },
                    icon: const Icon(
                      CupertinoIcons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppService>(context, listen: false);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
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
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBasicsTextCard(provider.basicsList[0]),
                _buildBasicsTextCard(provider.basicsList[1]),
                _buildBasicsTextCard(provider.basicsList[2]),
                _buildBasicsTextCard(provider.basicsList[3]),
                _buildBasicsTextCard(provider.basicsList[4]),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.13),
        ],
      ),
    );
  }
}
