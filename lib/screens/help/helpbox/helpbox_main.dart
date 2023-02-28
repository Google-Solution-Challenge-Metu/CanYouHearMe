import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'cart_page.dart';
import 'boxes_item_tile.dart';
import 'help_tflite.dart';

class HelpBoxHomePage extends StatefulWidget {
  const HelpBoxHomePage({super.key});

  @override
  State<HelpBoxHomePage> createState() => _HelpBoxHomePageState();
}

class _HelpBoxHomePageState extends State<HelpBoxHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Donate a Box",
          style: TextStyle(
            color:Color.fromARGB(255, 0, 0, 0) 
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Go to CartPage
        backgroundColor: Color(0xffe97d47),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),

        // Let's report some boxes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Set up a donation box let us take it from your address.",
                  style: GoogleFonts.notoSerif(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 1.355,
                    color: Color(0xffe97d47),
                  ),
                ),
              ),
              Expanded(
                // Extra Button for AI page.
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffd9d9d9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      // item image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Image.asset(
                          "assets/images/box_ai.png",
                          height: 64,
                        ),
                      ),
                      

                      // item name
                      Text(
                        "Use AI",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),

                      MaterialButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TfliteModel();
                            },
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: Color(0xffe97d47),
                        child: const Text(
                          'Add ' + "1" + ' Box',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Divider(),
        ),

        const SizedBox(height: 12),

        // categories -> horizontal listview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Boxes:",
            style: GoogleFonts.notoSerif(
              //fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          // add items one by one
          child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return HelpBoxItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () =>
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
