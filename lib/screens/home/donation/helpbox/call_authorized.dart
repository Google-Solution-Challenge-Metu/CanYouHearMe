import 'package:dietapp/screens/components/CustomSnackBarContent.dart';
import 'package:flutter/material.dart';

class Callauthorized extends StatelessWidget {
  const Callauthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffe97d47),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Call The Authorized",
          style: TextStyle(color: Color(0xffe97d47)),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Call The Authorized",
                    style: TextStyle(
                        fontFamily: "Google",
                        fontSize: 30.0,
                        color: Color(0xffe97d47),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  
                  const SizedBox(
                    height: 25.0,
                    width: 200.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 3.0,
                    ),
                  ),
                  
                  Text(
                    "Fields marked with an * are required",
                    style: TextStyle(
                        fontFamily: "Google",
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buildTextField(null, "Name *", false)),
                      Expanded(
                          child: buildTextField(
                              null, "Surname *", false)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buildTextField(null, "City *", false)),
                      Expanded(
                          child: buildTextField(
                              null, "State *", false)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(null, "Address *", false),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(null, "Any Note (Optional)", true),
                  const SizedBox(
                    height: 20.0,
                  ),
                  
                  
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton.icon(
                    // DONATION BUTTON
                    icon: Icon(Icons.add_home_work_outlined),
                    label: Text('Call The Authorized'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomSnackBarContent(
                          errorText: "You are very thoughtful!",
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));                      
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xffe97d47),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.all(20.0),
                        fixedSize: Size(325, 80),
                        textStyle:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        elevation: 15,
                        shadowColor: Color(0xffe97d47),
                        side: const BorderSide(
                            color: Color(0xffe97d47), width: 4),
                        shape: StadiumBorder()),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Want to add more boxes?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          " Turn back",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Padding buildButton(Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          width: 150.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: const Color(0xFF698269),
              borderRadius: BorderRadius.circular(12.0)),
          child: const Center(
            child: Text(
              "",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextField(final controller, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
