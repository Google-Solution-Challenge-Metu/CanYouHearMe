import 'dart:async';
import 'dart:io';

import 'package:dietapp/wearOS_module/wear_sos.dart';
import 'package:flutter/material.dart';
import 'package:dietapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:watch_connectivity_garmin/watch_connectivity_garmin.dart';
import 'package:wear/wear.dart';


class wear_login extends StatefulWidget {
  const wear_login({Key? key}) : super(key: key);

  @override
  State<wear_login> createState() => _wear_loginState();
}

class _wear_loginState extends State<wear_login> {
  

  double heartRate = 0;
  bool started = false;

  late final WatchConnectivityBase _watch;

  var _count = 0;
  var _email="";
  var _password="";
  var _supported = false;
  var _paired = false;
  var _reachable = false;
  var _permission = false;
  var _context = <String, dynamic>{};
  var _receivedContexts = <Map<String, dynamic>>[];
  final _log = <String>[];

  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Change this to the plugin you want to test.
    // e.g. `_watch = WatchConnectivityGarmin();`
    _watch = WatchConnectivity();

    if (_watch is WatchConnectivityGarmin) {
      (_watch as WatchConnectivityGarmin).initialize(
        GarminInitializationOptions(
          applicationId: 'daed64bf-ecee-4b75-b736-f0f834801d6a',
          urlScheme: 'watch-connectivity-example',
        ),
      );
    }
    _watch.messageStream
        .listen((e) => 
        setState(() => Listener(e))
      );

    if (_watch is! WatchConnectivityGarmin) {
      _watch.contextStream
          .listen((e) => setState(() => _log.add(e.toString())));
    }
    
    initPlatformState();
  }

  signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return sos_page();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        wrongEmailMessage();
      } else if (e.code == "wrong-password") {
        wrongPasswordMessage();
      } else {
        nothingMessage();
      }
    }
  }

  void Listener(e){
    setState(() => _log.add(e.toString()));
    setState(() {
      _email=e["email"];
      _password=e["password"];
    });
    print(e["email"]);
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            "Incorrect email.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
  
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            "Incorrect password.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void nothingMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            "No email, password or both.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() async {
    PermissionCheck();
    _supported = await _watch.isSupported;
    _paired = await _watch.isPaired;
    _reachable = await _watch.isReachable;
    if (_watch is! WatchConnectivityGarmin) {
      _context = await _watch.applicationContext;
      _receivedContexts = await _watch.receivedApplicationContexts;
    }
    if (this.mounted){
      setState(() {});
    }
  }

  void PermissionCheck() async{
    if (_password=="" ){
      _permission=false;
    }else{
      _permission=true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  height: 20,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Supported: '),
                    Checkbox(
                      value: _supported,
                      activeColor: Color(0xffe97d47), 
                      onChanged: null)
                ],),
                ),
                SizedBox(height: 5),
                Container(
                  height: 20,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Paired:        '),
                      Checkbox(
                        value: _paired,
                        activeColor: Color(0xffe97d47), 
                        onChanged: null)
                ],),),
                SizedBox(height: 5),
                Container(
                  height: 20,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Reachable: '),
                      Checkbox(
                        value: _reachable,
                        activeColor: Color(0xffe97d47), 
                        onChanged: null)
                ],),),
                SizedBox(height: 5),
                Container(
                  height: 20,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Permission:'),
                      Checkbox(
                        value: _permission,
                        activeColor: Color(0xffe97d47), 
                        onChanged: null)
                ],),),
                //if (_watch is! WatchConnectivityGarmin) ...[
                //  Text('Context: $_context'),
                //  //Text('Received contexts: $_receivedContexts'),
                //],
                TextButton(
                  onPressed: initPlatformState,
                  child: const Text('Refresh',style: TextStyle(color: Color(0xffe97d47)),),
                ),
                if (_watch is WatchConnectivityGarmin && Platform.isIOS)
                  TextButton(
                    onPressed:
                        (_watch as WatchConnectivityGarmin).showDeviceSelection,
                    child: const Text('Open device selection'),
                  ),
                //const SizedBox(height: 8),
                //const Text('Send'),
                //Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                //  children: [
                //    TextButton(
                //      onPressed: sendMessage,
                //      child: const Text('Message'),
                //    ),
                //    if (_watch is! WatchConnectivityGarmin) ...[
                //      const SizedBox(width: 8),
                //      TextButton(
                //        onPressed: sendContext,
                //        child: const Text('Context'),
                //      ),
                //    ],
                //  ],
                //),
                Container(
                  child: TextButton(
                    onPressed: signUserIn,
                    child: Text(
                      'Log In',style: TextStyle(color: Color(0xffe97d47)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                //const Text('Log'),
                //..._log.reversed.map(Text.new),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    final message = {'bpm': '$heartRate'};
    _watch.sendMessage(message);
    setState(() => _log.add('Sent message: $message'));
  }

  void sendContext() {
    _count++;
    final context = {'data': _count};
    _watch.updateApplicationContext(context);
    setState(() => _log.add('Sent context: $context'));
  }

  void toggleBackgroundMessaging() {
    if (timer == null) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => sendMessage());
    } else {
      timer?.cancel();
      timer = null;
    }
    setState(() {});
  }
}