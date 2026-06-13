import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Inicio'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Hola, Rafael',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bienvenido a Tienda Móvil',
                style: TextStyle(
                  fontSize: 17,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
              const SizedBox(height: 32),
              CupertinoListSection.insetGrouped(
                header: const Text('Resumen'),
                children: const [
                  CupertinoListTile(
                    leading: Icon(
                      CupertinoIcons.cube_box,
                      color: CupertinoColors.systemBlue,
                    ),
                    title: Text('Productos registrados'),
                    additionalInfo: Text('12'),
                  ),
                  CupertinoListTile(
                    leading: Icon(
                      CupertinoIcons.cart_fill,
                      color: CupertinoColors.systemGreen,
                    ),
                    title: Text('Ventas del mes'),
                    additionalInfo: Text('48'),
                  ),
                  CupertinoListTile(
                    leading: Icon(
                      CupertinoIcons.star_fill,
                      color: CupertinoColors.systemOrange,
                    ),
                    title: Text('Valoración promedio'),
                    additionalInfo: Text('4.8'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
