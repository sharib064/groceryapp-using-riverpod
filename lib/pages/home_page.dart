import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/utils/grocery_item_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        shape: const CircleBorder(eccentricity: 0),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Good morning"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Let's order some fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fresh items",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.read(shopItemsProvider).length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                    itemBuilder: (context, index) {
                      final items = value.read(shopItemsProvider);
                      return GroceryItemTile(
                        itemName: items[index][0],
                        itemPrice: items[index][1],
                        imagePath: items[index][2],
                        color: items[index][3],
                        onPressed: () {
                          ref
                              .read(userCartProvider.notifier)
                              .addCartItem(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Item added to cart successfully",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
