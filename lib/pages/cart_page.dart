import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/cart_model.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.notoSerif(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: value.read(userCartProvider).isEmpty
                      ? const Center(
                          child: Text("Cart is empty"),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: value.read(userCartProvider).length,
                          itemBuilder: (context, index) {
                            final cart = value.watch(userCartProvider);
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: ListTile(
                                tileColor: Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                leading: Image.asset(
                                  cart[index][2],
                                  height: 35,
                                ),
                                title: Text(cart[index][0]),
                                subtitle: Text('\$${cart[index][1]}'),
                                trailing: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(userCartProvider.notifier)
                                        .removeItem(index);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Price",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$${value.read(userCartProvider.notifier).getTotal()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            children: [
                              Text(
                                "Pay now",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
