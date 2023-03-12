import 'package:dietapp/screens/home/makeyourvoiceheard/missing_post_page.dart';
import 'package:flutter/material.dart';

class PostOptions extends StatefulWidget {
  const PostOptions({super.key});

  @override
  State<PostOptions> createState() => _PostOptionsState();
}

showOptions(context){
  showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Choose What You Want To Report"),
            children: [
              SimpleDialogOption(
                onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MissingPostPage()),
                  ),
                child: const Text("Report A Missing Person"),
              ),
              SimpleDialogOption(
                onPressed: () => null,
                child: const Text("Report A Debris Building or Needs"),
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