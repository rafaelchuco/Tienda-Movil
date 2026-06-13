import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.systemBlue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cube_box_fill),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell_fill),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: 'Ajustes',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (_) => const HomeScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (_) => const SearchScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (_) => const ProductListScreen(),
            );
          case 3:
            return CupertinoTabView(
              builder: (_) => const CartScreen(),
            );
          case 4:
            return CupertinoTabView(
              builder: (_) => const NotificationsScreen(),
            );
          case 5:
            return CupertinoTabView(
              builder: (_) => const ProfileScreen(),
            );
          case 6:
          default:
            return CupertinoTabView(
              builder: (_) => const SettingsScreen(),
            );
        }
      },
    );
  }
}
