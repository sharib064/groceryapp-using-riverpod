import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final void Function()? onPressed;
  const GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[200],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 60,
            ),
            Text(itemName),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: onPressed,
              color: color[700],
              child: Text(
                '\$ $itemPrice',
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
