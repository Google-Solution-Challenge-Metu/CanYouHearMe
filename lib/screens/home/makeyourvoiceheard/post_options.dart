import 'package:dietapp/screens/home/makeyourvoiceheard/debris_post/debris_post_page.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/missing_post/missing_post_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';

class PostOptions extends StatefulWidget {
  const PostOptions({super.key});

  @override
  State<PostOptions> createState() => _PostOptionsState();
}

showOptions(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text(LocaleKeys.make_your_voice_heard_choose.tr()),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MissingPostPage()),
              );
            },
            child: Text(LocaleKeys.make_your_voice_heard_report_missing.tr()),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DebrisPostPage()),
            ),
            child: Text(LocaleKeys.make_your_voice_heard_report_debris.tr()),
          ),
          SimpleDialogOption(
            child:
                Text(LocaleKeys.make_your_voice_heard_debris_page_cancel.tr()),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

class _PostOptionsState extends State<PostOptions> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
