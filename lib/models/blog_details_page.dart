import 'package:dietapp/models/data.dart';
import 'package:flutter/material.dart';

class BlogDetailsPage extends StatefulWidget {
  final DataModel data;
  const BlogDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.data.title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.data.imageName,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.data.context,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontFamily: "Quicksand"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
