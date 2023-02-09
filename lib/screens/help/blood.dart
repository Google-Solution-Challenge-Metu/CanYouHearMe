import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';



class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});
  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4E6C50),
        title: Text("Locations for DONATION"),
      ),
      body: Container(
        child: Column(
          children: [
            
            AspectRatio(
              aspectRatio: 9/16,
              child: WebView(
                initialUrl: 'https://www.kizilay.org.tr',
                initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
                javascriptMode: JavascriptMode.unrestricted,
                debuggingEnabled: false,
                javascriptChannels: Set.from([
                  JavascriptChannel(name: 'flutter', onMessageReceived: (JavascriptMessage message){
                    if(message.message=='onSubscribeClick'){
                      print('onSubscribeClick');
                    }
                  }),
                ]),
                onWebResourceError: (webresourceerror){
                  print(webresourceerror.domain.toString());
                },
                onPageStarted: (String page){},
                onPageFinished: (String page){},
                onWebViewCreated: (WebViewController webviewcontroller){
                  try{}catch(error, stackTrace){}
                },
              )),

          ],)
          

        )
           
          
        );
      
    
  }
}
