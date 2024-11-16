import 'package:flutter/material.dart';
import 'food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Starters',
      'Mains',
      'Desserts',
      'Drinks',
      'Salads',
      'Sides',
      'Snacks'
    ];

    final List<Map<String, dynamic>> foodItems = [
      {'image': 'assets/images/burger.png', 'name': 'Burger', 'price': 8.99, 'rating': 4.5},
      {'image': 'assets/images/pasta.png', 'name': 'Pasta', 'price': 12.99, 'rating': 4.0},
      {'image': 'assets/images/salad.png', 'name': 'Caesar Salad', 'price': 7.99, 'rating': 4.3},
      {'image': 'assets/images/dessert.png', 'name': 'Chocolate Cake', 'price': 5.99, 'rating': 4.7},
      {'image': 'assets/images/drink.png', 'name': 'Lemonade', 'price': 3.99, 'rating': 4.6},
      {'image': 'assets/images/fries.png', 'name': 'French Fries', 'price': 2.99, 'rating': 4.2},
      {'image': 'assets/images/tacos.png', 'name': 'Tacos', 'price': 9.99, 'rating': 4.4},
      {'image': 'assets/images/smoothie.png', 'name': 'Fruit Smoothie', 'price': 4.99, 'rating': 4.8},
      {'image': 'assets/images/icecream.png', 'name': 'Ice Cream', 'price': 3.49, 'rating': 4.9},
      {'image': 'assets/images/steak.png', 'name': 'Grilled Steak', 'price': 19.99, 'rating': 4.6},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
      ),
      body: Column(
        children: [
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
