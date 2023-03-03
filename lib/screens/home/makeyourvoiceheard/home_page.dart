import 'package:dietapp/screens/home/makeyourvoiceheard/post_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/services/report_service.dart';
import 'package:flutter/material.dart';

class MakeYourVoiceHeardPage extends StatefulWidget {
  const MakeYourVoiceHeardPage({super.key});
  @override
  State<MakeYourVoiceHeardPage> createState() => _MakeYourVoiceHeardPageState();
}

class _MakeYourVoiceHeardPageState extends State<MakeYourVoiceHeardPage> {
  final ReportService _reportService = ReportService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xffe97d47),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Make Your Voice Heard",
          style: TextStyle(
            color: Color(0xffe97d47),
          ),
        ),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              "Reports",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(),
          ),
          StreamBuilder(
            stream: _reportService.getStatus(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot myReport = snapshot.data!.docs[index];
                        Widget imagePlace(height) {
                          if (myReport["image"] != "") {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image(
                                height: height,
                                image: NetworkImage(myReport["image"]),
                              ),
                            );
                          } else {
                            return const SizedBox(
                              height: 10.0,
                            );
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/profile_anonym.webp"),
                                          ),
                                        ),
                                        Text('Name'),
                                        Text('Date'),
                                      ],
                                    ),
                                    Text(
                                      "${myReport['status']}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      child: imagePlace(size.height * 0.3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // Go to CartPage
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
