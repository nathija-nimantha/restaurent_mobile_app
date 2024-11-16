import 'package:flutter/material.dart';
import 'food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for categories and food items
    final List<String> categories = ['Starters', 'Mains', 'Desserts', 'Drinks'];
    final List<Map<String, dynamic>> foodItems = [
      {'image': 'assets/images/burger.jpg', 'name': 'Burger', 'price': 8.99, 'rating': 4.5},
      {'image': 'assets/images/pasta.jpg', 'name': 'Pasta', 'price': 12.99, 'rating': 4.0},
      // Add more items as needed...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
      ),
      body: Column(
        children: [
          // Category List
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(label: Text(categories[index])),
                );
              },
            ),
          ),
          // Food Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailScreen(
                          image: item['image'],
                          name: item['name'],
                          price: item['price'],
                          rating: item['rating'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(item['image'], height: 80),
                        Text(item['name'], style: const TextStyle(fontSize: 16)),
                        Text('\$${item['price']}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text('${item['rating']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
