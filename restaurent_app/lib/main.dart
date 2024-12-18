import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'food_detail_screen.dart';
import 'order_screen.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/foodDetail': (context) => FoodDetailScreen(
          image: 'assets/images/burger.jpg',
          name: 'Burger',
          price: 8.99,
          rating: 4.5,
          description: 'A delicious burger made with fresh ingredients.',
        ),
        '/order': (context) => const OrderScreen(),
      },
    );
  }
}
