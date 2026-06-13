import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'product_list_screen.dart';
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
            icon: Icon(CupertinoIcons.cube_box_fill),
            label: 'Productos',
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
              builder: (_) => const ProductListScreen(),
            );
          case 2:
            return CupertinoTabView(
              builder: (_) => const ProfileScreen(),
            );
          case 3:
          default:
            return CupertinoTabView(
              builder: (_) => const SettingsScreen(),
            );
        }
      },
    );
  }
}
