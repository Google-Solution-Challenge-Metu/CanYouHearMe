import "package:flutter/material.dart";
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});
  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen> {

  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  var initialURL ="https://www.kanver.org/KanHizmetleri/KanBagisiNoktalari";
  double progress=0;
  var urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locations for DONATION',
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffe97d47),
          ),
        ),
      ),      
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(initialURL)),
            ),
          ),
        ],
      ),
    );
  }
}
