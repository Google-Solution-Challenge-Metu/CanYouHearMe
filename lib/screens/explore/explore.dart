import 'package:dietapp/models/blogpostwidget.dart';
import 'package:dietapp/models/blog_details_page.dart';
import "package:flutter/material.dart";

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final data = dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "Keşfet",
            style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                )),
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              "Blog Postları",
              style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlogModelWidget(
                  post.title,
                  post.imageName,
                  post.author,
                  post.date,
                  post.context,
                  () {},
                ),
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            itemCount: data.length,
          )
        ],
      ),
    );
  }
}
