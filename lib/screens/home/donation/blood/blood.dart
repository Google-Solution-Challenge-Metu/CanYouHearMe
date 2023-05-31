import 'package:easy_localization/easy_localization.dart';
import "package:flutter/material.dart";
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../translations/locale_keys.g.dart';
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
  var initialURL = "https://www.kanver.org/KanHizmetleri/KanBagisiNoktalari";
  double progress = 0;
  var urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.donation_blood_page_title.tr(),
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
        actions: [
          IconButton(
            onPressed: () {
              webViewController!.reload();
            },
            icon: Icon(Icons.refresh),
            color: Color(0xffe97d47),
          ),
          IconButton(
              onPressed: () async {
                if (await webViewController!.canGoBack()) {
                  webViewController!.goBack();
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xffe97d47),
              )),
          IconButton(
            onPressed: () async {
              if (await webViewController!.canGoForward()) {
                webViewController!.goForward();
              }
            },
            icon: Icon(Icons.arrow_forward),
            color: Color(0xffe97d47),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              onWebViewCreated: (controller) => webViewController = controller,
              initialUrlRequest: URLRequest(url: Uri.parse(initialURL)),
            ),
          ),
        ],
      ),
    );
  }
}
