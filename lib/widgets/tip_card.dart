import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_crew_app/models/tip.dart';
import 'package:river_crew_app/utils/provider.dart';
import 'package:river_crew_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

class TipCard extends StatelessWidget {
  final Tip tip;

  const TipCard({
    super.key,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppService>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: kforbutton),
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1B1B1B),
              Color(0xFF070707),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.info,
              color: kforbutton,
            ),
            const SizedBox(height: 10),
            Text(
              tip.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              tip.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (tip.isSaved) {
                      _showUnsaveDialog(context);
                      return;
                    }
                    value.changeTipSavedStatus(tip);
                  },
                  icon: value.tipsList.firstWhere((e) => e == tip).isSaved
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
                    await Share.share(tip.title);
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
                  "Are you sure you want to unsave this tip?",
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
                        provider.changeTipSavedStatus(tip);
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
