import 'package:dietapp/screens/home/makeyourvoiceheard/debris_post/debris_post_page.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/missing_post/missing_post_page.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Choose what you want to report"),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MissingPostPage()),
              );
            },
            child: const Text("Report a missing person"),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DebrisPostPage()),
            ),
            child: const Text("Report a debris building or needs"),
          ),
          SimpleDialogOption(
            child: const Text("Cancel"),
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
