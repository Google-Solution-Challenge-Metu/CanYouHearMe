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
          "Donate a Box",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        child: const Icon(
          Icons.add,
          size: 35.0,
        ),
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
                  style: GoogleFonts.prozaLibre(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.355,
                    color: Color(0xffe97d47),
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
              //return GridView.builder(
              //  padding: const EdgeInsets.all(12),
              //  physics: const AlwaysScrollableScrollPhysics(),
              //  itemCount: value.shopItems.length,
              //  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //    crossAxisCount: 2,
              //    childAspectRatio: 1 / 1.2,
              //  ),
              //  itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        //HelpBoxItemTile(
                        //  itemName: value.shopItems[index][0],
                        //  itemPrice: value.shopItems[index][1],
                        //  imagePath: value.shopItems[index][2],
                        //  color: value.shopItems[index][3],
                        //  onPressed: () =>
                        //      Provider.of<CartModel>(context, listen: false)
                        //          .addItemToCart(index),
                        //),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HelpBoxItemTile(
                              itemName: "Clothes",
                              itemPrice: "1",
                              imagePath: "assets/images/box_clothes.png",
                              color: Color(0xffd9d9d9),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(0),
                            ),
                            HelpBoxItemTile(
                              itemName: "Packed Foods",
                              itemPrice: "1",
                              imagePath: "assets/images/box_food.png",
                              color: Color(0xffd9d9d9),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(1),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HelpBoxItemTile(
                              itemName: "Toys",
                              itemPrice: "1",
                              imagePath: "assets/images/box_toys.png",
                              color: Color(0xffd9d9d9),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(2),
                            ),
                            HelpBoxItemTile(
                              itemName: "Use AI",
                              itemPrice: "1",
                              imagePath: "assets/images/box_ai.png",
                              color: Color(0xffd9d9d9),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TfliteModel();
                                  },
                                ),
                        ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );               
                },
          ),
        ),
      ]),
    );
  }
}
