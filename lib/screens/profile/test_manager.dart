import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:workmanager/workmanager.dart';

class TestManager extends StatefulWidget {
  const TestManager({super.key});

  @override
  State<TestManager> createState() => _TestManagerState();
}

class _TestManagerState extends State<TestManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("SOS Button",style: TextStyle(color: Color(0xffe97d47)),),
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
                      title: const Text("SOS Button"),
                      contentPadding: const EdgeInsets.all(20.0),
                      children: [
                        const Text("Use when needed!"),
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
      body: Center(
        child: ElevatedButton(onPressed: () {
          var uniqueId=DateTime.now().second.toString();
          Workmanager().registerPeriodicTask(
            uniqueId, 
            'print',
            frequency: Duration(seconds: 15),
            initialDelay: Duration(seconds: 10),
            constraints: Constraints(networkType: NetworkType.connected),
          );
        },
        child: Text("Shedule Task"),
        )
      ),
    );
  }
}