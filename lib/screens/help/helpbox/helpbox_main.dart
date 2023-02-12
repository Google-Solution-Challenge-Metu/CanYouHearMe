import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_page.dart';
import 'boxes_item_tile.dart';

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
      floatingActionButton: FloatingActionButton(
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
        const SizedBox(height: 48),

        // good morning bro
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Good morning,'),
        ),

        const SizedBox(height: 4),

        // Let's order fresh items for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Prepare your box, we'll take them",
            style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
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
