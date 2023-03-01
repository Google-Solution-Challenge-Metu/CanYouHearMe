import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:watch_connectivity_garmin/watch_connectivity_garmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String email = "";
  String password = "";

  late final WatchConnectivityBase _watch;

  var _count = 0;

  var _supported = false;
  var _paired = false;
  var _reachable = false;
  var _context = <String, dynamic>{};
  var _receivedContexts = <Map<String, dynamic>>[];
  final _log = <String>[];

  Timer? timer;

  FirebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    setState(() {
      email = value!['email'];
      password = value['password'];
    });
  }

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
        .listen((e) => setState(() => _log.add('Received message: $e')),);

    if (_watch is! WatchConnectivityGarmin) {
      _watch.contextStream
          .listen((e) => setState(() => _log.add('Received context: $e')));
    }

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() async {
    _supported = await _watch.isSupported;
    _paired = await _watch.isPaired;
    _reachable = await _watch.isReachable;
    if (_watch is! WatchConnectivityGarmin) {
      _context = await _watch.applicationContext;
      _receivedContexts = await _watch.receivedApplicationContexts;
    }
    setState(() {});
  }

  void sendMessage() {
    final message = {"email": email, "password":password};
    _watch.sendMessage(message);
    setState(() => _log.add('email:'+message["email"].toString()));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseDocument();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Add a Smart Device",style: TextStyle(color: Color(0xffe97d47)),),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xffe97d47),
            ),
          ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(email),
                Text(password),
                Text('Supported: $_supported'),
                Text('Paired: $_paired'),
                Text('Reachable: $_reachable'),
                if (_watch is! WatchConnectivityGarmin) ...[
                  Text('Context: $_context'),
                  //Text('Received contexts: $_receivedContexts'),
                ],
                TextButton(
                  onPressed: initPlatformState,
                  child: const Text('Refresh',style: TextStyle(color: Color.fromARGB(255, 31, 177, 107)),),
                ),
                if (_watch is WatchConnectivityGarmin && Platform.isIOS)
                  TextButton(
                    onPressed:
                        (_watch as WatchConnectivityGarmin).showDeviceSelection,
                    child: const Text('Open device selection'),
                  ),
                const SizedBox(height: 8),
                const Text('Send'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: sendMessage,//sendMessage,
                      child: const Text('Message'),
                    ),
                    if (_watch is! WatchConnectivityGarmin) ...[
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: sendMessage,//sendContext,
                        child: const Text('Context'),
                      ),
                    ],
                  ],
                ),
                TextButton(
                  onPressed: sendMessage,//toggleBackgroundMessaging,
                  child: Text(
                    '${timer == null ? 'Start' : 'Stop'} background messaging',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 16),
                const Text('Log'),
                ..._log.reversed.map(Text.new),
              ],
            ),
          ),
        ),
      ),
    );
  }
}