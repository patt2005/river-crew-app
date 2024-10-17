import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/models/basics.dart';
import 'package:river_crew_app/pages/basics_info_page.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class BasicsCard extends StatelessWidget {
  final Basics basics;

  const BasicsCard({
    super.key,
    required this.basics,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppService>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              basics.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              basics.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (basics.isSaved) {
                          _showUnsaveDialog(context);
                          return;
                        }
                        value.changeBasicsSavedStatus(basics);
                      },
                      icon: value.basicsList
                              .firstWhere((e) => e == basics)
                              .isSaved
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
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    gradient: LinearGradient(
                      colors: [
                        kforbutton,
                        kfortext,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => BasicsInfoPage(basics: basics),
                        ),
                      );
                    },
                    child: const Text(
                      "Read now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showUnsaveDialog(BuildContext context) {
    final provider = Provider.of<AppService>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: kBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/onboarding6.png', // Your image path
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Are you sure you want to unsave this basics?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: kforbutton,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        provider.changeBasicsSavedStatus(basics);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Unsave",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
