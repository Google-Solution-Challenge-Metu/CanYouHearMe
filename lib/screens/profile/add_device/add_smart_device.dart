import 'package:dietapp/screens/components/CustomSnackBarContent.dart';
import 'package:dietapp/screens/profile/add_device/send_tile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:watch_connectivity_garmin/watch_connectivity_garmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'check_tile.dart';

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
    if (this.mounted){
      setState(() {
        email = value!['email'];
        password = value['password'];
      });
    }  
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
    setState(() => _log.add('Notice: You have been sent "connection key" to your smart device. Please refresh your smart device.'));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: CustomSnackBarContent(
        errorText: "Connecting to your device",
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void cannotsendMessage(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: CustomSnackBarContent(
        errorText: "Please check your connection",
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
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
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context)=> SimpleDialog(
                      title: const Text("Add A Smart Device"),
                      contentPadding: const EdgeInsets.all(20.0),
                      children: [
                        const Text(" Supported:\n \nCheck if your device is supported by the current platform. \n \n \nPairable:\n \nTo provide your device. Please make sure that Wear OS or Galaxy Wearable apps are installed. \n \n \nReachable:\n \nCheck if your smart device connected to your phone and ready to send a connection key."),
                        TextButton(
                          onPressed:() {
                            Navigator.of(context).pop();
                          }, 
                          child: const Text("Close", style: TextStyle(color:Color(0xffe97d47) ),),
                        )
                      ],

                    )
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Color(0xffe97d47),
                ),
              ),
            )
          ],
      ),

      body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/watch_vector.png',
                        ),
                      ),
                      //shape: BoxShape.circle,
                      color: Color.fromARGB(255, 251, 190, 160),
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                ),
                CheckTile(
                  Titles: 'Supported:',
                  bools: _supported,
                  iconss: Icons.devices_other_outlined,
                ),
                CheckTile(
                  Titles: 'Pairable:',
                  bools: _paired,
                  iconss: Icons.bluetooth_connected,
                ),
                CheckTile(
                  Titles: 'Reachable:',
                  bools: _reachable,
                  iconss: Icons.access_time_outlined,
                ),

                if (_watch is WatchConnectivityGarmin && Platform.isIOS)
                  TextButton(
                    onPressed:
                        (_watch as WatchConnectivityGarmin).showDeviceSelection,
                    child: const Text('Open device selection'),
                  ),
                const SizedBox(height: 8),
                
                Padding(
                padding: EdgeInsets.only(left:20,right: 20,top:20),
                child:
                  (_supported&_paired&_reachable)?
                  SendTile(
                    colorset: Color(0xffe97d47),
                    func: sendMessage,
                  ):
                  SendTile(
                    colorset: Color.fromARGB(255, 161, 142, 133),
                    func: cannotsendMessage,
                  ),
                ),
                const SizedBox(width: 50),
                const Text('Log'),
                ..._log.reversed.map(Text.new),
              ],
            ),
          ),
      
      floatingActionButton: FloatingActionButton(     // refresh
        backgroundColor: Color(0xffe97d47),
        onPressed: initPlatformState,
        tooltip: "Refresh the page",
        child: const Icon(Icons.cached_outlined),
      ),
    );
  }
}
