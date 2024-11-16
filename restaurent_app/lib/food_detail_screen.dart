import 'package:flutter/material.dart';
import 'order_screen.dart';

class FoodDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;
  final String description;

  const FoodDetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    this.description = 'A delicious meal to satisfy your taste buds.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(image, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('\$${price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 24),
                    Text('${rating.toString()}', style: const TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderScreen()),
                    );
                  },
                  child: const Text('Order Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
