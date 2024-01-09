import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/ui/screens/home_screen.dart';
import 'package:craft_bay/presentation/ui/screens/wishList.dart';
import 'package:craft_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'carts.dart';
import 'category_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex=0;
  final List<Widget> _screen=[
    HomeScreen(),
    CategoryScreen(),
    CartsScreen(),
    WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNabController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.CurrentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            onTap: controller.ChangeIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Carts"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),label: "Wishlist"),
            ],
          ),

        );
      }
    );
  }
}
