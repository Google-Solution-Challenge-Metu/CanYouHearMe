import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'cart_page.dart';
import 'boxes_item_tile.dart';
import 'help_tflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4E6C50),
        title: Text("Help Box"),
      ),
      floatingActionButton: FloatingActionButton(       // Go to CartPage
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(       
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),

        // Let's report some boxes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(child: Text(
                "Prepare your box, We'll take them.",
                style: GoogleFonts.notoSerif(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,),
                  ), 
              ),
              Expanded(                                    // Extra Button for AI page.
                child: Container( 
                  height: 215,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                    // item image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Image.asset(
                          "assets/images/google.png",
                          height: 64,
                        ),
                      ),
                      SizedBox(height: 20),

                      // item name
                      Text(
                        "Use AI",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      MaterialButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TfliteModel();
                            },
                          ),
                        ),
                        color: Color(0xFF4E6C50),
                        child: Text(
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
        Expanded(  // add items one by one
          child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
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
