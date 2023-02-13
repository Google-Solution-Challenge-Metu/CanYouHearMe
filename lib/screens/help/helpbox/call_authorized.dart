import 'package:flutter/material.dart';

class Callauthorized extends StatelessWidget {
  const Callauthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 222, 186),
      appBar: AppBar(
            backgroundColor: Color(0xFF4E6C50),
            title: Text("Call The Authorized"),
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
                        color: Color.fromARGB(255, 130, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  
                  const SizedBox(
                    height: 50.0,
                    width: 200.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 3.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buildTextField(null, "Name", false)),
                      Expanded(
                          child: buildTextField(
                              null, "Surname", false)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: buildTextField(null, "City", false)),
                      Expanded(
                          child: buildTextField(
                              null, "State", false)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(null, "Address", false),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(null, "Any Note", true),
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
                      
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 242, 222, 186),
                        backgroundColor: Color.fromARGB(255, 130, 0, 0),
                        padding: EdgeInsets.all(20.0),
                        fixedSize: Size(325, 80),
                        textStyle:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        elevation: 15,
                        shadowColor: Color.fromARGB(255, 130, 0, 0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 242, 222, 186), width: 4),
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
                          color: Color.fromARGB(255, 130, 0, 0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          " Turn back",
                          style: TextStyle(
                            color: Colors.white,
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
              "Sign In",
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
