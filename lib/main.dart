import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/register_product_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda Móvil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4285F4)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        '/register-product': (context) => const RegisterProductScreen(),
        '/product-list': (context) => const ProductListScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}


